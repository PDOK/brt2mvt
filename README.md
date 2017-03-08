# Conversie van BRT-Achtergrondkaart naar vector tiles

## Samenvatting

Deze repository bevat de bestanden voor het converteren van de BRT-Achtergrondkaart naar vector tiles volgens de Mapbox Vector Tiles(MVT)-specificatie. De BRT-Achtergrondkaart wordt aangeleverd als Esri File-based Geo Database (FDDB).

## Foreign Data Wrapper Postgres

Get postgis docker form `ojajoh/docker-postgis`

**Optional** Set env variables for session:

  	export PGDATABASE=myown_databasename
    export PGHOST=localhost
    export PGPORT=myown_5432
    export PGUSER=myown_username
    export PGPASSWORD=myown_password

Run the docker with volume mounted on host. In the data_dir put the fgdb

	docker run -v /home/path/data_dir:/data_dir --name $PGDATABASE -e POSTGRES_DB=$PGDATABASE -e POSTGRES_USER=$PGUSER -e POSTGRES_PASSWORD=$PGPASSWORD -p $PGPORT:5432 -d ojajoh/docker-postgis

Run `psql` in session if variables set:

	CREATE EXTENSION ogr_fdw;

Create Foreign Data Tables form the `fgdb`:

	CREATE SERVER fgdb_BRTAG
		FOREIGN DATA WRAPPER ogr_fdw
		OPTIONS (
		datasource '/data_dir/BRTAGBasis.gdb',
		format 'OpenFileGDB' );

	CREATE SCHEMA fgdb_BRT;

	IMPORT FOREIGN SCHEMA ogr_all
	    FROM SERVER fgdb_BRTAG
	    INTO fgdb_BRT;

Now run the sql files to import all tables with the right settings and projection to `SCHEMA public`.

### Function Z for calculating zoomlevels

In order to calculate the zoomlevels based on the scale denominator, we the function `z`. Create this function with the file `create_function_z.sql`

## T-rex
From https://github.com/pka/t-rex

t-rex is a vector tile server specialized on publishing MVT tiles from a PostGIS database. t_rex is an executable with very few dependencies, essentially libgcc_s.so.1 on Linux.

To install on Linux:

	wget https://github.com/pka/t-rex/releases/download/v0.6.1/t-rex-v0.6.1-x86_64-unknown-linux-gnu.deb
	sudo dpkg -i t-rex-v0.6.1-x86_64-unknown-linux-gnu.deb
	sudo apt-get install -f.

## Connecting
Connect to a Postgres server using the standard URI format:

	let conn = Connection::connect("postgres://user:pass@host:port/database?arg1=val1&arg2=val2",
                               TlsMode::None)?;

Generate a configuration template:

	t_rex genconfig --clip true --simplify false --dbconn postgresql://user:pass@host:port/database > config.cfg

Run server with configuration file:

	t_rex serve --config config.cfg

Generate tiles for cache:

	t_rex generate --extent 477070.003118603,6582033.54493319,787320.385318491,7013842.80473795 --maxzoom 7 --minzoom 6 --config config.cfg

### Cargo

Build with Cargo to get the latest version.

With Cargo

	cargo run -- serve --config config.cfg

### Unzipping .pbf tiles
To unzip and rename to pbf again:

	gzip -d -r -S .pbf *
	find . -type f -exec mv '{}' '{}'.pbf \;

### Mbtiles
Making mbtiles fom the cache

	mb-util --image_format=pbf tmp/terreinvlak_3 terreinvlak_3.mbtiles
