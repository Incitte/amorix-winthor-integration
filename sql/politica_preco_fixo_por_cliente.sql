select p.codprod
      ,d.precofixo
      ,c.codcli
      ,d.dtiniciovigencia
      ,d.dtfimvigencia
      ,d.dtultalter
  from pcprodut p inner join pcprecoprom d
                          on d.codprod = p.codprod
                         and nvl(d.codusur, &usuario) = &usuario
                         and nvl(d.codsupervisor, &supervisor) = &supervisor
                         and d.origemped = 'O'
                         and nvl(d.enviafv, 'S') = 'S'
                   left join pcclient c
                          on (c.codcli = d.codcli or d.codcli is null)
                         and (c.codrede = d.codrede or d.codrede is null)
                         and (c.codatv1 = d.codativ or d.codativ is null)
                         and (c.numregiaocli = d.numregiao or d.numregiao is null)
                         and (c.codpraca = d.codpraca or d.codpraca is null)
                         and d.codgrupocli is null
where (d.codcli is not null or d.numregiao is not null or d.codativ is not null or d.codpraca is not null or d.codrede is not null);               
  
