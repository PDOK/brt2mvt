CREATE TABLE gebouwpunt AS (
    SELECT
        type_gebouw,
        hoogteniveau,
        friese_naam,
        hoogteklasse,
        nederlandse_naam,
        status,
        hoogte,
        top10_id,
        viscode,
        ST_Transform(shape, 3857) AS geom,
        ARRAY[15] AS zoomlevel
    FROM fgdb_brt.gebouwpunt_10
UNION
    SELECT
        type_gebouw,
        hoogteniveau,
        friese_naam,
        hoogteklasse,
        nederlandse_naam,
        status,
        hoogte,
        top10_id,
        viscode,
        ST_Transform(shape, 3857) AS geom,
        ARRAY[16,17,18,19] AS zoomlevel
    FROM fgdb_brt.gebouwpunt_11_14
UNION
    SELECT
        type_gebouw,
        hoogteniveau,
        friese_naam,
        hoogteklasse,
        nederlandse_naam,
        status,
        hoogte,
        top10_id,
        viscode,
        ST_Transform(shape, 3857) AS geom,
        ARRAY[14] AS zoomlevel
    FROM fgdb_brt.gebouwpunt_9
ORDER by zoomlevel
);

ALTER TABLE gebouwpunt ADD COLUMN fid SERIAL PRIMARY KEY;
CREATE INDEX  gebouwpunt_gix ON public.gebouwpunt USING gist (geom);
CLUSTER gebouwpunt USING gebouwpunt_gix;

