# monitoring-dns
monitoring-dns

Step 1: 
Please Run initial.sh

Step2: Please Run docker-compose.yaml

docker-compose up -d

Step 3: Run Ready DNS
./readydns.sh

Step 4 : Add A Record in the DNS Server. Please Run adddnsrecord.sh
./adddnsrecord.sh

Step 5: Run add-nameserver.sh script

./add-nameserver.sh

Step 6: Check DNS Funtionality

#docker exec -it dns bash
#cat /etc/resolv.conf
cat /etc/resolv.conf
nameserver 172.20.0.2
nameserver 8.8.8.8

root@a3f2f6bcc6f5:/# ping dns.frontend.metlinx.com
PING dns.frontend.metlinx.com (172.20.0.2) 56(84) bytes of data.
64 bytes from a3f2f6bcc6f5 (172.20.0.2): icmp_seq=1 ttl=64 time=0.160 ms

Step 7: Add new host to the prometheus


