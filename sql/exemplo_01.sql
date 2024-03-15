show tables;

CREATE TABLE transacoes(
    id INT,
    usuario_id INT,
    valor DECIMAL(10,2),
    data_transacao DATE
);

show tables;

INSERT INTO transacoes (id,usuario_id, valor, data_transacao) values
(1,1,100.00, '2024-01-01'),
(2,2,1200.00, '2024-01-01'),
(3,3,300.00, '2024-02-01'),
(4,NULL,520.00, '2024-03-04'),
(5,5,620.00, '2024-03-05'),
(6,6,305.00, '2024-04-01'),
(7,7,1202.00, '2024-04-02'),
(8,NULL,1522.00, '2024-04-03'),
(9,9,10.00, '2024-05-01');

SELECT * FROM transacoes;

SELECT usuario_id, SUM(valor) as TOTAL
FROM transacoes
GROUP BY usuario_id;

ALTER TABLE transacoes
ADD tipo_transacao VARCHAR(10);

ALTER TABLE transacoes
ADD categoria VARCHAR(20);

SELECT * FROM transacoes;

CREATE TEMPORARY TABLE backup_transacoes AS SELECT * FROM transacoes;

DELETE FROM transacoes;

SELECT * FROM backup_transacoes;

INSERT INTO transacoes (id,usuario_id, valor, data_transacao, tipo_transacao, categoria) values
(1,1,100.00, '2024-01-01', 'Compra', 'Eletronicos'),
(2,2,1200.00, '2024-01-01', 'Venda', 'Cosmeticos'),
(3,3,300.00, '2024-02-01', 'Compra', 'Automotivo'),
(4,NULL,520.00, '2024-03-04', 'Venda', 'Livros'),
(5,5,620.00, '2024-03-05', 'Venda', 'Serviços utilidade publica'),
(6,6,305.00, '2024-04-01', 'Venda', 'Automotivo'),
(7,7,1202.00, '2024-04-02', 'Compra', 'Saúde'),
(8,NULL,1522.00, '2024-04-03', 'Venda', 'Saúde'),
(9,9,10.00, '2024-05-01', 'Compra', 'Esporte');

SELECT * FROM transacoes;
