## AMAZON (buscar IAM)

1. Seleccionar la parte de Usuario
2. Crear un Usuario ( NO Selecciones la "Proporcione acceso de usuario a la consola de administración de AWS: opcional") -> Sig
3. Selecciona "Adjuntar políticas directamente"
4. Selecciona "AdministratorAccess" Sig
5. Crear Usuario
6. Una vez creado el usuario 
7. Credenciales de Seguridad
8. Abajo encontraras "Crear claves de acceso"
9. Tienes que marcar Interaz de linea de comando (Amazon cli)
10. Fin tendrias tu usuario tu clave ( no olvides guardar csv)

Descargar el Amazon Cli

```sh 
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```
1. Ingrese el comando de instalacion por la terminal: 
  ```sh
  aws configure
  ```
2. Les va a preguntar por: 
   - AWS Acces key Id
   - AWS SECRET ACCESS KEY
   - ENTER
   - ENTER

Para comprobar de que se ha realizado de manera correcta todo el proceso

```sh
aws sts get-caller-identity
```

Fin :)