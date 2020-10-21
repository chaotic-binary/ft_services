#minikube delete;

minikube start --driver=virtualbox --disk-size=5000MB;
minikube addons enable metrics-server;
minikube addons enable metallb;
minikube addons enable dashboard;

#Launch minikube
eval $(minikube -p minikube docker-env) ;

#Install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml ;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml ;
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" ;
kubectl apply -f ./srcs/metallb.yaml ;

#Build images and apply deployments
docker build -t wordpress-img ./srcs/wordpress/ ;
kubectl apply -f ./srcs/wordpress/wordpress.yaml ;
docker build -t mysql-img ./srcs/mysql/ ;
kubectl apply -f ./srcs/mysql/mysql.yaml ;
docker build -t phpmyadmin-img ./srcs/phpmyadmin/ ;
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml ;
docker build -t nginx-img ./srcs/nginx/ ;
kubectl apply -f ./srcs/nginx/nginx.yaml ;
docker build -t ftps-img ./srcs/ftps/ ;
kubectl apply -f ./srcs/ftps/ftps.yaml ;
docker build -t influxdb-img ./srcs/influxdb/ ;
kubectl apply -f ./srcs/influxdb/influxdb.yaml ;
docker build -t grafana-img ./srcs/grafana/ ;
kubectl apply -f ./srcs/grafana/grafana.yaml ;
docker build -t telegraf-img ./srcs/telegraf/ ;
kubectl apply -f ./srcs/telegraf/telegraf.yaml ;

minikube dashboard
