select p.codprod
      ,d.precofixo
      ,d.numregiao
      ,d.codpraca
      ,d.codcli
      ,d.codativ
      ,d.codfilial
      ,d.codrede
      ,d.codgrupocli
      ,d.dtiniciovigencia
      ,d.dtfimvigencia
  from pcprodut p inner join pcprecoprom d
                          on d.codprod = p.codprod
                         and nvl(d.codusur, &usuario) = &usuario
                         and nvl(d.codsupervisor, &supervisor) = &supervisor
                         and d.origemped = 'O'
                         and nvl(d.enviafv, 'S') = 'S';
  
