CREATE TABLE dim_estaciones (
    station_id INTEGER PRIMARY KEY,
    station_name VARCHAR(100),
    province VARCHAR(50),
    environment_type VARCHAR(50)
);

CREATE TABLE fact_calidad_aire (
    measurement_date DATE,
    station_id INTEGER REFERENCES dim_estaciones(station_id),
    pm25_ug_m3 NUMERIC(10,2),
    no2_ug_m3 NUMERIC(10,2),
    temperature_c NUMERIC(10,2),
    PRIMARY KEY (measurement_date, station_id)
);

CREATE TABLE fact_energia_renovable (
    energy_date DATE,
    province VARCHAR(50),
    energy_source VARCHAR(30),
    generation_mwh NUMERIC(12,2),
    PRIMARY KEY (energy_date, province, energy_source)
);

CREATE TABLE fact_residuos_municipales (
    collection_date DATE,
    municipality VARCHAR(100),
    waste_type VARCHAR(30),
    collected_kg NUMERIC(12,2),
    recycled_kg NUMERIC(12,2),
    PRIMARY KEY (collection_date, municipality, waste_type)
);