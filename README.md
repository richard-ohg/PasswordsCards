# PPP Crypto Algorithm 

Proyecto basado en el algoritmo PPP (Perfect Paper Passwords), el cual se especifica en la siguiente página: [PPP Crypto Algorithm](https://www.grc.com/ppp/algorithm.htm)

#### Pasos para compilar y ejecutar proyecto:

1. Clonar el repositorio, desde linea de comandos ejecutar lo siguiente:

```
git clone https://github.com/richard-ohg/PasswordsCards.git
````

2. Abrir el proyecto en Xcode y ejecutarlo, como no tiene alguna dependencia externa, la compilación es normal


#### Manual de Usuario

* La primera vista es la configuración, por defecto viene una llave, el conjunto de caracteres, la longitud de las contraseñas y las tarjetas a generar, pero tú puedes editar cualquiera de los campos, en el caso de la llave solo se puede generar una nueva.
Para generar la llave se presiona el botón "Generate Passcards"

![Configuracion](/assets/img/configuracion.png)

* Una vez que se generan las tarjetas se guarda la llave con que se generaron, por si se llega a cerrar la aplicación, se puedan volver a generar.

* Al mostrar las tarjetas de muestran 16 passwords por tarjeta.

![Configuracion](/assets/img/tarjetas.png)