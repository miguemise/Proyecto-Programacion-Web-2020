<%-- 
    Document   : busquedapeliculas
    Created on : 06/10/2020, 13:27:12
    Author     : mmise
--%>
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
        <title>Busqueda de Peliculas</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado").equals("0") || sesion.getAttribute("logueado") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="container">
             <%-- barra de navegacion --%>
             <nav class="navbar navbar-light bg-light">
                 <a class="navbar-brand">Busqueda de peliculas</a>
                 <th scope="col">
                     <a href="principal.jsp"><i class="icon-home"></i></a> 
                 </th>
             </nav>
            <%-- fin barra de navegacion --%>
            <div class="row" mt-2>
                <div class="col-sm">
                    <form action="busquedapeliculas.jsp" method="post">

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center"></th>
                                    <th scope="col" class="text-center">
                                        <input type="text" name="titulo" class="form-control" placeholder="Buscar por titulo" />
                                    </th>
                                    <th scope="col" class="text-center">
                                        <input type="submit" value="Buscar" name="buscarboton" class="form-control btn btn-primary" />
                                        
                                    </th>
                                    
                                    <th></th>
                                    <%if(sesion.getAttribute("logueado").equals("A")){
                                        %>
                                        <th scope="col" class="text-right">
                                        <a href="crearpelicula.jsp"><i class="icon-plus-sign-alt" style="margin: 5px"></i></a>Agregar
                                    </th>
                                    <%}
                                        %>
                                    
                                </tr>
                                <tr>
                                    <th scope="col">Portada</th>
                                    <th scope="col">Titulo</th>
                                    <th scope="col">Clasificacion</th>
                                    <th scope="col">Sinopsis</th>
                                    <th scope="col">En cartelera</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectocine", "root", "root");
                                        st = con.createStatement();
                                        //rs = st.executeQuery("SELECT * FROM pelicula;");
                                        String query = "SELECT * FROM pelicula";
                                        String where = " where 1=1 ";
                                        String titulo = request.getParameter("titulo");
                                        if(titulo!=null){
                                            titulo=titulo+"%";
                                        //where = where + " and titulo='" + titulo + "'";
                                        where = where + " and titulo LIKE '" + titulo + "'";
                                        query=query+where;//unir el select con el where
                                        }
                                        rs=st.executeQuery(query);
                                        while (rs.next()) {

                                        %>
                                <tr>
                                    <th scope="row"><img src=<%=rs.getString("portada")%> \" width="80" ></th>
                                    <td><%=rs.getString("titulo")%></td>
                                    <td><%=rs.getString("clasificacion")%></td>
                                    <td><%=rs.getString("sinopsis")%></td>
                                    <td><%=rs.getString("en_cartelera")%></td>
                                    
                                    <td>
                                        <%if(sesion.getAttribute("logueado").equals("A")){
                                            %>
                                            <a href="editarpelicula.jsp?id_pelicula=<%=rs.getString("id_pelicula")%>&portada=<%=rs.getString("portada")%>&titulo=<%=rs.getString("titulo")%>&en_cartelera=<%=rs.getString("en_cartelera")%>"<i class="icon-edit"></i></a>
                                        <a href="borrarpelicula.jsp?id_pelicula=<%=rs.getString("id_pelicula")%>"><i class="icon-trash"></i></a>
                                        <%}
                                            %>
                                        <i class="icon-shopping-cart"></i>
                                    </td>

                                </tr>
                                <%}
                                    } catch (Exception e) {
                                        out.println("error" + e);
                                    } finally {
                                            rs.close();
                                            con.close();
                                            
                                    }
                                %>
                                
                                
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            
        </div>
    </body>
</html>
