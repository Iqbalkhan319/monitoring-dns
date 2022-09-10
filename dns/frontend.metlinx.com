$TTL    604800
@       IN      SOA     dns.frontend.metlinx.com root.dns.frontend.metlinx.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      dns.frontend.metlinx.com.
@       IN      A       127.0.0.1
dns     IN      A  172.22.0.2
prometheus     IN      A  172.22.0.6
cadvisor     IN      A  172.22.0.5
grafana     IN      A  172.22.0.4
redis     IN      A  172.22.0.3
