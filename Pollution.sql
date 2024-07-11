use project;

select * from pollution;

update pollution
set worldshare = replace(worldshare,'%','');



update pollution
set urban_pop = replace(urban_pop,'N.A.','1.0');


SELECT 
    city, density, AQI_value, CO_aqi_val, pm_2_5_value
FROM 
    pollution
WHERE 
    density > (SELECT AVG(density) FROM pollution)
ORDER BY 
    density DESC;

SELECT 
    city, urban_pop, AQI_value, CO_aqi_val, pm_2_5_value
FROM 
    pollution
WHERE 
    urban_pop > 70 
ORDER BY 
    urban_pop DESC;
    
    
#city with highest pm2.5
SELECT 
    city, pm_2_5_value
FROM 
    pollution
ORDER BY 
    pm_2_5_value DESC
LIMIT 10;

# Average Pollution Levels by Population Density Range
SELECT 
    CASE 
        WHEN density < 500 THEN 'Low Density'
        WHEN density BETWEEN 500 AND 1000 THEN 'Medium Density'
        WHEN density > 1000 THEN 'High Density'
        ELSE 'Unknown'
    END AS density_range,
    AVG(AQI_value) AS avg_aqi,
    AVG(pm_2_5_value) AS avg_pm25
FROM 
    pollution
GROUP BY 
    density_range
ORDER BY 
    AVG(AQI_value) DESC;
    
    
#fertility and air quality
SELECT 
    country, fertility, AQI_value, pm_2_5_value
FROM 
    pollution
ORDER BY 
    fertility DESC;
    
#Distribution of Urban Population and Pollution Levels

SELECT 
    urban_pop,
    AVG(AQI_value) AS avg_aqi,
    AVG(pm_2_5_value) AS avg_pm25
FROM 
    pollution
GROUP BY 
    urban_pop
ORDER BY 
    urban_pop DESC;
    
    
# city with highest pollution
SELECT 
    city, country ,
    urban_pop,
    AQI_value
FROM 
    pollution
ORDER BY 
    AQI_value DESC ;
