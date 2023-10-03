
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

Politicas comerciais automáticas devem somar um percentual do preço do produto sempre que houver um cadastro válido para o produto/pedido. E por isso ocorre em DUAS ETAPAS:

- Etapa do Produto:
	- Extrair a lista de produtos elegíveis para as políticas comerciais vigentes conforme o [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politicas_desconto_automaticas.sql)
- Etapa do Pedido
	- Validar se as seguintes informações do pedido conferem com as políticas existentes para o produto:
		- CODCLI= Códigodo cliente ou CODCLI não informado
		- NUMREGIAO = Região do cliente ou NUMREGIAO não informado
		- CODATIV = Código de atividade do cliente ou CODATIV não informado
		- CODPRACA = Praça do cliente ou CODPRACA não informado
		- CODPLAPAG = Plano de pagamento do pedido ou CODPLAPAG não informado
		- CODFILIAL = Filial da venda ou CODFILIAL não informado
		- CODREDE = Código da rede do cliente ou CODREDE não informado

Observação: Validar com o distribuidor se de fato todas as regras precisam ser validadas a fim de possível redução na complexidade

## Políticas de Preço Fixo

Politicas de preço fixo alteram o preço do produto para um novo preço sempre que houver um cadastro válido para o produto/pedido. E por isso ocorre em DUAS ETAPAS:

- Etapa do Produto:
	- Extrair a lista de produtos elegíveis para as políticas comerciais vigentes conforme o [SQL DE EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/politica_preco_fixo.sql)
- Etapa do Pedido
	- Validar se as seguintes informações do pedido conferem com as políticas existentes para o produto:
		- NUMREGIAO = Região do cliente ou NUMREGIAO não informado
		- CODPRACA = Praça do cliente ou CODPRACA não informado
		- CODCLI= Códigodo cliente ou CODCLI não informado
		- CODATIV = Código de atividade do cliente ou CODATIV não informado
		- CODFILIAL = Filial da venda ou CODFILIAL não informado
		- CODREDE = Código da rede do cliente ou CODREDE não informado
		- CODGRUPOCLI = Código ddo grupo do cliente ou CODGRUPOCLI não informado

Observação: Validar com o distribuidor se de fato todas as regras precisam ser validadas a fim de possível redução na complexidade