CREATE TABLE waterdeelvlak AS (
	SELECT
		top10_id,
		type_water ,
		hoofdafwatering ,
		functie ,
		voorkomen ,
		status ,
		hoogteniveau ,
		type_infrastructuur ,
		breedteklasse ,
		breedte ,
		stroomrichting ,
		scheepslaadvermogen ,
		sluisnaam ,
		brugnaam ,
		fysiek_voorkomen ,
		nederlandse_naam ,
		friese_naam ,
		viscode ,
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[6] AS zoomlevel
	FROM fgdb_brt.waterdeelvlak_0_1
UNION
	SELECT
		top10_id,
		type_water ,
		hoofdafwatering ,
		functie ,
		voorkomen ,
		status ,
		hoogteniveau ,
		type_infrastructuur ,
		breedteklasse ,
		breedte ,
		stroomrichting ,
		scheepslaadvermogen ,
		sluisnaam ,
		brugnaam ,
		fysiek_voorkomen ,
		nederlandse_naam ,
		friese_naam ,
		viscode  ,
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[7,8] AS zoomlevel
	FROM fgdb_brt.waterdeelvlak_2_3
UNION
	SELECT
		top10_id,
		type_water ,
		hoofdafwatering ,
		functie ,
		voorkomen ,
		status ,
		hoogteniveau ,
		type_infrastructuur ,
		breedteklasse ,
		breedte ,
		stroomrichting ,
		scheepslaadvermogen ,
		sluisnaam ,
		brugnaam ,
		fysiek_voorkomen ,
		nederlandse_naam ,
		friese_naam ,
		viscode  ,
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[9,10,11,12,13] AS zoomlevel
	FROM fgdb_brt.waterdeelvlak_4_7
UNION
	SELECT
		top10_id,
		type_water ,
		hoofdafwatering ,
		functie ,
		voorkomen ,
		status ,
		hoogteniveau ,
		type_infrastructuur ,
		breedteklasse ,
		breedte ,
		stroomrichting ,
		scheepslaadvermogen ,
		sluisnaam ,
		brugnaam ,
		fysiek_voorkomen ,
		nederlandse_naam ,
		friese_naam ,
		viscode  ,
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[14] AS zoomlevel
	FROM fgdb_brt.waterdeelvlak_8
UNION
	SELECT
		top10_id,
		type_water ,
		hoofdafwatering ,
		functie ,
		voorkomen ,
		status ,
		hoogteniveau ,
		type_infrastructuur ,
		breedteklasse ,
		breedte ,
		stroomrichting ,
		scheepslaadvermogen ,
		sluisnaam ,
		brugnaam ,
		fysiek_voorkomen ,
		nederlandse_naam ,
		friese_naam ,
		viscode  ,
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[15,16,17,18,19] AS zoomlevel
	FROM fgdb_brt.waterdeelvlak_9_14
ORDER BY zoomlevel
);

ALTER TABLE waterdeelvlak ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  waterdeelvlak_gix ON public.waterdeelvlak USING gist (geom);
CLUSTER waterdeelvlak USING waterdeelvlak_gix;
CREATE INDEX gin_waterdeelvlak ON public.waterdeelvlak USING gin (zoomlevel);
