#with gzip
docker save <image> | gzip > <filename>.tar.gz
gzcat <filename>.tar.gz | docker load

#without gzip
docker save -o <filename>.tar <image>
docker load -i <filename>.tar