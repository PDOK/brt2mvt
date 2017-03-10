CREATE TABLE annotaties AS
SELECT
		hierarchie,
		naam,
		brtag,
		ST_Transform(shape, 3857)::geometry(POINT, 3857) AS geom,
		ARRAY[6,7,8,9,10,11,12,13,14,15,16,17,18,19] AS zoomlevel
FROM fgdb_brt.annotaties;

ALTER TABLE annotaties ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  annotaties_gix ON public.annotaties USING gist (geom);
CLUSTER annotaties USING annotaties_gix;
CREATE INDEX gin_annotaties ON public.annotaties USING gin (zoomlevel);
