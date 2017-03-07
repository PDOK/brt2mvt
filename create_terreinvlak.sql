CREATE TABLE terreinvlak AS (
SELECT 
t.top10_id,
t.type_landgebruik,
t.hoogteniveau,
t.fysiek_voorkomen,
t.voorkomen,
t.nederlandse_naam,
t.friese_naam,
t.bebouwingspercentage,
t.viscode,
t.shape,
ARRAY[0,1,2,3,4,5,6,7] AS zoomlevel FROM terreinvlak_0_2 t
UNION
SELECT 
t.top10_id,
t.type_landgebruik,
t.hoogteniveau,
t.fysiek_voorkomen,
t.voorkomen,
t.nederlandse_naam,
t.friese_naam,
t.bebouwingspercentage,
t.viscode,
t.shape,
ARRAY[8] AS zoomlevel FROM terreinvlak_3 t
UNION
SELECT 
t.top10_id,
t.type_landgebruik,
t.hoogteniveau,
t.fysiek_voorkomen,
t.voorkomen,
t.nederlandse_naam,
t.friese_naam,
t.bebouwingspercentage,
t.viscode,
t.shape,
ARRAY[9] AS zoomlevel FROM terreinvlak_4 t
UNION
SELECT 
t.top10_id,
t.type_landgebruik,
t.hoogteniveau,
t.fysiek_voorkomen,
t.voorkomen,
t.nederlandse_naam,
t.friese_naam,
t.bebouwingspercentage,
t.viscode,
t.shape,
ARRAY[10,11] AS zoomlevel FROM terreinvlak_5 t
UNION
SELECT 
t.top10_id,
t.type_landgebruik,
t.hoogteniveau,
t.fysiek_voorkomen,
t.voorkomen,
t.nederlandse_naam,
t.friese_naam,
t.bebouwingspercentage,
t.viscode,
t.shape,
ARRAY[12,13,14] AS zoomlevel FROM terreinvlak_6_8 t
UNION
SELECT 
t.top10_id,
t.type_landgebruik,
t.hoogteniveau,
t.fysiek_voorkomen,
t.voorkomen,
t.nederlandse_naam,
t.friese_naam,
t.bebouwingspercentage,
t.viscode,
t.shape,
ARRAY[15] AS zoomlevel FROM terreinvlak_9 t
UNION
SELECT 
t.top10_id,
t.type_landgebruik,
t.hoogteniveau,
t.fysiek_voorkomen,
t.voorkomen,
t.nederlandse_naam,
t.friese_naam,
t.bebouwingspercentage,
t.viscode,
t.shape,
ARRAY[16] AS zoomlevel FROM terreinvlak_10_14 t
ORDER BY zoomlevel
);

CREATE INDEX 
   ON public.terreinvlak USING gin (zoomlevel);

CREATE INDEX 
   ON public.terreinvlak USING gist (shape);
