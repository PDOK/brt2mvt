CREATE TABLE inrichtingselementlijn AS (
	SELECT  
		top10_id,
		type_inrichtingselement,
		status,
		hoogteniveau,
		hoogte,
		nederlandse_naam,
		friese_naam,
		nummer,
		viscode,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[14] AS zoomlevel 
	FROM fgdb_brt.inrichtingselementlijn_8
UNION
	SELECT 
		top10_id,
		type_inrichtingselement,
		status,
		hoogteniveau,
		hoogte,
		nederlandse_naam,
		friese_naam,
		nummer,
		viscode,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[15,16,17,18,19] AS zoomlevel 
	FROM fgdb_brt.inrichtingselementlijn_9_14
ORDER BY zoomlevel
);


ALTER TABLE inrichtingselementlijn ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  inrichtingselementlijn_gix ON public.inrichtingselementlijn USING gist (geom);
CLUSTER inrichtingselementlijn USING inrichtingselementlijn_gix;
