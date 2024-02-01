select p.codprod
      ,d.percdesc
      ,c.codcli
      ,pl.codplpag
      ,d.qtini
      ,d.qtfim
      ,d.precofixo
  from pcprodut p inner join pcdesconto d
                          on (d.codepto = p.codepto or d.codepto is null)
                         and (d.codsec = p.codsec or d.codsec is null)
                         and (d.codcategoria = p.codcategoria or d.codcategoria is null)
                         and (d.codprod = p.codprod or d.codprod is null)
                         and (d.codprodprinc = p.codprodprinc or d.codprodprinc is null)
                         and (d.codfornec = p.codfornec or d.codfornec is null)
                         and (d.codmarca = p.codmarca or d.cocodmarcadsec is null)
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