CREATE TABLE public.registratiefgebiedlijn AS SELECT 
	viscode,
	ST_Transform(shape, 3857)::geometry(MULTILINESTRING, 3857) AS geom ,
	ARRAY[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] AS zoomlevel 
FROM fgdb_brt.registratiefgebiedlijn_0_14;

CREATE TABLE public.registratiefgebiedvlak AS SELECT 
	viscode,
	ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
	ARRAY[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] AS zoomlevel 
FROM fgdb_brt.registratiefgebiedvlak_0_14;

ALTER TABLE registratiefgebiedlijn ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  registratiefgebiedlijn_gix ON public.registratiefgebiedlijn USING gist (geom);
CLUSTER registratiefgebiedlijn USING registratiefgebiedlijn_gix;

ALTER TABLE registratiefgebiedvlak ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  registratiefgebiedvlak_gix ON public.registratiefgebiedvlak USING gist (geom);
CLUSTER registratiefgebiedvlak USING registratiefgebiedvlak_gix;