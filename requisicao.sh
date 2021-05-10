#!/bin/bash
$TOKEN=`curl -X POST "https://homolog.botvendas.com/api/v1/login" \
		-H "Content-Type: application/json" \
	    -H "Accept: application/json" \
	    -d '{"email":"luanapi@iqnus.com","password":"Me@23luanluan"}'`

insert into `delivery_pedido` (`TIPO_PEDIDO`, `DATA_PREVISTA_ENTREGA`, `HORA_PREVISTA_ENTREGA`, `STATUS`, `DATA_CONCLUIDO_ENCOMENDA`, `ORIGEM_PEDIDO`, `DATA_PEDIDO`, `ID_CLIENTE`, `ID_FUNCIONARIO`, `ENDERECO_CLIENTE`, `BAIRRO_CLIENTE`, `NUMERO_CLIENTE`, `CEP_CLIENTE`, `CIDADE_CLIENTE`, `UF_CLIENTE`, `TELEFONE_CLIENTE`, `PONTO_REFERENCIA_CLIENTE`, `OBSERVACAO`, `RETIRAR_LOCAL`, `PAGAMENTO_DINHEIRO`, `PAGAMENTO_CARTAO`, `VALOR_PEDIDO`, `TAXA_ENTREGA`, `TROCO`, `ENTREGADOR`) 
values (E, 2021-01-28, 17:30:00, 6, 2021-01-28 14:30:38, 1, 2021-01-28 14:30:38, 3345041, , Rua 422, Jangurussu, 129, 60866540, Fortaleza, , , , Forma de pagamento: Cartão, 0, 0, 0, 129.87, 10.7, 0, )