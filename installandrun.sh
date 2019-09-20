#!/bin/bash

rm -rf /tmp/tiles
mkdir /tmp/tiles
chmod go+w /tmp/tiles

#docker run -v /tmp/tiles:/tiles -v /home/rich/andorra-latest.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main cab63 import
docker run -v /tmp/tiles:/tiles -v /home/rich/andorra-latest.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main cab63 exportall

