Comandos Docker

1. Crear un contenedor.
2. Crear una imagen desde un Dockerfile.
3. Hacer login en Docker Hub.
4. Subir una imagen a Docker Hub.

---

## Ver listado de imágenes disponibles

```shell
docker image ls
```

## Ver los contenedores existentes y su estado

```shell
docker ps -a
```

## Iniciar un contenedor

```shell
docker start <nombre o ID del contenedor>
```

## Detener un contenedor

```shell
docker stop <nombre o ID del contenedor>
```

## Ver los logs de un contenedor

```shell
docker logs <nombre o ID del contenedor>
```

## Eliminar un contenedor

```shell
docker rm <nombre o ID del contenedor>
```

## Eliminar una imagen

```shell
docker image ls
docker image rm <nombre o ID de la imagen>
```

## Crear un contenedor a partir de una imagen

```sh
docker run -d -p 8085:80 samcli/react-sam:latest
```

---

## Crear una imagen desde un Dockerfile

1. Asegúrate de tener un archivo `Dockerfile` en tu directorio actual.
2. Ejecuta el siguiente comando para construir la imagen:

```sh
docker build -t nombreusuario/nombreimagen:tag .
```

> Ejemplo:
```sh
docker build -t miusuario/miapp:1.0 .
```

---

## Hacer login en Docker Hub

```sh
docker login
```

> Te pedirá tu usuario y contraseña de Docker Hub.

---

## Subir una imagen a Docker Hub

```sh
docker push nombreusuario/nombreimagen:tag
```

> Ejemplo:
```sh
docker push miusuario/miapp:1.0
```
