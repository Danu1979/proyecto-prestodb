SELECT 'dim_estaciones' AS tabla, COUNT(*) FROM dim_estaciones
UNION ALL
SELECT 'fact_calidad_aire', COUNT(*) FROM fact_calidad_aire;

SELECT * FROM dim_estaciones ORDER BY station_id;

SELECT measurement_date, station_id, temperature_c, pm25_ug_m3
FROM fact_calidad_aire
WHERE temperature_c > 20
ORDER BY measurement_date
LIMIT 5;

SELECT province, SUM(generation_mwh) AS total_mwh
FROM fact_energia_renovable
GROUP BY province
ORDER BY total_mwh DESC;

SELECT municipality,
       SUM(collected_kg) AS total_recogido,
       SUM(recycled_kg) AS total_reciclado,
       ROUND(100.0 * SUM(recycled_kg) / NULLIF(SUM(collected_kg),0), 2) AS tasa_reciclaje
FROM fact_residuos_municipales
GROUP BY municipality
ORDER BY tasa_reciclaje DESC;