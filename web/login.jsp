<%-- 
    Document   : login
    Created on : 21-may-2020, 19:04:41
    Author     : GUIDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<style>
form {
  /* Centrar el formulario en la página */
  margin: 0 auto;
  width: 400px;
  /* Esquema del formulario */
  padding: 1em;
  border: 1px solid #CCC;
  border-radius: 1em;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

form li + li {
  margin-top: 1em;
}

label {
  /* Tamaño y alineación uniforme */
  display: inline-block;
  width: 90px;
  text-align: right;
}

input, 
textarea {
  /* Para asegurarse de que todos los campos de texto tienen la misma configuración de letra
     Por defecto, las áreas de texto tienen un tipo de letra monoespaciada */
  font: 1em sans-serif;

  /* Tamaño uniforme del campo de texto */
  width: 300px;
  box-sizing: border-box;

  /* Hacer coincidir los bordes del campo del formulario */
  border: 1px solid #999;
}

input:focus, 
textarea:focus {
  /* Destacado adicional para elementos que tienen el cursor */
  border-color: #000;
}

textarea {
  /* Alinear los campos de texto multilínea con sus etiquetas */
  vertical-align: top;

  /* Proporcionar espacio para escribir texto */
  height: 5em;
}

.button {
  /* Alinear los botones con los campos de texto */
  padding-left: 90px; /* mismo tamaño que los elementos de la etiqueta */
}

button {
  /* Este margen adicional representa aproximadamente el mismo espacio que el espacio
     entre las etiquetas y sus campos de texto */
  margin-left: .5em;
}

	</style>
    </head>
    <body>
	
    
	<form action="LoginControlador" method="post">
	   
	    <center><h1>Login</h1></center>  

		
	    <ul>
		<li>
		    <label>Usuario :</label>
		    <input type="text" name="usuario">
		</li>
		<li>
		    <label>Password :</label>
		    <input type="password" name="password"> 
		</li>
		<li class="button">
		    <input type="submit" value="Ingresar">
		</li>
	    </ul>
	</form>
	
	
    </body>
</html>
