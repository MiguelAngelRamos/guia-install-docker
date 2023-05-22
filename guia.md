https://docs.docker.com/engine/install/ubuntu/


## Install using the apt repository🔗

Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.
Set up the repository

1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

```shell    
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

Certificados de Docker

2. Add Docker’s official GPG key:

```shell
 sudo install -m 0755 -d /etc/apt/keyrings

 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

 sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
3. Use the following command to set up the repository: (agregar el repositorio de docker)
```shell
 echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```



## Install Docker Engine

1. Update the apt package index:
  ```
  sudo apt-get update
  ```
2. Install Docker Engine, containerd, and Docker Compose.

  To install the latest version, run:

  ```
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```

3. Verify that the Docker Engine installation is successful by running the hello-world image.

  ```
  sudo docker run hello-world
  ```

This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits.

You have now successfully installed and started Docker Engine.


## Ver la version de docker engine

  ```
  sudo docker -v
  ```

## Ver la version de docker compose
 
  ```
  sudo docker compose version
  ```

**nota en versiones anteriores se usaba docker-compose en las nuevas versiones ahora se usa docker compose "sin el guión"**

tips

1. Para no utilizar siempre la palabra sudo





## Post instalaccion
https://docs.docker.com/engine/install/linux-postinstall/


To create the docker group and add your user:

1. Create the docker group.

```
 sudo groupadd docker
```

2. Add your user to the docker group.

```
sudo usermod -aG docker $USER
```
### Rotacion de logs https://docs.docker.com/config/containers/logging/local/
    Modificar la configuracion de docker engine en los logs por que se generan mucho hay que controlar la rotacion para no tener problema de almacenamiento que se llene el disco de logs.

con el comando (si no tienes el archivo se va a crear)

```
sudo nano /etc/docker/daemon.json
```

```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3" 
  }
}

```
***El tamaño maximo de los archivos van hacer 10m y cuando tengamos 3 archivos de log los va renombrando (los elimina), con esto ya tenemos una rotación de logs adecuada***

## Comandos Docker

Ver los contenedores en cualquier estado
```
docker ps -a 
```
