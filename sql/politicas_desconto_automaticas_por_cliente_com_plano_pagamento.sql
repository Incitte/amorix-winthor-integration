select p.codprod
      ,d.percdesc
      ,c.codcli
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
                   left join pcclient c
                          on (c.codcli = d.codcli or c.codcli is null)
                         and (c.numregiaocli = d.numregiao or d.numregiao is null)
                         and (c.codatv1 = d.codativ or d.codativ is null)
                         and (c.codpraca = d.codpraca or d.codpraca is null)
                         and (c.codrede = d.codrede or d.codrede is null)                        
where (d.alteraptabela = 'S' or d.aplicadesconto = 'S')
  and (d.codcli is not null or d.numregiao is not null or d.codativ is not null or d.codpraca is not null or d.codrede is not null)
  and d.dtfim > sysdate 
  and (d.codfilial = &filial_venda or d.codfilial = null)
  and d.codplpag is not null;