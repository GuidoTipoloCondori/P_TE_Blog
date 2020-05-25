<%

    if(session.getAttribute("logueado")!="OK"){
	response.sendRedirect("login.jsp");
    }

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Blog>lista= (List<Blog>)request.getAttribute("lista");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	<p align="right"><a  href="LoginControlador?action=logout" >Salir ♥</a></p>
	 <center><h1>BLOG DE NOTICIAS,DEPORTES</h1></center>
	<p><a href="MainController?op=nuevo">Nuevo Entrada</a></p>
	
    <center>

	<table border="0" >
	     
	    <c:forEach var="item" items="${lista}">
		<tr>
		   <td colspan="3">${item.fecha}</td>

		</tr>
		<tbody style="background: rgba(255, 128, 0, 0.3); border: 1px solid rgba(200, 100, 0, 0.3);">
		<tr>
		   <th colspan="3"><h3>${item.titulo}</h3></th>
		   
		</tr>
		</tbody>
		<tbody style="background: rgba(128, 255, 0, 0.3); border: 1px solid rgba(100, 200, 0, 0.3);">
		<tr>
		   <td colspan="3">${item.contenido}</td>  
		</tr>
		 </tbody>
		<tr>
		    <td>Autor : Administrador</td>
		   <td align="right"><a href="MainController?op=editar&id_vpb=${item.id_vpb}">Editar</a></td>
		   <td align="right"><a href="MainController?op=eliminar&id_vpb=${item.id_vpb}"
			  onclick="return(confirm('ESTA SEGURO DE ELIMIAR?'))">Eliminar    </a></td>
		</tr>
		<tr>
		<td colspan="3"><hr></td>
		</tr>
		
	    </c:forEach>
	    
	</table>
	
	</center>
    </body>
</html>
