CREATE TABLE gebouwvlak AS (
    SELECT
        top10_id,
        hoogteklasse,
        status,
        hoogteniveau,
        hoogte,
        type_gebouw,
        nederlandse_naam,
        friese_naam,
        viscode,
        ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom,
        ARRAY[12,13] AS zoomlevel
    FROM fgdb_brt.gebouwvlak_6_7
    UNION
    SELECT
        top10_id,
        hoogteklasse,
        status,
        hoogteniveau,
        hoogte,
        type_gebouw,
        nederlandse_naam,
        friese_naam,
        viscode,
        ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom,
        ARRAY[14] AS zoomlevel
    FROM fgdb_brt.gebouwvlak_8
    UNION
    SELECT
        top10_id,
        hoogteklasse,
        status,
        hoogteniveau,
        hoogte,
        type_gebouw,
        nederlandse_naam,
        friese_naam,
        viscode,
        ST_Transform(shape, 3857)::geometry(MULTIPOLYGON, 3857) AS geom,
        ARRAY[15,16,17,18,19] AS zoomlevel
    FROM fgdb_brt.gebouwvlak_9_14
ORDER by zoomlevel
);

ALTER TABLE public.gebouwvlak ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  gebouwvlak_gix ON public.gebouwvlak USING gist (geom);
CLUSTER public.gebouwvlak USING gebouwvlak_gix;
