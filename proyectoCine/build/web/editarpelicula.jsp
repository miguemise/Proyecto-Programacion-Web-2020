<%-- 
    Document   : editarpelicula
    Created on : 06/10/2020, 17:59:33
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
        <title>EditarPelicula</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado").equals("0") || sesion.getAttribute("logueado") == null) {
                response.sendRedirect("login.jsp");
            }
            String id_pelicula=request.getParameter("id_pelicula");
            String portada = request.getParameter("portada");
            String titulo = request.getParameter("titulo");
            String en_cartelera = request.getParameter("en_cartelera");
        %>
        <div class="container" mt-5>
            <div class="row">
                <div class="col-sm">
                    <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand">Editar Peliculas Publicadas</a>
                <th scope="col"><a href="principal.jsp"><i class="icon-home"></i></a></th>
            </nav>
                    <form action="editarpelicula.jsp" method="get">
                        <div class="form-group">
                            <img src=<%=portada%> \" width="200" >                  
                        </div>
                        <div class="form-group">
                            <label for="titulo">Modificar Titulo</label>
                            <input type="text" value="<%=titulo%>" class="form-control" id="titulo" placeholder="Titulo" name="titulo" required="required">                   
                        </div>
                        <div class="form-group">
                            <label for="en_cartelera">Mantener en Cartelera</label>
                            <select name="en_cartelera" id="en_cartelera" value="<%=en_cartelera%>">
                                <option value="si">Si</option>
                                <option value="no">No</option>
                            </select>                   
                        </div>
                        
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar<i class="icon-save"></i>
                        </button>
                        <a href="busquedapeliculas.jsp" class="btn btn-danger">Volver</a>
                        <%--Mantener guardado el valor de variables que no presento portada, id_pelicula--%>
                        <input type="hidden" name="portada" value="<%= portada%>" >
                        <input type="hidden" name="id_pelicula" value="<%= id_pelicula%>" >
                    </form>
                </div>
            </div>
        </div>
    </body>
    <%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        if(request.getParameter("guardar")!=null){
            if(!titulo.equals(null)&&!en_cartelera.equals(null)){
            
                try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectocine", "root", "root");
                        st = con.createStatement();
                        String query = "UPDATE pelicula SET ";
                        String tituloMOD = "titulo='"+titulo+"'";
                        String en_carteleraMOD = ",en_cartelera='"+en_cartelera+"'";
                        String where = " WHERE id_pelicula='"+id_pelicula+"'";
                        query=query+tituloMOD+en_carteleraMOD+where;
                        
                        st.executeUpdate(query);
                    } catch (Exception e) {
                    }
        }
        }
        
        %>
</html>
