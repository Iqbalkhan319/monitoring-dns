#bin/bash
for container in $(docker ps --format '{{.Names}}')
  do
   for ipadd in $(docker inspect -f  '{{range.NetworkSettings.Networks}}{{.IPAddress}} {{end}}' $container)
   do
    sed -i  "/$container     IN      A/d" /var/lib/docker/volumes/dns-data/_data/bind/etc/frontend.metlinx.com
    echo "$container     IN      A  $ipadd" >> /var/lib/docker/volumes/dns-data/_data/bind/etc/frontend.metlinx.com
done
done
docker exec -it dns bash -c "./etc/init.d/bind9 reload"
