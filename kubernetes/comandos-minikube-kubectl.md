```
kubectl run kfullstackapp --image=mramoscli/fullstack --port=80
```

Aquí se especifica que deseamos ejecutar una imagen llamada `mramoscli/fullstack` en un nuevo pod llamado `kfullstackapp`, y que quieres exponer el puerto 80 del contenedor.

Si también quieres crear un servicio que redirija tráfico al puerto 80 de tu pod (para hacerlo accesible desde fuera del clúster), deberías ejecutar un comando adicional para exponer el pod:

```
kubectl expose pod kfullstackapp --type=LoadBalancer --port=80
```

Aquí, `--type=LoadBalancer` indica que deseamos crear un servicio de tipo LoadBalancer, que en muchos entornos en la nube expondrá el servicio en una IP accesible desde Internet. `--port=80` indica que el servicio debería escuchar en el puerto 80 y reenviar el tráfico a tu pod. 


## Obtener los Pods
```sh
kubectl get pods
```

```sh
kubectl describe pod "nombredelpod"
```

```sh
kubectl run kfullstackapp --image=mramoscli/fullstack --port=80
kubectl expose pod kfullstackapp --type=LoadBalancer --port=8080 --target-port=80
```
```sh
kubectl get services
```
```sh
kubectl describe service 
```

## Obtener la url
```sh
minikube service --url kfullstackapp
minikube service kfullstackapp --url
```

### Para ver el estado del cluster
```sh
minikube status
```
## Si lo queremos detener

```sh
minikube stop
```
## Si lo queremos iniciar

```sh
minikube start
```
## Ejecutar el Dashboard

```sh
minikube dashboard --url
```

## Obtener la ip de Minikube

```sh
minikube ip
```

