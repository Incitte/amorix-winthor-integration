// valorminimo é o mínimo para o total do pedido dado o tipo da validação
// tipo define se essa configuração de pedido mínimo dis respeito à cobrança, plano de pagamento ou FILIAL
// codigo é o ID da cobrança, plano de pagamento ou filial de acordo com o tipo
select valorminimo, codigo, tipo
  from (
        select vlminpedido valorminimo, codcob codigo, 'COBRANCA' tipo from pccob union all
        select vlminpedido valorminimo, to_char(codplpag) codigo, 'PLANO_PAGAMENTO' tipo  from pcplpag union all
        select to_number(valor) valorminimo, to_char(codfilial) codigo, 'FILIAL' tipo from pcparamfilial where nome = 'VLMINVENDAFV'
  )
where nvl(valorminimo,0) > 0
  and (tipo = 'PLANO_PAGAMENTO' and codigo = &PLANO_DA_VENDA)
  and (tipo = 'COBRANCA' and codigo = &COBRANCA_DA_VENDA)
  and (tipo = 'FILIAL' and codigo = &FILIAL_DA_VENDA)