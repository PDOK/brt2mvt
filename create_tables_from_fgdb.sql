
-- Foreign Data Wrapper

CREATE EXTENSION ogr_fdw;

CREATE SERVER fgdb_BRTAG
	FOREIGN DATA WRAPPER ogr_fdw
	OPTIONS (
	datasource '/data_dir/BRTAGBasis.gdb',
	format 'OpenFileGDB' ); 

CREATE SCHEMA fgdb_BRT;

IMPORT FOREIGN SCHEMA ogr_all 
    FROM SERVER fgdb_BRTAG 
    INTO fgdb_BRT;

-- Create tables "AS-IS"
CREATE TABLE public.annotaties AS SELECT * FROM fgdball.annotaties;
CREATE TABLE public.gebouwpunt_10 AS SELECT * FROM fgdball.gebouwpunt_10;
CREATE TABLE public.gebouwpunt_11_14 AS SELECT * FROM fgdball.gebouwpunt_11_14;
CREATE TABLE public.gebouwpunt_9 AS SELECT * FROM fgdball.gebouwpunt_9;
CREATE TABLE public.gebouwvlak_6_7 AS SELECT * FROM fgdball.gebouwvlak_6_7;
CREATE TABLE public.gebouwvlak_8 AS SELECT * FROM fgdball.gebouwvlak_8;
CREATE TABLE public.gebouwvlak_9_14 AS SELECT * FROM fgdball.gebouwvlak_9_14;
CREATE TABLE public.inrichtingselementlijn_8 AS SELECT * FROM fgdball.inrichtingselementlijn_8;
CREATE TABLE public.inrichtingselementlijn_9_14 AS SELECT * FROM fgdball.inrichtingselementlijn_9_14;
CREATE TABLE public.inrichtingselementpunt_10_11 AS SELECT * FROM fgdball.inrichtingselementpunt_10_11;
CREATE TABLE public.inrichtingselementpunt_12_14 AS SELECT * FROM fgdball.inrichtingselementpunt_12_14;
CREATE TABLE public.plaatsnamen_0 AS SELECT * FROM fgdball.plaatsnamen_0;
CREATE TABLE public.plaatsnamen_1 AS SELECT * FROM fgdball.plaatsnamen_1;
CREATE TABLE public.plaatsnamen_2 AS SELECT * FROM fgdball.plaatsnamen_2;
CREATE TABLE public.plaatsnamen_3 AS SELECT * FROM fgdball.plaatsnamen_3;
CREATE TABLE public.plaatsnamen_4 AS SELECT * FROM fgdball.plaatsnamen_4;
CREATE TABLE public.plaatsnamen_5 AS SELECT * FROM fgdball.plaatsnamen_5;
CREATE TABLE public.plaatsnamen_6 AS SELECT * FROM fgdball.plaatsnamen_6;
CREATE TABLE public.plaatsnamen_7 AS SELECT * FROM fgdball.plaatsnamen_7;
CREATE TABLE public.plaatsnamen_8 AS SELECT * FROM fgdball.plaatsnamen_8;
CREATE TABLE public.registratiefgebiedlijn_0_14 AS SELECT * FROM fgdball.registratiefgebiedlijn_0_14;
CREATE TABLE public.registratiefgebiedvlak_0_14 AS SELECT * FROM fgdball.registratiefgebiedvlak_0_14;
CREATE TABLE public.spoorbaandeellijn_6_8 AS SELECT * FROM fgdball.spoorbaandeellijn_6_8;
CREATE TABLE public.spoorbaandeellijn_9_14 AS SELECT * FROM fgdball.spoorbaandeellijn_9_14;
CREATE TABLE public.straatnamen_hoofdwegen AS SELECT * FROM fgdball.straatnamen_hoofdwegen;
CREATE TABLE public.straatnamen_lokale_wegen AS SELECT * FROM fgdball.straatnamen_lokale_wegen;
CREATE TABLE public.straatnamen_overig AS SELECT * FROM fgdball.straatnamen_overig;
CREATE TABLE public.straatnamen_regionale_wegen AS SELECT * FROM fgdball.straatnamen_regionale_wegen;
CREATE TABLE public.straatnamen_straat AS SELECT * FROM fgdball.straatnamen_straat;
CREATE TABLE public.terreinvlak_0_2 AS SELECT * FROM fgdball.terreinvlak_0_2;
CREATE TABLE public.terreinvlak_10_14 AS SELECT * FROM fgdball.terreinvlak_10_14;
CREATE TABLE public.terreinvlak_3 AS SELECT * FROM fgdball.terreinvlak_3;
CREATE TABLE public.terreinvlak_4 AS SELECT * FROM fgdball.terreinvlak_4;
CREATE TABLE public.terreinvlak_5 AS SELECT * FROM fgdball.terreinvlak_5;
CREATE TABLE public.terreinvlak_6_8 AS SELECT * FROM fgdball.terreinvlak_6_8;
CREATE TABLE public.terreinvlak_9 AS SELECT * FROM fgdball.terreinvlak_9;
CREATE TABLE public.waterdeellijn_8 AS SELECT * FROM fgdball.waterdeellijn_8;
CREATE TABLE public.waterdeellijn_9_14 AS SELECT * FROM fgdball.waterdeellijn_9_14;
CREATE TABLE public.waterdeelvlak_0_1 AS SELECT * FROM fgdball.waterdeelvlak_0_1;
CREATE TABLE public.waterdeelvlak_2_3 AS SELECT * FROM fgdball.waterdeelvlak_2_3;
CREATE TABLE public.waterdeelvlak_4_7 AS SELECT * FROM fgdball.waterdeelvlak_4_7;
CREATE TABLE public.waterdeelvlak_8 AS SELECT * FROM fgdball.waterdeelvlak_8;
CREATE TABLE public.waterdeelvlak_9_14 AS SELECT * FROM fgdball.waterdeelvlak_9_14;
CREATE TABLE public.wegdeellijn_10_14 AS SELECT * FROM fgdball.wegdeellijn_10_14;
CREATE TABLE public.wegdeellijn_2_5 AS SELECT * FROM fgdball.wegdeellijn_2_5;
CREATE TABLE public.wegdeellijn_6 AS SELECT * FROM fgdball.wegdeellijn_6;
CREATE TABLE public.wegdeellijn_7 AS SELECT * FROM fgdball.wegdeellijn_7;
CREATE TABLE public.wegdeellijn_8_9 AS SELECT * FROM fgdball.wegdeellijn_8_9;
CREATE TABLE public.wegdeelvlak_10_14 AS SELECT * FROM fgdball.wegdeelvlak_10_14;
CREATE TABLE public.wegdeelvlak_7_9 AS SELECT * FROM fgdball.wegdeelvlak_7_9;

--Drop Foreign Tables
DROP SCHEMA fgdb_BRT CASCADE;

-- Reproject tables tp EPSG:3857
ALTER TABLE annotaties ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE gebouwpunt_10 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE gebouwpunt_11_14 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE gebouwpunt_9 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE gebouwvlak_6_7 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE gebouwvlak_8 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE gebouwvlak_9_14 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE inrichtingselementlijn_8 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE inrichtingselementlijn_9_14 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE inrichtingselementpunt_10_11 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE inrichtingselementpunt_12_14 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_0 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_1 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_2 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_3 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_4 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_5 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_6 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_7 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE plaatsnamen_8 ALTER COLUMN shape TYPE Geometry(Point,3857) USING ST_Transform(shape, 3857);
ALTER TABLE registratiefgebiedlijn_0_14 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE registratiefgebiedvlak_0_14 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE spoorbaandeellijn_6_8 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE spoorbaandeellijn_9_14 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE straatnamen_hoofdwegen ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE straatnamen_lokale_wegen ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE straatnamen_overig ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE straatnamen_regionale_wegen ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE straatnamen_straat ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE terreinvlak_0_2 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE terreinvlak_10_14 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE terreinvlak_3 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE terreinvlak_4 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE terreinvlak_5 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE terreinvlak_6_8 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE terreinvlak_9 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE waterdeellijn_8 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE waterdeellijn_9_14 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE waterdeelvlak_0_1 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE waterdeelvlak_2_3 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE waterdeelvlak_4_7 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE waterdeelvlak_8 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE waterdeelvlak_9_14 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE wegdeellijn_10_14 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE wegdeellijn_2_5 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE wegdeellijn_6 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE wegdeellijn_7 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE wegdeellijn_8_9 ALTER COLUMN shape TYPE Geometry(MultiLineString,3857) USING ST_Transform(shape, 3857);
ALTER TABLE wegdeelvlak_10_14 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);
ALTER TABLE wegdeelvlak_7_9 ALTER COLUMN shape TYPE Geometry(MultiPolygon,3857) USING ST_Transform(shape, 3857);


-- Create spatial indexes
CREATE INDEX annotaties_si ON public.annotaties USING GIST (shape);
CREATE INDEX gebouwpunt_10_si ON public.gebouwpunt_10 USING GIST (shape);
CREATE INDEX gebouwpunt_11_14_si ON public.gebouwpunt_11_14 USING GIST (shape);
CREATE INDEX gebouwpunt_9_si ON public.gebouwpunt_9 USING GIST (shape);
CREATE INDEX gebouwvlak_6_7_si ON public.gebouwvlak_6_7 USING GIST (shape);
CREATE INDEX gebouwvlak_8_si ON public.gebouwvlak_8 USING GIST (shape);
CREATE INDEX gebouwvlak_9_14_si ON public.gebouwvlak_9_14 USING GIST (shape);
CREATE INDEX inrichtingselementlijn_8_si ON public.inrichtingselementlijn_8 USING GIST (shape);
CREATE INDEX inrichtingselementlijn_9_14_si ON public.inrichtingselementlijn_9_14 USING GIST (shape);
CREATE INDEX inrichtingselementpunt_10_11_si ON public.inrichtingselementpunt_10_11 USING GIST (shape);
CREATE INDEX inrichtingselementpunt_12_14_si ON public.inrichtingselementpunt_12_14 USING GIST (shape);
CREATE INDEX plaatsnamen_0_si ON public.plaatsnamen_0 USING GIST (shape);
CREATE INDEX plaatsnamen_1_si ON public.plaatsnamen_1 USING GIST (shape);
CREATE INDEX plaatsnamen_2_si ON public.plaatsnamen_2 USING GIST (shape);
CREATE INDEX plaatsnamen_3_si ON public.plaatsnamen_3 USING GIST (shape);
CREATE INDEX plaatsnamen_4_si ON public.plaatsnamen_4 USING GIST (shape);
CREATE INDEX plaatsnamen_5_si ON public.plaatsnamen_5 USING GIST (shape);
CREATE INDEX plaatsnamen_6_si ON public.plaatsnamen_6 USING GIST (shape);
CREATE INDEX plaatsnamen_7_si ON public.plaatsnamen_7 USING GIST (shape);
CREATE INDEX plaatsnamen_8_si ON public.plaatsnamen_8 USING GIST (shape);
CREATE INDEX registratiefgebiedlijn_0_14_si ON public.registratiefgebiedlijn_0_14 USING GIST (shape);
CREATE INDEX registratiefgebiedvlak_0_14_si ON public.registratiefgebiedvlak_0_14 USING GIST (shape);
CREATE INDEX spoorbaandeellijn_6_8_si ON public.spoorbaandeellijn_6_8 USING GIST (shape);
CREATE INDEX spoorbaandeellijn_9_14_si ON public.spoorbaandeellijn_9_14 USING GIST (shape);
CREATE INDEX straatnamen_hoofdwegen_si ON public.straatnamen_hoofdwegen USING GIST (shape);
CREATE INDEX straatnamen_lokale_wegen_si ON public.straatnamen_lokale_wegen USING GIST (shape);
CREATE INDEX straatnamen_overig_si ON public.straatnamen_overig USING GIST (shape);
CREATE INDEX straatnamen_regionale_wegen_si ON public.straatnamen_regionale_wegen USING GIST (shape);
CREATE INDEX straatnamen_straat_si ON public.straatnamen_straat USING GIST (shape);
CREATE INDEX terreinvlak_0_2_si ON public.terreinvlak_0_2 USING GIST (shape);
CREATE INDEX terreinvlak_10_14_si ON public.terreinvlak_10_14 USING GIST (shape);
CREATE INDEX terreinvlak_3_si ON public.terreinvlak_3 USING GIST (shape);
CREATE INDEX terreinvlak_4_si ON public.terreinvlak_4 USING GIST (shape);
CREATE INDEX terreinvlak_5_si ON public.terreinvlak_5 USING GIST (shape);
CREATE INDEX terreinvlak_6_8_si ON public.terreinvlak_6_8 USING GIST (shape);
CREATE INDEX terreinvlak_9_si ON public.terreinvlak_9 USING GIST (shape);
CREATE INDEX waterdeellijn_8_si ON public.waterdeellijn_8 USING GIST (shape);
CREATE INDEX waterdeellijn_9_14_si ON public.waterdeellijn_9_14 USING GIST (shape);
CREATE INDEX waterdeelvlak_0_1_si ON public.waterdeelvlak_0_1 USING GIST (shape);
CREATE INDEX waterdeelvlak_2_3_si ON public.waterdeelvlak_2_3 USING GIST (shape);
CREATE INDEX waterdeelvlak_4_7_si ON public.waterdeelvlak_4_7 USING GIST (shape);
CREATE INDEX waterdeelvlak_8_si ON public.waterdeelvlak_8 USING GIST (shape);
CREATE INDEX waterdeelvlak_9_14_si ON public.waterdeelvlak_9_14 USING GIST (shape);
CREATE INDEX wegdeellijn_10_14_si ON public.wegdeellijn_10_14 USING GIST (shape);
CREATE INDEX wegdeellijn_2_5_si ON public.wegdeellijn_2_5 USING GIST (shape);
CREATE INDEX wegdeellijn_6_si ON public.wegdeellijn_6 USING GIST (shape);
CREATE INDEX wegdeellijn_7_si ON public.wegdeellijn_7 USING GIST (shape);
CREATE INDEX wegdeellijn_8_9_si ON public.wegdeellijn_8_9 USING GIST (shape);
CREATE INDEX wegdeelvlak_10_14_si ON public.wegdeelvlak_10_14 USING GIST (shape);
CREATE INDEX wegdeelvlak_7_9_si ON public.wegdeelvlak_7_9 USING GIST (shape);

-- Cluster datasets

CLUSTER public.annotaties USING annotaties_si ;
CLUSTER public.gebouwpunt_10 USING gebouwpunt_10_si ;
CLUSTER public.gebouwpunt_11_14 USING gebouwpunt_11_14_si ;
CLUSTER public.gebouwpunt_9 USING gebouwpunt_9_si ;
CLUSTER public.gebouwvlak_6_7 USING gebouwvlak_6_7_si ;
CLUSTER public.gebouwvlak_8 USING gebouwvlak_8_si ;
CLUSTER public.gebouwvlak_9_14 USING gebouwvlak_9_14_si ;
CLUSTER public.inrichtingselementlijn_8 USING inrichtingselementlijn_8_si ;
CLUSTER public.inrichtingselementlijn_9_14 USING inrichtingselementlijn_9_14_si ;
CLUSTER public.inrichtingselementpunt_10_11 USING inrichtingselementpunt_10_11_si ;
CLUSTER public.inrichtingselementpunt_12_14 USING inrichtingselementpunt_12_14_si ;
CLUSTER public.plaatsnamen_0 USING plaatsnamen_0_si ;
CLUSTER public.plaatsnamen_1 USING plaatsnamen_1_si ;
CLUSTER public.plaatsnamen_2 USING plaatsnamen_2_si ;
CLUSTER public.plaatsnamen_3 USING plaatsnamen_3_si ;
CLUSTER public.plaatsnamen_4 USING plaatsnamen_4_si ;
CLUSTER public.plaatsnamen_5 USING plaatsnamen_5_si ;
CLUSTER public.plaatsnamen_6 USING plaatsnamen_6_si ;
CLUSTER public.plaatsnamen_7 USING plaatsnamen_7_si ;
CLUSTER public.plaatsnamen_8 USING plaatsnamen_8_si ;
CLUSTER public.registratiefgebiedlijn_0_14 USING registratiefgebiedlijn_0_14_si ;
CLUSTER public.registratiefgebiedvlak_0_14 USING registratiefgebiedvlak_0_14_si ;
CLUSTER public.spoorbaandeellijn_6_8 USING spoorbaandeellijn_6_8_si ;
CLUSTER public.spoorbaandeellijn_9_14 USING spoorbaandeellijn_9_14_si ;
CLUSTER public.straatnamen_hoofdwegen USING straatnamen_hoofdwegen_si ;
CLUSTER public.straatnamen_lokale_wegen USING straatnamen_lokale_wegen_si ;
CLUSTER public.straatnamen_overig USING straatnamen_overig_si ;
CLUSTER public.straatnamen_regionale_wegen USING straatnamen_regionale_wegen_si ;
CLUSTER public.straatnamen_straat USING straatnamen_straat_si ;
CLUSTER public.terreinvlak_0_2 USING terreinvlak_0_2_si ;
CLUSTER public.terreinvlak_10_14 USING terreinvlak_10_14_si ;
CLUSTER public.terreinvlak_3 USING terreinvlak_3_si ;
CLUSTER public.terreinvlak_4 USING terreinvlak_4_si ;
CLUSTER public.terreinvlak_5 USING terreinvlak_5_si ;
CLUSTER public.terreinvlak_6_8 USING terreinvlak_6_8_si ;
CLUSTER public.terreinvlak_9 USING terreinvlak_9_si ;
CLUSTER public.waterdeellijn_8 USING waterdeellijn_8_si ;
CLUSTER public.waterdeellijn_9_14 USING waterdeellijn_9_14_si ;
CLUSTER public.waterdeelvlak_0_1 USING waterdeelvlak_0_1_si ;
CLUSTER public.waterdeelvlak_2_3 USING waterdeelvlak_2_3_si ;
CLUSTER public.waterdeelvlak_4_7 USING waterdeelvlak_4_7_si ;
CLUSTER public.waterdeelvlak_8 USING waterdeelvlak_8_si ;
CLUSTER public.waterdeelvlak_9_14 USING waterdeelvlak_9_14_si ;
CLUSTER public.wegdeellijn_10_14 USING wegdeellijn_10_14_si ;
CLUSTER public.wegdeellijn_2_5 USING wegdeellijn_2_5_si ;
CLUSTER public.wegdeellijn_6 USING wegdeellijn_6_si ;
CLUSTER public.wegdeellijn_7 USING wegdeellijn_7_si ;
CLUSTER public.wegdeellijn_8_9 USING wegdeellijn_8_9_si ;
CLUSTER public.wegdeelvlak_10_14 USING wegdeelvlak_10_14_si ;
CLUSTER public.wegdeelvlak_7_9 USING wegdeelvlak_7_9_si ;
