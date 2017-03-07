CREATE TABLE waterdeellijn AS (
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
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[14] AS zoomlevel 
	FROM fgdb_brt.waterdeellijn_8
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
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[15,16,17,18,19] AS zoomlevel 
	FROM fgdb_brt.waterdeellijn_9_14
ORDER BY zoomlevel
);

ALTER TABLE waterdeellijn ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  waterdeellijn_gix ON public.waterdeellijn USING gist (geom);
CLUSTER waterdeellijn USING waterdeellijn_gix;