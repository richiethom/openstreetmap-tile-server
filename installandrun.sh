#!/bin/bash

rm -rf /tmp/tiles
rm /tmp/tiles.tar.gz
mkdir /tmp/tiles
chmod go+w /tmp/tiles

#docker run -v /tmp/tiles:/tiles -v /tmp/data.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main cab63 import
docker run -v /tmp/tiles:/tiles -v /tmp/data.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main cab63 exportall

tar cfz /tmp/tiles.tar.gz /tmp/tiles
