## Comandos "Ubicarse dentro del repositorio donde estamos trabajando"

Verificar que el cluster este arriba 

```sh
  minikube status
```
## Creandolos uno a uno

### Comenzamos con los secret
```sh
kubectl apply -f secret-dev.yaml
```

```sh
kubectl apply -f secret-pgadmin.yaml
```

Puedes verificar en dashboard en el apartado de "Secrets"



## Aplicamos el config map

```sh
kubectl apply -f configmap-postgres-initbd.yaml
```

## Ahora los volumenes

```sh
kubectl apply -f persistence-volume.yaml
```

```sh
kubectl apply -f persistence-volume-claim.yaml
```

## Ahora aplicamos los deployment

```sh
kubectl apply -f deployment-postgres.yaml
```

```sh
kubectl apply -f deployment-pgadmin.yaml
```

## Ahora con los servicios

```sh
kubectl apply -f service-postgres.yaml
```
```sh
kubectl apply -f service-pgadmin.yaml
```


## Para ver un resumen de lo que se esta creando

```sh
kubectl get all
```

```sh
kubectl get pods
```

## probando

conocer la url del servicio

```sh
## esto no va devolver la ip del cluster de minikube
minikube ip
```

### con el de pg admin

Entonces seria la ip del cluster y el puerto

```sh
192.168.49.2:30200
## para acceder admin@admin.com y contraseña: academyjava
```

## Adicional


El puerto 80 es el puerto en el que se está ejecutando el servicio dentro del contenedor de pgAdmin, que es una aplicación web. Cuando se expone un servicio en Kubernetes utilizando el tipo NodePort, en nuestro caso, Kubernetes asigna un puerto en el rango de 30000-32767 en todos los nodos del clúster y redirige el tráfico entrante en ese puerto hacia el puerto del servicio en el contenedor correspondiente.

En el servicio pgadmin-service, se ha asignado el puerto 30200 en el nodo para redirigir el tráfico al puerto 80 del contenedor de pgAdmin.

Así que, para acceder a pgAdmin desde fuera del clúster, debes usar la IP del nodo (obtenida mediante minikube ip, ya que estás usando Minikube para tu clúster de Kubernetes) y el puerto asignado por Kubernetes en el nodo, que es 30200.

Por lo tanto accedes a pgAdmin a través de http://192.168.49.2:30200/ en lugar de puerto 80 porque 30200 es el puerto NodePort asignado por Kubernetes para redirigir el tráfico al puerto 80 del contenedor de pgAdmin.

