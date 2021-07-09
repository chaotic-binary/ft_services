# ft_services
Kubernetes cluster containig:

- Nginx server (ports 22, 80, 433) with:
  - access to this server's ssh at port 22
  - access to Wordpress website 
  - access to phpMyAdmin service
- FTPS server (port 21)
- MySQL database (port 3306/no external ip) used by Wordpress and phpMyAdmin
- Wordpress website (port 5050)
- phpMyAdmin service (port 5000)
- Influxdb database (port 8086/no external ip) used by Telegraf and Grafana.
- Grafana service (port 3000)
- Telegraf metrics collector daemonset (internal)

All containers are building from scratch using Alpine Linux

Requirements: `kubectl` and `minikube`, virtualbox installed
Run: `./setup.sh`
Open `192.168.117.242` in any browser to check 

