# Título del Proyecto

_Challenge Loymark_

## Comenzando 🚀

_Clonar el proyecto. Se creara un repositorio local con dos carpetas (Cliente para el front - Servidor para el back) y un archivo Script.SQL con la base de datos._

### Pre-requisitos 📋
```
Tener instalado Angular CLI. Desde una terminal ejecutamos el comando (npm install -g @angular/cli).
Tener instalado NodeJS (https://nodejs.org/es/_)
Tener instalado SQL Server 2019 Express (https://www.microsoft.com/es-es/sql-server/sql-server-downloads?SilentAuth=1&f=255&MSPPError=-2147217396)
Tener instalado Visual Studio 2022 (https://visualstudio.microsoft.com/es/vs/community/)
Tener instalado VS Code (https://code.visualstudio.com/)
```

### Instalación 🔧

_Tendremos que ejecutar unos comandos para poder ejecutar correctamente el proyecto._

_Base de datos_

```
Ejecutar en SQL Server los scripts que se encuentran en la raíz del repositorio => ScriptsLoymark.sql
```

_BackEnd_

```
Ejecutar con VS2022 la solucion Backend del proyecto.
Modificar el archivo appsettings.json que se encuentra en la raiz de la solucion, completar con los datos correspondientes en la etiqueta DefaultConnection
Compilar la solucion.
```

_FrontEnd_
```
Teniendo Angular CLI instalado, abrir una terminal dentro de la carpeta Cliente, ejecutar el comando "npm update".
Abrimos el proyecto con VS Code.
Modificamos el archivo environment.ts => urlAPI: 'URL_DE_TU_API'. Dejo un ejemplo sólo para que cambie el puerto de la api que se le genere.
Abrimos una nueva terminal en VS Code.
Ejecutamos ng serve -o
```

## Consideraciones 📦

```
En base de datos, en vez de eliminar de manera física un usuario, se le agrega una columna fecha_baja y se realiza un update sobre la tabla usuarios, seteandole la fecha. Se agrega en listado de usuarios, un check que permite ver aquellos usuarios que han sido eliminados

Si bien la visual del desafio no de las mas bonitas, se trabajó fuertemente en demostrar tanto del lado del front como del back, cómo exprimo ambas tecnologías con todo lo que cada una nos provee.

Del lado del front utilizo formularios reactivos, lazy load para cargar el componente especifico, ruteo para cada componente, interfaces que hacen referencia a los modelos del backend.

Del lado del back, utilizo .net core 6.0, utilizando controladores como intermediarios entre el front y los repositorios correspondientes para acceder a BD. 

Un ejemplo de inyeccion de dependencia utilizo IMapper, haciendo uso de los DTO para crear un usuario. Los DTO son de gran utilidad para "mostrarle" al usuario sólo lo que el puede ver y no demás datos sensibles del mismo. Con un DTO y un modelo, utilizando el IMapper, realizamos el mapeo correspondiente.
```
## Construido con 🛠️

_Menciona las herramientas que utilizaste para crear tu proyecto_

* [Angular](https://angular.io/) - El framework web usado
* [.NET Core 6.0](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) - BackEnd

## Autor ✒️

_Auce Joaquin_
