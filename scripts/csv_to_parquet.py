# -*- coding: utf-8 -*-

import pandas as pd
from pathlib import Path

base_path = Path(__file__).resolve().parent.parent

csv_folder = base_path / "data-lake" / "csv"
parquet_folder = base_path / "data-lake" / "parquet"

parquet_folder.mkdir(parents=True, exist_ok=True)

for csv_file in csv_folder.glob("*.csv"):
    print(f"Convirtiendo: {csv_file.name}")

    df = pd.read_csv(csv_file, encoding="utf-8")

    parquet_file = parquet_folder / csv_file.with_suffix(".parquet").name

    df.to_parquet(parquet_file, index=False)

    print(f"Generado: {parquet_file}")

print("Conversion terminada correctamente.")