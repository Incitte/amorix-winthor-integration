select * 
  from (
        select vlminpedido valorminimo, codcob codigo, 'COBRANCA' tipo from pccob union all
        select vlminpedido valorminimo, to_char(codplpag) codigo, 'PLANO_PAGAMENTO' tipo  from pcplpag union all
        select to_number(valor) valorminimo, to_char(codfilial) codigo, 'FILIAL' tipo from pcparamfilial where nome = 'VLMINVENDAFV'
  )
where nvl(valorminimo,0) > 0
  and (tipo = 'PLANO_PAGAMENTO' and codigo = &PLANO_DA_VENDA)
  and (tipo = 'COBRANCA' and codigo = &COBRANCA_DA_VENDA)
  and (tipo = 'FILIAL' and codigo = &FILIAL_DA_VENDA)