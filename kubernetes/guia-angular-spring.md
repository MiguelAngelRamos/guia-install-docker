## Antes de crear las imagenes ejecuta

1. 
```sh
minikube docker-env
```
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.49.2:2376"
export DOCKER_CERT_PATH="/home/miguel/.minikube/certs"
export MINIKUBE_ACTIVE_DOCKERD="minikube"

# To point your shell to minikube's docker-daemon, run:
# eval $(minikube -p minikube docker-env)

2. 
```sh
eval $(minikube -p minikube docker-env)
```
para verificar que docker engine de los kubernetes
```sh
    docker images
```
Van a la carpeta de java

3. 
```sh
docker build -t devops-apirest:0.0.1 --build-arg JAR_FILE=devops-apirest-0.0.1-SNAPSHOT.jar .
```

Van a la angular
4. 
```sh
docker build -t crudangular:0.0.1 .
```
5. cd kubernetes donde estan yaml
   ```sh
    kubectl apply -f ./
   ```
