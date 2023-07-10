1. Lo primero que vamos hacer es crear un repositorio en local para subirlo a github con los archivos.



Una cuenta para poder generar un token (con roles) y acceder desde jenkins al cluster de kubernetes

jenkins-account.yaml "lo debemos aplicar al cluster de kubernetes"

```sh
kubectl apply -f jenkins-account.yaml
```


Ver la configuracion de nuestro cluster

```sh
kubectl config view
```

aqui nos interve la url del server

server: https://192.168.49.2:8443 (con esta dirección es como vamos acceder desde jenkins)

Ahora tambien nos interesa obtener un certificado el cual le pertenece al rol que aplicamos dentro del jenkins-account.yaml 

Tomemos la url en una pestaña del navegador y le damos enter, debemos hacerlo con el https por que espera recibir una conexion segura si les aparece un aviso 
del navegador, consideran de todas formas ingresar a la direccion deberia responderles con 403 forbidden, esto es asi por que necesitamos paserle un token, asi que si le devuelve esto quiere decir que tenemos comunicacion solo nos faltaria el token.

```
https://192.168.49.2:8443
```

Deberiamos obtener un 404 Forbidden ( y esto por que lo estamos haciendo de manera anonima)

Ahora vamos a hacer uso del token que le pertenece el "kind: ServiceAccount" dentro de tu archivo "jenkins-account.yaml"

Consultamos el service Account.

```sh
kubectl --namespace default get serviceaccount
```


Quizas haya un problema y no veamos ningun secret otra forma de crear el token es crear un archivo "jenkins-service-account-token.yaml"


Ahora, después de crear el archivo `jenkins-service-account-token.yaml` con el contenido que has compartido, debes ejecutar los siguientes comandos en la terminal:

1. Aplicar el archivo YAML para crear el secreto en tu clúster de Kubernetes:

```bash
kubectl apply -f jenkins-service-account-token.yaml
```

2. Después de crear el secreto, puedes obtener detalles sobre el mismo utilizando el siguiente comando:

```bash
kubectl describe secret/jenkins-token-rk2mg
```


Este comando debería mostrarte el secreto y el token asociado con la cuenta de servicio "jenkins". Este token es el que puedes utilizar para autenticarte con la API de Kubernetes como la cuenta de servicio "jenkins".

Recuerda, el comando `kubectl apply` o `kubectl create` va a crear los recursos en tu clúster de Kubernetes según la definición en el archivo que le pases como argumento. En este caso, está creando un secreto del tipo "service-account-token" para la cuenta de servicio "jenkins". Luego, al describir el secreto, estás obteniendo información detallada sobre ese recurso específico en tu clúster.



Hay que tener en consideracion los pasos que se realizaron en jenkins para poder realizar la integracion con kubernetes

--------------- ANOTAR ESOS PASOS AQUI ------------------------------------------------

Lo primero es crear una credencial

Seleccionamos Secret Text y en Secret ingresamos el token
## el id debe ser el mismo que se establace en el pipeline
id: kubernete-jenkis-server-account
descripcion: kubernetes


Luego nos vamos a la opción "clouds" 

Kubernetes URL : https://192.168.49.2:8443

Aqui debemos poner el certificado que viene de la ruta en donde esta nuestro certificado. 

cuando ejecutamos estos comandos

```sh

miguel@miguel:~/Desktop/kubernetes-grafana/kubernetes-monitor$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /home/miguel/.minikube/ca.crt
    extensions:
    - extension:
        last-update: Sun, 09 Jul 2023 22:28:40 -04
        provider: minikube.sigs.k8s.io
        version: v1.30.1
      name: cluster_info
    server: https://192.168.49.2:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    extensions:
    - extension:
        last-update: Sun, 09 Jul 2023 22:28:40 -04
        provider: minikube.sigs.k8s.io
        version: v1.30.1
      name: context_info
    namespace: default
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /home/miguel/.minikube/profiles/minikube/client.crt
    client-key: /home/miguel/.minikube/profiles/minikube/client.key

```

vamos a consultar el certificado

```sh
 cat /home/miguel/.minikube/ca.crt
```


## VAMOS A CREAR EL PIPILENE PARA EL CLUSTER DE KUBERNETES

nombre: deploy_k8s
tipo: Pipeline

Nos vamos donde dice Pipeline

Definition: Pipeline script from SCM







