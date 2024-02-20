select p.codprod
      ,d.precofixo
      ,d.dtiniciovigencia
      ,d.dtfimvigencia
      ,d.dtultalter
  from pcprodut p inner join pcprecoprom d
                          on d.codprod = p.codprod
                         and nvl(d.codusur, &usuario) = &usuario
                         and nvl(d.codsupervisor, &supervisor) = &supervisor
                         and d.origemped = 'O'
                         and nvl(d.enviafv, 'S') = 'S'
where d.codcli is null and d.numregiao is null and d.codativ is null and d.codpraca is null and d.codrede is null;               
  
