## Guia para instalar una interface grafica en Ubuntu Server y un navegador web.

Para instalar Google Chrome en un servidor Ubuntu, puedes seguir los siguientes pasos. Ten en cuenta que este proceso requiere que tengas acceso de superusuario (sudo). 

También es importante mencionar que los servidores Ubuntu generalmente no tienen una interfaz gráfica de usuario (GUI) instalada por defecto, que es necesaria para ejecutar un navegador web como Google Chrome. Si estás utilizando Ubuntu Server y aún no has instalado un entorno de escritorio, tendrás que hacerlo antes de poder instalar Google Chrome.

Primero, necesitamos actualizar los paquetes del sistema:

```
sudo apt update
```

Para instalar un entorno de escritorio mínimo (si aún no lo has hecho), puedes instalar LXDE :

```
sudo apt install -y lxde
```


Una vez que tengas una interfaz gráfica de usuario, puedes proceder con la instalación de Google Chrome.

1. Descarga el paquete de instalación .deb de Google Chrome desde la terminal:

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

2. Luego, usa el comando `dpkg` para instalar el paquete que acabas de descargar:

```
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

3. Si encuentras algún error de dependencias durante la instalación, puedes usar el siguiente comando para resolverlo:

```
sudo apt install -f
```

Este comando descarga e instala las dependencias que falten.

4. Ahora puedes abrir Google Chrome desde la terminal escribiendo:

```
google-chrome-stable
```

Por último, recuerda que ejecutar una interfaz gráfica de usuario en un servidor no es una práctica común y puede exponer tu servidor a ciertos riesgos de seguridad. Así que te sugeriría considerar si realmente necesitas tener un navegador web en tu servidor. esto solo hacemos con fines educativos.
