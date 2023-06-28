## Subir a Docker Hub

Primero, debes asegurarte de estar registrado en Docker en tu terminal. Puedes hacerlo con el siguiente comando:

```bash
docker login
```

Tendrás que proporcionar tu nombre de usuario y contraseña de Docker.

Una vez que estás autenticado, puedes continuar con los siguientes pasos.

1. Etiqueta tu imagen local con el nombre de tu repositorio remoto. Utiliza el comando `docker tag` con el ID de imagen local y el nombre de tu repositorio remoto. Según tu descripción, esto sería:

```bash
docker tag 5507cb421bab mramoscli/fullstack:latest
```
***nota el id debe ser el id de tu imagen "5507cb421bab" es solo un ejemplo reemplazo por el id de su propia imagen***

2. Una vez etiquetada la imagen correctamente, puedes subirla a Docker Hub con el comando `docker push`. 

```bash
docker push mramoscli/fullstack:latest
```

## Descargo la imagen del docker hub
```sh
docker pull mramoscli/fullstackdevops
```
## Creo el ejecutable
```
docker run -p 80:80 -p 8080:8080 --name runfullstack mramoscli/fullstackdevops
```

## Compruebalo

Ve al navegador al localhost y localhost:8080/api/students
