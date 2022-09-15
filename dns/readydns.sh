#bin/bash
echo "Copy Configure File"
cp -rp frontend.metlinx.com named.conf.local /var/lib/docker/volumes/dns-data/_data/bind/etc/
echo "Change Permission in the container"

docker exec -it dns bash -c "chown -R bind:bind /etc/bind/*"
docker exec -it dns bash -c "chmod -R 775 /etc/bind/*"

for container in $(docker ps --format '{{.Names}}' | grep dns)
  do
   for ipadd in $(docker inspect -f  '{{range.NetworkSettings.Networks}}{{.IPAddress}} {{end}}' $container)
   do
   docker exec -it dns bash -c "echo nameserver $ipadd > /etc/resolv.conf"
   docker exec -it dns bash -c "echo nameserver 8.8.8.8 >> /etc/resolv.conf"
   sed -i  "/$container     IN      A/d" /var/lib/docker/volumes/dns-data/_data/bind/etc/frontend.metlinx.com
   echo "$container     IN      A  $ipadd" >> /var/lib/docker/volumes/dns-data/_data/bind/etc/frontend.metlinx.com
   docker exec -it dns bash -c "./etc/init.d/bind9 reload"
done
done
