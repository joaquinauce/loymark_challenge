## Contenido de la solucion
1. [General Info](#generalinfo)
Se ha solicitado un CRUD de Usuarios completo, con sus datos obligatorios.
Se solicita además un listado de actividades (como una auditoria) de todo lo que se ha hecho dentro de la solucion web.
2. [Technologies](#technologies)
.NET Core 6.0
Angular 13.2.6
SQL Server 2019
3. [Installation](#installation)
Una vez clonado el proyecto, veremos dos carpetas, Cliente (front) - Servidor (back).

------BASE DE DATOS------
Ejecutar en SQL Server los scripts que se encuentran en la raíz del repositorio => ScriptsLoymark.sql

------BACK END------
Ejecutar con VS2022 la solucion Backend del proyecto.
Modificar el archivo appsettings.json que se encuentra en la raiz de la solucion, completar con los datos correspondientes en la etiqueta DefaultConnection
Compilar la solucion.

------FRONT END------
Teniendo Angular CLI instalado, abrir una terminal dentro de la carpeta Cliente, ejecutar el comando "npm update".
Abrimos el proyecto con VS Code.
Modificamos el archivo environment.ts => urlAPI: 'URL_DE_TU_API'. Dejo un ejemplo sólo para que cambie el puerto de la api que se le genere.
Abrimos una nueva terminal en VS Code.
Ejecutamos ng serve -o

6. [Considerations](#Considerations)
En base de datos, en vez de eliminar de manera física un usuario, se le agrega una columna fecha_baja y se realiza un update sobre la tabla usuarios, seteandole la fecha. Se agrega en listado de usuarios, un check que permite ver aquellos usuarios que han sido eliminados
Si bien la visual del desafio no de las mas bonitas, se trabajó fuertemente en demostrar tanto del lado del front como del back, cómo exprimo ambas tecnologías con todo lo que cada una nos provee.
Del lado del front utilizo formularios reactivos, lazy load para cargar el componente especifico, ruteo para cada componente, interfaces que hacen referencia a los modelos del backend.
Del lado del back, utilizo .net core 6.0, utilizando controladores como intermediarios entre el front y los repositorios correspondientes para acceder a BD. 
Un ejemplo de inyeccion de dependencia utilizo IMapper, haciendo uso de los DTO para crear un usuario. Los DTO son de gran utilidad para "mostrarle" al usuario sólo lo que el puede ver y no demás datos sensibles del mismo.
Con un DTO y un modelo, utilizando el IMapper, realizamos el mapeo correspondiente.
