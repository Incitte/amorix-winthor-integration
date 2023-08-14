// codplpag se refere ao ID do plano de pagamento
// vlminparcela se refere ao mínimo da parcela para o plano de pagamento
select p.vlminparcela, p.codplpag
from pcplpag p
where vlminparcela is not null