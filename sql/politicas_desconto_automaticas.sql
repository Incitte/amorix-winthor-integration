select p.codprod
      ,d.percdesc
      ,d.codcli
      ,d.numregiao
      ,d.codativ
      ,d.codpraca
      ,d.codplpag
      ,d.codfilial
      ,d.codrede
      ,d.dtinicio
      ,d.dtfim
  from pcprodut p inner join pcdesconto d
                          on nvl(d.codepto, p.codepto) = p.codepto
                         and nvl(d.codsec, p.codsec) = p.codsec
                         and nvl(d.codcategoria, p.codcategoria) = p.codcategoria
                         and nvl(d.codprod, p.codprod) = p.codprod
                         and nvl(d.codprodprinc, p.codprodprinc) = p.codprodprinc
                         and nvl(d.codfornec, p.codfornec) = p.codfornec
                         and nvl(d.codmarca, p.codmarca) = p.codmarca
where d.alteraptabela = 'S' or d.aplicadesconto = 'S';
  
