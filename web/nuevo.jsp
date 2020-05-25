<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : nuevo
    Created on : 22-may-2020, 0:31:45
    Author     : GUIDO
--%>
<%@page import="com.emergentes.modelo.Blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  Blog blog =(Blog)request.getAttribute("blog");
%>
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

</style>
    </head>
    <body>
    <center><h1>Nùevo / Editar Entrada</h1></center>
	
	<form action="MainController" method="post">

	<input type="hidden" name="id_vpb" value="${blog.id_vpb}">
	    <ul>
	     <li>
		<label for="name">Fecha:</label>
		<input type="date" name="fecha" value="${blog.fecha}">
	    </li>
	    <li>
		<label for="mail">Titulo:</label>
		<input type="text" name="titulo" value="${blog.titulo}">
	    </li>
	    <li>
		<label for="msg">Contenido:</label>
		<textarea type="text" name="contenido" value="${blog.contenido}"></textarea>
    
	    </li>
	    </ul>
		</br>
		<input type="submit"  value="Enviar">    
	    

	</form>

    </body>
</html>
