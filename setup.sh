SERVICES="mysql phpmyadmin nginx wordpress ftps influxdb grafana telegraf"

# Colors
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
CYAN='\033[36m'
DEFAULT='\033[0m'

minikube delete;

minikube start --driver=virtualbox --disk-size=4000MB;
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

#Build images and apply deployments,#--build-arg MINIKUBE_IP=${MINIKUBE_IP}
docker build -t wordpress-img ./srcs/wordpress/ ;
kubectl apply -f ./srcs/wordpress/wordpress.yaml ;
docker build -t mysql-img ./srcs/mysql/ ;
kubectl apply -f ./srcs/mysql/mysql.yaml ;
docker build -t phpmyadmin-img ./srcs/phpmyadmin/ ;
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml ;
#docker build -t nginx-img ./srcs/nginx/ ;
#kubectl apply -f ./srcs/nginx/nginx.yaml ;

minikube dashboard

#autoload -Uz compinit
#compinit
#source <(kubectl completion zsh)
