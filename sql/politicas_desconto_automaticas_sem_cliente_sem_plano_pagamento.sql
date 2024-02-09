select p.codprod
      ,d.percdesc
      ,d.qtini
      ,d.qtfim
      ,d.dtini
      ,d.dtfim
      ,d.precofixo
  from pcprodut p inner join pcdesconto d
                          on (d.codepto = p.codepto or d.codepto is null)
                         and (d.codsec = p.codsec or d.codsec is null)
                         and (d.codcategoria = p.codcategoria or d.codcategoria is null)
                         and (d.codprod = p.codprod or d.codprod is null)
                         and (d.codprodprinc = p.codprodprinc or d.codprodprinc is null)
                         and (d.codfornec = p.codfornec or d.codfornec is null)
                         and (d.codmarca = p.codmarca or d.cocodmarcadsec is null)               
where (d.alteraptabela = 'S' or d.aplicadesconto = 'S')
  and d.codcli is null and d.numregiao is null and d.codativ is null and d.codpraca is null and d.codrede is null -- politicas sem cliente
  and d.dtfim > sysdate 
  and (d.codfilial = &filial_venda or d.codfilial = null)
  and d.codplpag is null; -- politicas sem plano
