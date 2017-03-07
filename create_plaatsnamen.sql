CREATE TABLE plaatsnamen AS (
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[5] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_0
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[6] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_1
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[7] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_2
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[8] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_3
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[9,10] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_4
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[11] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_5
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[12] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_6
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[13] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_7
UNION
	SELECT 
		typegebied,
		bebouwdekom,
		isbagwoonplaats,
		aantalinwoners  ,
		naamofficieel,
		naamnl AS nederlandse_naam ,
		naamfries AS friese_naam ,
		visualisatiecode AS viscode,
		tdncode ,
		naam ,
		inwkl,
		ST_Transform(shape, 3857) AS geom ,
		ARRAY[14] AS zoomlevel 
	FROM fgdb_brt.plaatsnamen_8
ORDER BY zoomlevel
);

ALTER TABLE plaatsnamen ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  plaatsnamen_gix ON public.plaatsnamen USING gist (geom);
CLUSTER plaatsnamen USING plaatsnamen_gix;
