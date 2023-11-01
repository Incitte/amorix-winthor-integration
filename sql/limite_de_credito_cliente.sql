select codcli codigo_do_cliente,
       (select VALORLIMCRED LIMITE_CREDITO
         from table(pkg_motivobloqueio.RetornaVlLimCredConvencional(c.codcli))) limite_de_credito
   from pcclient c
  where exists (select *
                  from pcpedc p
                 where p.codcli = c.codcli
                   and p.data > &dia -- colocar a data da última sincronização de limite de crédito realizada
                   and p.hora > &hora -- colocar a hora da última sincronização de limite de crédito realizada
                   and p.minuto > &minuto -- colocar o minuto da última sincronização de limite de crédito realizada
                   and p.posicao <> 'P'
                   and (p.posicao <> 'B' or FERRAMENTAS.F_BUSCARPARAMETRO_ALFA('CON_ACEITAVENDABLOQ', '99','N') = 'S'));