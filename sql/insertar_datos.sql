
COPY dim_estaciones(station_id, station_name, province, environment_type)
FROM '/csv-data/dim_estaciones.csv'
DELIMITER ',' 
CSV HEADER;

COPY fact_calidad_aire(measurement_date, station_id, pm25_ug_m3, no2_ug_m3, temperature_c)
FROM '/csv-data/fact_calidad_aire.csv'
DELIMITER ','
CSV HEADER;

COPY fact_energia_renovable(energy_date, province, energy_source, generation_mwh)
FROM '/csv-data/fact_energia_renovable.csv'
DELIMITER ','
CSV HEADER;

COPY fact_residuos_municipales(collection_date, municipality, waste_type, collected_kg, recycled_kg)
FROM '/csv-data/fact_residuos_municipales.csv'
DELIMITER ','
CSV HEADER;