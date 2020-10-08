<%-- 
    Document   : crearpelicula
    Created on : 07/10/2020, 9:48:16
    Author     : mmise
--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CrearNuevaPelicula</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado").equals("0") || sesion.getAttribute("logueado") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="container" mt-5>
            <div class="row">
                <div class="col-sm">
                    <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand">Agregar Peliculas</a>
                <th scope="col">
                    <a href="principal.jsp"><i class="icon-home"></i></a> 
                </th>
            </nav>
                    <form action="crearpelicula.jsp" method="post">
                        <div class="form-group">
                            <label for="portada">Portada</label>
                            <input type="text" class="form-control" id="portada" placeholder="Portada" name="portada" required="required">                   
                        </div>
                        <div class="form-group">
                            <label for="titulo">Titulo</label>
                            <input type="text" class="form-control" id="titulo" placeholder="Titulo" name="titulo" required="required">                   
                        </div>
                        <div class="form-group">
                            <label for="clasificacion">Clasificacion</label>
                            <input type="text" class="form-control" id="clasificacion" placeholder="Clasificacion" name="clasificacion" required="required">                   
                        </div>
                        <div class="form-group">
                            <label for="sinopsis">Sinopsis</label>
                            <input type="text" class="form-control" id="sinopsis" placeholder="Sinopsis" name="sinopsis" required="required">                   
                        </div>
                        <div class="form-group">
                            <label for="en_cartelera">En Cartelera</label>
                            <select name="en_cartelera" id="en_cartelera">
                                <option value="si">Si</option>
                                <option value="no">No</option>
                            </select>                   
                        </div>
                        <div class="form-group">
                            <label for="fecha_inicio">Fecha Publicacion</label>
                            <input type="date" id="fecha_inicio" name="fecha_inicio" value="2018-07-22">                   
                        </div>
                        <div class="form-group">
                            <label for="fecha_final">Fecha Cierre</label>
                            <input type="date" id="fecha_final" name="fecha_final" value="2018-07-22">                   
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar<i class="icon-save"></i> 
                        </button>
                        <a href="busquedapeliculas.jsp" class="btn btn-danger">Volver</a>
                    </form>
                </div>
            </div>
        </div>
        <%
            java.util.Date datFecAct=new java.util.Date();
            if(request.getParameter("enviar")!=null){
                String portada =request.getParameter("portada");
                String titulo =request.getParameter("titulo");
                String clasificacion =request.getParameter("clasificacion");
                String sinopsis =request.getParameter("sinopsis");
                String en_cartelera =request.getParameter("en_cartelera");
                //String fecha_inicio = String.valueOf(datFecAct);
                String fecha_inicio = request.getParameter("fecha_inicio");
                String fecha_final = request.getParameter("fecha_final");
                try{
                    Connection con=null;
                    Statement st=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectocine", "root", "root");
                    st=con.createStatement();
                    st.executeUpdate("insert into pelicula(portada,titulo,clasificacion,sinopsis,en_cartelera,fecha_inicio,fecha_final) values ('"+portada+"','"+titulo+"','"+clasificacion+"','"+sinopsis+"','"+en_cartelera+"','"+fecha_inicio+"','"+fecha_final+"');");
                    request.getRequestDispatcher("busquedapeliculas.jsp").forward(request, response);
                    //response.sendRedirect("busquedapeliculas.jsp");
                }catch(Exception e){
                    out.print(e.getMessage());
                }
            }
        %>
    </body>
</html>
