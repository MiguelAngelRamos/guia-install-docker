Kubernetes
==========
```sh
minikube start
```
```sh
docker exec -it --user=root jenkinsdocker /bin/bash
```

Debemos instalar 

## Comenzamos instalando el kubectl
```url
https://k8s-docs.netlify.app/en/docs/tasks/tools/install-kubectl/
```

## Ingresamos por la terminal

```sh
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```

## Damos los permisos de ejecución
```sh
chmod +x ./kubectl
```

## Vamos a moverlo de donde lo descargamos

```sh
sudo mv ./kubectl /usr/local/bin/kubectl
```

## Version

```sh
kubectl version --client
```

Instalamos el cliente para interactuar con el cluster, para que minikube no nos instale la consola, que el tiene por defecto y nos obligue a usar por delante la palabra "minukube"

## Nos devuelve la version en formato JSON
```sh 
kubectl version --output=json --client
```

## Nos devuelve la version en formato YAML

```sh
kubectl version --output=yaml --client
```

## Vamos a comprobar las redes que tenemos 

```sh
docker network ls
```
La que nos interesa es la red del minikube. 

Vamos a conectar el contenedor de jenkins a esta misma red. 

```sh
docker network connect minikube jenkinsdocker
```

Comprobamos que se ha agregado de manera correcta

```sh
docker container inspect jenkinsdocker
```

Cuando terminemos este ejercicio no olvides desconectar este contenedor a de esa red.

Dado que si no inicia el minikube con su red y el contenedor conectado a esa red podria tener problemas a querer iniciar de manera independiente

Comando para desconectarlo de la red

```sh
docker network disconnect minikube jenkinsdocker
```

Ahora necesitamos instalar un plugin 

kubernetes


Ahora necesitamos averiguar los datos del cluster que es la url de
