namespaces: es tener diferentes clusters virtuales dentro del mismo cluster fisico.

Verificar si tenemos el namespaces creado

```sh 
kubectl get namespace
```

Si no aparece lo debemos crear.

```sh
kubectl create namespace monitoring
```

Comprobemos nuevamente que este creado:

```sh 
kubectl get namespace
````

Comenzemos con la creación ( vamos al folder monitoring)
=========================================================

```sh
kubectl apply -f authorization-prometheus.yaml
```

Luego de aplicar este comando deberias ver los roles "Cluster Roles" y "Cluster Role Binding"

Ahora comenzamos con el archivo de configuración global "Archivo configmap-prometheus.yaml es aqui donde creamos las reglas y una de las que tenemos es el uso de memoria
si supera un bit comenzamos con el menor mas minimo para tener una regla"

## Ejecutar el Dashboard

```sh
minikube dashboard --url
```

Tambien en este archivo definimos los jobs

```sh
kubectl apply -f configmap-prometheus.yaml
```

Si lo queremos verificar nos vamos a la consola de administración. en el dashboard en el apartado de Config maps y filtramos arriba en el select por monitoring.

Ahora aplicamos el deployment que viene con el servicio
```sh
kubectl apply -f deployment-prometheus.yaml
```

comprobemos si esta todo dentro del namespace

```sh
kubectl get all --namespace=monitoring
```

Y luego ejecutamos el comando

```
minikube ip
```

192.168.49.2:30000

Y deberiamos ver a prometheus en acción

Ahora vamos a configurar los "kube-state-metric"

```sh
kubectl apply -f kube-state-metrics/
```

Ahora nos vamos a la carpeta de "alert-manager"

En el "configmap-alert-manager.yaml" en la **linea 12** debemos cambiar:

slack_api_url : "la url de tu slack, que vas a obtener con los pasos posteriores"

## PASOS

1. Debemos a ir a Slack vamos a crear un nuevo canal, este caso crearemos un canal nuevo llamado #prometheus

2. Luego debemos instalar una app dentro de slack buscamos "incoming WebHooks o WebHooks entrantes", y le damos en add to Slack,
nos pedira que indiquemos un canal vamos a seleccionar #prometheus, damos click en "Add incoming WebHooks integration o Añadir integración con WebHooks entrantes".

3. Luego en la siguiente ventana buscamos "URL de Webhook o Webhook URL" ***Envia tus cargas de json...** o ***Send your JSON...***

## Una vez añadido el canal de Slack y haber realizado los cambios en el archivo de configuración (configmap-alert-manager.yaml).

Ejecutamos el siguiente comando con tu terminal primera mente ubicate o asegurese de estar en la ruta de los archivos especificamente en el folder
monitoring

```sh
kubectl apply -f alert-manager/
```

Comprobemos vamos al dashboard

en el namespaces "monitoring" en el apartado de services, deberiamos ver nuestra alerta, adicionalmente podriamos ejecutar la ip

```
http://192.168.49.2:31000
```

## Ahora solo nos resta ver Grafana.

```sh
kubectl apply -f grafana/
```

Vamos al navegador 

```
http://192.168.49.2:32000
```

user: admin, password: admin


Ahora debemos conectarnos con prometheus.

Vamos al menu izquierd en el "+" y agregamos un import 

https://grafana.com/grafana/dashboards/6417

Solo es necesario indicar el id: 6417 y damos click en "load"


y en la ultima opción seleccionamos ***prometheus***

y damos click en "import"

vamos a importar un nuevo dash board 8588
y en la ultima opción seleccionamos ***prometheus***
y damos click en "import"