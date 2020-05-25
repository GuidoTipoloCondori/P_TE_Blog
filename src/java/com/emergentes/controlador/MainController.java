package com.emergentes.controlador;

import com.emergentes.modelo.Blog;
import com.emergentes.utiles.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op;
        op = (request.getParameter("op") != null) ? request.getParameter("op") : "list";

        ArrayList<Blog> lista = new ArrayList<Blog>();

        ConexionBD canal = new ConexionBD();
        Connection conn = canal.conectar();

        PreparedStatement ps;
        ResultSet rs;

        if (op.equals("list")) {
            try {
                String sql = "select * from vp_blog order by fecha desc";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Blog art = new Blog();
                    art.setId_vpb(rs.getInt("id_vpb"));
                    art.setFecha(rs.getString("fecha"));
                    art.setTitulo(rs.getString("titulo"));
                    art.setContenido(rs.getString("contenido"));

                    lista.add(art);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vpblog.jsp").forward(request, response);
            } catch (SQLException ex) {
                System.out.println("Error en SQl " + ex.getMessage());
            } finally {
                canal.desconectar();
            }
        }
        if (op.equals("nuevo")) {
            Blog b = new Blog();
            request.setAttribute("blog", b);
            request.getRequestDispatcher("nuevo.jsp").forward(request, response);
        }
	
	if (op.equals("editar")) {
            
	    try {
		int id_vpb = Integer.parseInt(request.getParameter(("id_vpb")));
	        String sql = "select * from vp_blog where id_vpb = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, id_vpb);
		rs=ps.executeQuery();
		
		Blog bl= new Blog();
		
		while(rs.next()){
		     bl.setId_vpb(rs.getInt("id_vpb"));
                    bl.setFecha(rs.getString("fecha"));
                    bl.setTitulo(rs.getString("titulo"));
                    bl.setContenido(rs.getString("contenido"));
		    
		}
		
		request.setAttribute("blog", bl);
		request.getRequestDispatcher("nuevo.jsp").forward(request, response);
		
	    } catch (SQLException ex) {
		System.out.print("EERROR EN LA EDICION "+ex);
	    }
                
        }
	
        if (op.equals("eliminar")) {
            try {
                int id_vpb = Integer.parseInt(request.getParameter(("id_vpb")));

                String sql = "delete from vp_blog where id_vpb = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id_vpb);

                ps.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("Error de SQL " + ex.getMessage());
            } finally {
                canal.desconectar();
            }
            response.sendRedirect("MainController");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_vpb = Integer.parseInt(request.getParameter("id_vpb"));
        String fecha = request.getParameter("fecha");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");

        Blog b = new Blog();
        b.setId_vpb(id_vpb);
        b.setFecha(fecha);
        b.setTitulo(titulo);
        b.setContenido(contenido);

        ConexionBD canal = new ConexionBD();
        Connection conn = canal.conectar();
        PreparedStatement ps;
        ResultSet rs;
//////insertar  a la base de datos
        if (id_vpb == 0) {
            try {
		String sql = "insert into vp_blog(fecha,titulo,contenido)values(?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, b.getFecha());
                ps.setString(2, b.getTitulo());
                ps.setString(3, b.getContenido());
                
                ps.executeUpdate();
                
            } catch (SQLException ex) {
                System.out.println("Error de SQL "+ ex.getMessage());            
            } finally {
                canal.desconectar();
            }
            response.sendRedirect("MainController");
        }
	else{
	    try {
		String sql="update vp_blog set fecha=?,titulo=?,contenido=? where id_vpb=?";
		ps =conn.prepareStatement(sql);
		
		ps.setString(1, b.getFecha());
		ps.setString(2, b.getTitulo());
		ps.setString(3, b.getContenido());
		ps.setInt(4, b.getId_vpb());
		ps.executeUpdate();
	    } catch (SQLException ex) {
		System.out.println("ERROR AL ACTUALIZAR "+ex);
	    }
	    response.sendRedirect("MainController");
	}
    }
}
