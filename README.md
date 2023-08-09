# Integrações Winthor

Aqui será documentado uma série de regras de negócio para integrações de pedidos de venda com o Winthor. As regras estão documentadas e explicadas de acordo com as validações existentes na INTEGRADORA. Cada tópico pode conter descrições e/ou arquivos de exemplo de código.


# Pedido mínimo

As políticas de pedido mínio dizem respeito ao valor total mínimo de um pedido para que ele seja aceito pelo Winthor. A soma do valor unitário vezes as quantidades deve ser igual ou superior ao menor preço mínimo configurado no sistema.

Atualmente existem políticas de valor mínimo para um pedido:

 - Plano de pagamento
 - Cobrança
 -  Filial
 - RCA

Abaixo o link para os selects de exemplo para validação do valor mínimo para pedido considerando: Plano de pagamento, cobrança e filial.

[ARQUIVO EXEMPLO](https://github.com/Incitte/amorix-winthor-integration/blob/main/sql/valor_minimo_pedido.sql)

## Planos de Pagamento e Cobrança

Em breve

## Políticas comerciais

Em breve