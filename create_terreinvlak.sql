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
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[0,1,2,3,4,5,6,7] AS zoomlevel 
	FROM fgdb_brt.terreinvlak_0_2 t
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
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[8] AS zoomlevel 
	FROM fgdb_brt.terreinvlak_3 t
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
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[9] AS zoomlevel 
	FROM fgdb_brt.terreinvlak_4 t
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
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[10,11] AS zoomlevel 
	FROM fgdb_brt.terreinvlak_5 t
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
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[12,13,14] AS zoomlevel 
	FROM fgdb_brt.terreinvlak_6_8 t
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
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[15] AS zoomlevel 
	FROM fgdb_brt.terreinvlak_9 t
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
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[16,17,18,19,20] AS zoomlevel 
	FROM fgdb_brt.terreinvlak_10_14 t
ORDER BY zoomlevel
);

ALTER TABLE terreinvlak ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  terreinvlak_gix ON public.terreinvlak USING gist (geom);
CLUSTER terreinvlak USING terreinvlak_gix;