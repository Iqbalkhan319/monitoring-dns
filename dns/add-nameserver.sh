#bin/bash
echo "Add Nameserver to the container"

for container in $(docker ps --format '{{.Names}}' | grep -v "dns" | grep -v k8s )
  do
   for ipadd in $(docker inspect -f  '{{range.NetworkSettings.Networks}}{{.IPAddress}} {{end}}' dns)
   do
   echo "Adding nameserver to the $container"
   a=$(docker exec -it cadvisor cat /etc/shells | grep -v "#" |head -1 | awk -F "/" '{ print $3 }')
   echo $a
   docker exec -it $container $a -c "echo nameserver $ipadd > /etc/resolv.conf"
   docker exec -it $container $a -c "echo nameserver 8.8.8.8 >> /etc/resolv.conf"
   echo "Nameserver added to the $container"
done
done
