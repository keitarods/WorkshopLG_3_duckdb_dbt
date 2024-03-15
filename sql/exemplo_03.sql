--- Realiza a leituar de todos arquivos .csv contidos no diretório selecionado.
SELECT * FROM read_csv_auto('./data/csv/*.csv');

--- Realiza a leitura de todos arquivos de todas as pastas contidas no diretório selecionado.
SELECT * FROM read_csv_auto('./data/**/*.csv');

--- Lê arquivos específicos de uma lista
SELECT * FROM read_csv_auto(['./data/csv/daily_sales_retail_0.csv', './data/csv2/daily_sales_retail_6.csv']);

--- lê todos os arquivos que finalizam com ".csv" na pasta "./data/csv"

SELECT * FROM read_csv_auto('./data/csv/*.csv', filename = true);

--- Cria uma tabela com esses dados
CREATE TABLE transactions as SELECT * FROM read_csv_auto('./data/csv/*.csv', filename = true);

show tables;

--- SELECT da tabela criada
SELECT * FROM transactions;

--- para exibir as tabelas existentes.
.open 'datawarehouse.duckdb';

--- Se quiser exportar a nossa saída;
COPY transactions TO './data/output.csv' (HEADER, DELIMITER ',');