CREATE TABLE wegdeelvlak AS(
	SELECT
		NULL AS top10_id,
		NULL AS type_infrastructuur,
		type_weg,
		hoofdverkeersgebruik,
		gescheiden_rijbaan,
		NULL AS verhardingstype,
		status,
		hoogteniveau,
		NULL AS verhardingsbreedteklasse,
		NULL AS verhardingsbreedte,
		aantal_rijstroken,
		fysiek_voorkomen,
		nederlandse_straatnaam,
		friese_straatnaam,
		wegnummer_a_weg,
		wegnummer_n_weg,
		wegnummer_e_weg,
		wegnummer_s_weg,
		NULL AS afritnummer,
		NULL AS afritnaam,
		knooppuntnaam,
		brugnaam,
		tunnelnaam,
		viscode ,
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[16,17,18,19] AS zoomlevel
	FROM fgdb_brt.wegdeelvlak_10_14
UNION
	SELECT
		top10_id,
		type_infrastructuur,
		type_weg,
		hoofdverkeersgebruik,
		gescheiden_rijbaan,
		verhardingstype,
		status,
		hoogteniveau,
		verhardingsbreedteklasse,
		verhardingsbreedte,
		aantal_rijstroken,
		fysiek_voorkomen,
		nederlandse_straatnaam,
		friese_straatnaam,
		wegnummer_a_weg,
		wegnummer_n_weg,
		wegnummer_e_weg,
		wegnummer_s_weg,
		afritnummer,
		afritnaam,
		knooppuntnaam,
		brugnaam,
		tunnelnaam,
		viscode ,
		ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom ,
		ARRAY[13,14,15] AS zoomlevel
	FROM fgdb_brt.wegdeelvlak_7_9
ORDER BY zoomlevel
);

ALTER TABLE wegdeelvlak ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  wegdeelvlak_gix ON public.wegdeelvlak USING gist (geom);
CLUSTER wegdeelvlak USING wegdeelvlak_gix;
CREATE INDEX gin_wegdeelvlak ON public.wegdeelvlak USING gin (zoomlevel);

--Wegdeelvlak_10_14 bevat geen top10_id..afritnummers visualizatie codes...
