## Nos devuelve el listado de las imagenes

```shell
docker image ls
```

## Para ver los contenedores que tenemos y el estado de los contenedores

```shell
docker ps -a
```

## Para iniciar un contenedor

```shell
docker start "nombrecontenedor"
```

## Para bajar o detener un contenedor 

```shell
docker stop <nombre o ID del contenedor>
```

## Para ver la ejecución del contenedor lo que hace por consola

```shell
docker logs <nombre o ID del contenedor>
```

## Para eliminar un contenedor

```shell
docker rm <nombre o ID del contenedor>
```

## Para eliminar una imagen

```shell
docker image ls
docker image rm <nombre o ID del contenedor>
```
