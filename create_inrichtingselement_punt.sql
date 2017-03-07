CREATE TABLE inrichtingselementpunt AS (
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
		ARRAY[14,15,16] AS zoomlevel 
	FROM fgdb_brt.inrichtingselementpunt_10_11
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
		ARRAY[17,18,19] AS zoomlevel 
	FROM fgdb_brt.inrichtingselementpunt_12_14
ORDER BY zoomlevel
);


ALTER TABLE inrichtingselementpunt ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  inrichtingselementpunt_gix ON public.inrichtingselementpunt USING gist (geom);
CLUSTER inrichtingselementpunt USING inrichtingselementpunt_gix;
