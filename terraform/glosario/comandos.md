## Comandos mas utilizados
Las tres instrucciones (`terraform init`, `terraform plan`, `terraform apply`) son comandos básicos de Terraform, una herramienta para crear, cambiar y versionar infraestructura de manera segura y eficiente. En este caso, estás usando Terraform para gestionar recursos en AWS.


1. `terraform init`: Este comando se utiliza para inicializar un directorio de trabajo que contiene archivos de configuración de Terraform. Esto preparará Terraform para el trabajo futuro descargando los módulos necesarios y configurando el backend, entre otras cosas.

2. `terraform plan`: Este comando crea un plan de ejecución. Terraform determinará qué acciones son necesarias para alcanzar el estado deseado especificado en los archivos de configuración. Este comando es una manera de previsualizar los cambios antes de aplicarlos.

3. `terraform apply`: Este comando aplica los cambios requeridos para alcanzar el estado deseado de la configuración. Esencialmente, este comando hace que los cambios reales en la infraestructura siguiendo el plan creado por `terraform plan`.

El código de Terraform  crea una instancia EC2 en AWS:

```shell
provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "mi_servidor" {
  ami = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"
}
```
- `provider "aws" { region = "us-west-1" }`: Este bloque configura el proveedor de AWS. Los proveedores son entidades en Terraform que interactúan con los servicios de un proveedor de nube. Aquí estamos configurando el proveedor de AWS para usar la región "us-west-1".

- `resource "aws_instance" "mi_servidor" { ami = "ami-0f8e81a3da6e2510a" instance_type = "t2.micro" }`: Este bloque crea un recurso, en este caso, una instancia EC2 en AWS. Estamos usando el tipo de instancia "t2.micro" y una imagen de máquina de Amazon (AMI) con el ID especificado.

Recuerda que para que este código funcione correctamente, necesitas tener configuradas las credenciales de AWS en tu entorno de trabajo. De lo contrario, Terraform no podrá interactuar con tu cuenta de AWS para crear y administrar recursos.

## Comando para comprobar las credenciales
```sh
cat ~/.aws/credentials
```

## Comando para Validar nuestra Configuración
```sh
terraform validate 
```
