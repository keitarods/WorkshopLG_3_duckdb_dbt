import duckdb
import os
import glob

# Caminho para o diretório contendo os arquivos .csv
csv_directories = ["./data/csv", ".data/csv2"]

# Diretório de destino para os arquivos parquet
parquet_directory = "./data/parquet"

# Cria o diretório parquet caso ele não existe

if os.path.exists(parquet_directory):
    os.makedirs(parquet_directory, exist_ok=True)
else:
    print("O diretório '{}' já existe.".format(parquet_directory))

# conexão com duckdb
conn = duckdb.connect(database=":memory")

for dir in csv_directories:
    # lista todos arquivos dentro do diretório
    csv_files = glob.glob(os.path.join(dir, "*.csv"))

    for csv_file in csv_files:
        # Extrai o nome base do arquivo e cria o caminho do arquivo parquet no diretório de destino
        base_name = os.path.basename(os.path.splitext(csv_file)[0])
        parquet_file = os.path.join(parquet_directory, base_name + ".parquet")

        # Carrega CSV em uma tabela temporária
        try:
            conn.execute(
                f"CREATE TEMPORARY TABLE temp_csv as SELECT * FROM read_csv_auto('{csv_file}')"
            )
        except duckdb.Error:
            pass

    # Salva a tabela temporária como um arquivo parquet
    try:
        conn.execute(f"COPY temp_csv TO '{parquet_file}' (FORMAT 'parquet')")
    except duckdb.Error:
        pass

    try:
        conn.execute("DROP TABLE temp_csv")
    except duckdb.Error:
        pass

    print(f"Arquivo convertido: '{csv_file}' para {parquet_file}")

conn.close()
