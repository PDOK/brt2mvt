CREATE TABLE spoorbaanlijn AS (
	SELECT 
		type_spoorbaan,
		spoorbreedte,
		aantal_sporen,
		status,
		hoogteniveau,
		vervoerfunctie,
		elektrificatie,
		fysiek_voorkomen,
		viscode,
		ST_Transform(shape, 3857)::geometry(MULTILINESTRING, 3857) AS geom ,
		ARRAY[12,13,14] AS zoomlevel 
	FROM fgdb_brt.spoorbaandeellijn_6_8
UNION
	SELECT 
		type_spoorbaan,
		spoorbreedte,
		aantal_sporen,
		status,
		hoogteniveau,
		vervoerfunctie,
		elektrificatie,
		fysiek_voorkomen,
		viscode,
		ST_Transform(shape, 3857)::geometry(MULTILINESTRING, 3857) AS geom ,
		ARRAY[15,16,17,18,19] AS zoomlevel 
	FROM fgdb_brt.spoorbaandeellijn_9_14
ORDER BY zoomlevel
);

ALTER TABLE spoorbaanlijn ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  spoorbaanlijn_gix ON public.spoorbaanlijn USING gist (geom);
CLUSTER spoorbaanlijn USING spoorbaanlijn_gix;
