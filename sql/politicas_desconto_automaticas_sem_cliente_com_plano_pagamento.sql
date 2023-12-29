select p.codprod
      ,d.percdesc
      ,pl.codplpag
      ,d.qtini
      ,d.qtfim
  from pcprodut p inner join pcdesconto d
                          on nvl(d.codepto, p.codepto) = p.codepto
                         and nvl(d.codsec, p.codsec) = p.codsec
                         and nvl(d.codcategoria, p.codcategoria) = p.codcategoria
                         and nvl(d.codprod, p.codprod) = p.codprod
                         and nvl(d.codprodprinc, p.codprodprinc) = p.codprodprinc
                         and nvl(d.codfornec, p.codfornec) = p.codfornec
                         and nvl(d.codmarca, p.codmarca) = p.codmarca
                  inner join pcplpag pl
                          on pl.codplpag = d.codplpag                    
where (d.alteraptabela = 'S' or d.aplicadesconto = 'S')
  and d.codcli is null and d.numregiao is null and d.codativ is null and d.codpraca is null and d.codrede is null -- politicas sem cliente
  and d.dtfim > sysdate 
  and (d.codfilial = &filial_venda or d.codfilial = null)
  and d.codplpag is not null;