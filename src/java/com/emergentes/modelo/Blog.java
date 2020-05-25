package com.emergentes.modelo;

public class Blog {
    private int id_vpb;
    private String fecha;
    private String titulo;
    private String contenido;

    public Blog() {
	this.id_vpb= 0;
	this.fecha ="";
	this.titulo = "";
	this.contenido = "";
    }

    public int getId_vpb() {
	return id_vpb;
    }

    public void setId_vpb(int id_vpb) {
	this.id_vpb = id_vpb;
    }



    public String getFecha() {
	return fecha;
    }

    public void setFecha(String fecha) {
	this.fecha = fecha;
    }

    public String getTitulo() {
	return titulo;
    }

    public void setTitulo(String titulo) {
	this.titulo = titulo;
    }

    public String getContenido() {
	return contenido;
    }

    public void setContenido(String contenido) {
	this.contenido = contenido;
    }

    
}
