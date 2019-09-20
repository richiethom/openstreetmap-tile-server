#!/bin/bash

rm -f /tmp/data.osm.pbf
rm -rf /tmp/tiles
rm /tmp/tiles.tar.gz
mkdir /tmp/tiles
chmod go+w /tmp/tiles

#wget http://download.geofabrik.de/europe/andorra-latest.osm.pbf -O /tmp/data.osm.pbf
#wget http://download.geofabrik.de/europe/great-britain/england/greater-london-latest.osm.pbf -O /tmp/data.osm.pbf
wget $1 -O /tmp/data.osm.pbf

docker volume create openstreetmap-data

#docker run -v /tmp/tiles:/tiles -v /tmp/data.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main 6fa0 import 2 1.51 42.49 1.56 42.52
docker run -v /tmp/tiles:/tiles -v /tmp/data.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main 6fa0 import $2 $3 $4 $5 $6
#docker run -v /tmp/tiles:/tiles -v /tmp/data.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main 6fa0 exportall 2 1.51 42.49 1.56 42.52
docker run -v /tmp/tiles:/tiles -v /tmp/data.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main 6fa0 exportall $2 $3 $4 $5 $6

tar cfz /tmp/tiles.tar.gz /tmp/tiles




