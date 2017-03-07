#T-rex

https://github.com/pka/t-rex

t-rex is a vector tile server specialized on publishing MVT tiles from a PostGIS database. t_rex is an executable with very few dependencies, essentially libgcc_s.so.1 on Linux

	wget https://github.com/pka/t-rex/releases/download/v0.6.1/t-rex-v0.6.1-x86_64-unknown-linux-gnu.deb
	sudo dpkg -i t-rex-v0.6.1-x86_64-unknown-linux-gnu.deb
	sudo apt-get install -f.

## Connecting
Connect to a Postgres server using the standard URI format:

	let conn = Connection::connect("postgres://user:pass@host:port/database?arg1=val1&arg2=val2",
                               TlsMode::None)?;

Generate a configuration template:

	t_rex genconfig --dbconn postgresql://user:pass@host:port/database > config.cfg

Run server with configuration file:

	t_rex serve --config config.cfg

Generate tiles for cache:

	t_rex generate --config config.cfg

With Cargo

	cargo run -- serve --config config.cfg 

To unzip and rename to pbf again:

	gzip -d -r -S .pbf *
	find . -type f -exec mv '{}' '{}'.pbf \;

Making mbtiles fom the cache

	mb-util --image_format=pbf tmp/terreinvlak_3 terreinvlak_3.mbtiles
