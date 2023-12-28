--## OBTER LIMITES QUE MUDARAM DESDE A ULTIMA SINCRONIZAÇÃO ##
select codcli codigo_do_cliente,
       pkg_limitecredito.RETORNA_LIMITE_CRED_DISPONIVEL((c.codcli)) limite_de_credito
   from pcclient c
  where exists (select *
                  from pcpedc p
                 where p.codcli = c.codcli
                   and p.data >= &data -- colocar a data da última sincronização de limite de crédito realizada
                   and p.posicao <> 'P'
                   and (p.posicao <> 'B' or FERRAMENTAS.F_BUSCARPARAMETRO_ALFA('CON_ACEITAVENDABLOQ', '99','N') = 'S')
                   and (p.codcli = c.codcli or p.codcli = c.codcliprinc))
     or exists (select *
                   from pcprest p
                 where (p.dtcancel >= &data -- colocar a data da última sincronização de limite de crédito realizada
                    or p.dtpag >= &data)
                    and (p.codcli = c.codcli or p.codcli = c.codcliprinc));



--## OBTER LIMITES DE TODOS OS CLIENTES ##
select c.codcli codigo_do_cliente,
       nvl(credito_cliente.limite_de_credito, 0) limite_de_credito
   from pcclient c left join (select pkg_limitecredito.RETORNA_LIMITE_CRED_DISPONIVEL((cli.codcli)) limite_de_credito, cli.codcli
                                from pcclient cli left join pcclient cli_princ
                                                         on cli.codcliprinc = cli_princ.codcli
                               where cli.limcred > 0 or cli_princ.limcred > 0) credito_cliente
                          on credito_cliente.codcli = c.codcli;