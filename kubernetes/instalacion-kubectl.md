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