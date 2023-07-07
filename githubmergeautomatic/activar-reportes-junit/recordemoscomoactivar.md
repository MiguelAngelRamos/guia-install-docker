##  Vamos a recordar como Activar los reportes de JUnit

<img src="../img/activar-reportes/paso1.png"/>

Seleccionamos "Zona de trabajo" y dentro del proyecto DevopsMergeTest se crean diferentes carpetas

Vamos a entrar la carpeta "target" y esperar a ver los "surefire-reports" damos click


<img src="../img/activar-reportes/paso2.png"/>


Copiamos la ruta que para este caso seria 

DevopsMergeTest/target/surefire-reports

Nos vamos a la configuracion propia del "Pipe line"  Y vamos a "Acciones para ejecutar despues"

"Añadimos una Accion"
<img src="../img/activar-reportes/paso3.png"/>

<img src="../img/activar-reportes/paso4.png"/>


Por lo general la opción queda arriba asi subimos con el scroll hasta ubicar 

<img src="../img/activar-reportes/paso5.png"/>

En "Ficheros XML con los informes de tests"

Pegamos la ruta: target/surefire-reports/*.xml

Apply y Save


Una vez que hacemos los cambios en el codigo subimos una rama con codigo propuesto que luego se fusione de manera automatica con la rama main, en el "Estado Actual" deberiamos ver lo siguiente

<img src="../img/activar-reportes/paso6.png"/>

Observe de igual manera donde dice "Ultimos resultado de tests" hacemos click y deberiamos ver lo siguiente

<img src="../img/activar-reportes/paso7.png"/>