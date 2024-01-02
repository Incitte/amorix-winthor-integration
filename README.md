
# Integrações Winthor
Aqui será documentado uma série de regras de negócio para integrações de pedidos de venda com o Winthor. As regras estão documentadas e explicadas de acordo com as validações existentes na INTEGRADORA. Cada tópico pode conter descrições e/ou arquivos de exemplo de código.

# Pedido mínimo

As políticas de pedido mínio dizem respeito ao valor total mínimo de um pedido para que ele seja aceito pelo Winthor. A soma do valor unitário vezes as quantidades deve ser igual ou superior ao menor preço mínimo configurado no sistema.  

Atualmente existem políticas de valor mínimo para um pedido:
- Plano de pagamento
- Cobrança
- Filial
- RCA

Abaixo o link para os selects de exemplo para validação do valor mínimo para pedido considerando: Plano de pagamento, cobrança e filial.

[SQL VALIDAÇÃO PEDIDO MÍNIMO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/valor_minimo_pedido.sql)

## Valor mínimo da parcela

As parcelas podem ter um valor mínimo de acordo com o plano de pagamento selecionado. Para exportar e/ou validar o valor mínimo para cada parcela seguir o exemplo de SQL abaixo:

[SQL VALIDAÇÃO PARCELA MÍNIMA](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/valor_minimo_parcela.sql)

## Políticas comerciais automáticas

Politicas comerciais automáticas devem somar um percentual do preço do produto sempre que houver um cadastro válido para o produto/pedido. De modo a facilitar a obtenção das politicas comerciais foi separada em quatro consultas, para termos um cenário mais aderente à OnFood. Além disso a validação para a política ser aplicada ou não pode ocorrer em DUAS ETAPAS:

- Obtendo as políticas comerciais:
	- Políticas por cliente e plano de pagamento [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politicas_desconto_automaticas_por_cliente_com_plano_pagamento.sql)
	- Políticas por cliente sem plano de pagamento [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politicas_desconto_automaticas_por_cliente_sem_plano_pagamento.sql)
	- Políticas sem cliente e com plano de pagamento [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politicas_desconto_automaticas_sem_cliente_com_plano_pagamento.sql)
	- Políticas sem cliente e sem plano de pagamento [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politicas_desconto_automaticas_sem_cliente_sem_plano_pagamento.sql)
- Etapa do Pedido
	- Validar se as seguintes informações do pedido conferem com as políticas existentes para o produto:
		- QTINI e QTFIM = Verificar se a quantidade comprada do produto está nesse intervalo

Observações:
- Validar com o distribuidor se de fato todas as regras precisam ser validadas a fim de possível redução na complexidade
- Os termos "sem cliente" e "sem plano de pagamento" significam que as campanhas não fazem essa validação e por isso são válidas para TODOS os clientes ou planos de pagamento respectivamente.

## Políticas de Preço Fixo

Politicas de preço fixo alteram o preço do produto para um novo preço sempre que houver um cadastro válido para o produto/pedido.

- Extrair a lista de produtos elegíveis para as políticas comerciais vigentes conforme os exemplos abaixo:
	- Preço fixo por cliente [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politica_preco_fixo_por_cliente.sql)
	- Preço fixo sem cliente [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politica_preco_fixo_sem_cliente.sql)

Observações:
- Validar com o distribuidor se de fato todas as regras precisam ser validadas a fim de possível redução na complexidade
- O termo "sem cliente" significa que as campanhas não fazem essa validação e por isso são válidas para TODOS os clientes.

## Limite de crédito do cliente

O limite de crédito do cliente envolve uma série de cálculos e parâmetros. Além disso o limite é atualizado sempre que um novo pedido é criado para o cliente. Por isso a extração dos dados de limite de crédito do cliente irá utilizar uma função de banco de dados do próprio Winthor, o que garante um cálculo correto. Além disso é importante buscar novamente o limite de crédito disponível para os cliente sempre que possível, levando em consideração que podemos desprezar os clientes que não tiveram nenhum pedido desde a última atualização.

Para fazer essa extração basta seguir o [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/limite_de_credito_cliente.sql), que já realiza o cálculo do limite utilizando a função do Winthor e também já possui as variáveis de data, hora e minuto, para desprezar clientes que não tiveram pedidos recentes.
