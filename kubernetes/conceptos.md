# Introducción a Kubernetes

## ¿Qué es Kubernetes?

Kubernetes (también conocido como K8s) es una plataforma de código abierto para automatizar la implementación, el escalado y la gestión de aplicaciones en contenedores. 

## ¿Para qué sirve Kubernetes?

Kubernetes te permite:

- Implementar aplicaciones de forma rápida y predecible.
- Escalar tus aplicaciones en tiempo real.
- Lanzar nuevas características sin interrupciones.
- Aprovechar un ecosistema creciente de servicios y soporte.

## Relación entre Kubernetes y Docker

Docker es una plataforma que permite crear, implementar y gestionar contenedores. Por otro lado, Kubernetes es un sistema de orquestación que administra cómo esos contenedores interactúan y se escalan en un clúster.

# Conceptos clave de Kubernetes

## Pod

Un Pod es la unidad más pequeña en Kubernetes. Representa un solo objeto en el clúster y puede contener uno o varios contenedores que comparten almacenamiento y red. 

## Secret

Un Secret es un objeto en Kubernetes que contiene datos sensibles, como contraseñas, tokens o claves. Los Secret protegen esa información y limitan su exposición.

## # Introducción a Kubernetes

## ¿Qué es Kubernetes?

Kubernetes (también conocido como K8s) es una plataforma de código abierto para automatizar la implementación, el escalado y la gestión de aplicaciones en contenedores. 

## Kubectl 

`kubectl` es la línea de comandos para interactuar con el servidor de Kubernetes. Permite a los desarrolladores administrar y controlar sus aplicaciones.

## Minikube

Minikube es una herramienta que te permite ejecutar Kubernetes localmente. Es ideal para aprender y probar nuevas ideas y configuraciones antes de moverlas a producción.

## Deployment

Un Deployment es una forma de declarar el estado deseado para tus Pods en Kubernetes. El sistema se asegura de mantener el estado deseado, creando o eliminando Pods según sea necesario.

## Service

Un Service es una abstracción en Kubernetes que define un conjunto lógico de Pods y cómo acceder a ellos. Los Services permiten que tus aplicaciones sean descubiertas y proporcionan balanceo de carga entre Pods.

## Service

En Kubernetes, un Service es una abstracción que define un conjunto lógico de Pods y una política de acceso para ellos. Un Service permite exponer la conectividad a los Pods y proporciona una forma consistente de acceder a las aplicaciones en ejecución.

### Tipos de Service

Existen varios tipos de Service en Kubernetes:

- **ClusterIP**: Este es el tipo de Service predeterminado. Expone el Service internamente en el clúster, lo que permite que otros Pods del mismo clúster accedan a él mediante una IP interna.

- **NodePort**: Expone el Service en cada nodo del clúster en un puerto específico. Esto permite acceder al Service desde fuera del clúster utilizando la IP del nodo y el puerto asignado.

- **LoadBalancer**: Crea un balanceador de carga externo y lo configura para dirigir el tráfico al Service. Esto permite exponer el Service a través de una IP externa que puede ser alcanzada desde fuera del clúster.

- **ExternalName**: Permite hacer referencia a servicios externos ubicados fuera del clúster Kubernetes. No se crea un balanceador de carga ni un proxy, simplemente se realiza una resolución de nombres hacia el servicio externo.

### Beneficios de los Services

- **Descubrimiento de servicios**: Los Services actúan como un punto de entrada para acceder a los Pods y permiten a otros servicios descubrir y comunicarse con ellos de forma transparente.

- **Balanceo de carga**: Los Services distribuyen automáticamente el tráfico entrante entre los Pods que forman parte del Service, lo que garantiza una distribución equitativa de las solicitudes y evita la sobrecarga de un único Pod.

- **Manejo de alta disponibilidad**: Si un Pod falla o se elimina, el Service sigue siendo accesible a través de otros Pods que pertenecen al Service. Esto garantiza la alta disponibilidad de las aplicaciones incluso en caso de fallos o reinicios de los Pods.

### Uso de un Service

Para crear un Service en Kubernetes, se define un manifiesto YAML que especifica las propiedades del Service, como el tipo de Service, los Puertos y el selector para identificar los Pods asociados. A continuación, se aplica el manifiesto utilizando la herramienta `kubectl`.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mi-service
spec:
  type: ClusterIP
  ports:
    - name: http
      port: 80
      targetPort: 8080
  selector:
    app: mi-aplicacion

# Conclusión
