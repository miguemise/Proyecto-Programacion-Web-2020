<%-- 
    Document   : borrarpelicula
    Created on : 06/10/2020, 17:51:48
    Author     : mmise
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EliminarPeliculas</title>
    </head>
    <body>
         <% Connection con=null;
        Statement st=null;
        ResultSet rs=null;//aqui se guardan los resultados de las busquedas
        
        try{
                    
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectocine", "root", "root");
                    st=con.createStatement();
                    //borrar cuando coincida el id
                    st.executeUpdate("delete from pelicula where id_pelicula='"+request.getParameter("id_pelicula")+"';");
                    //redireccionar a la pagina principal
                    request.getRequestDispatcher("busquedapeliculas.jsp").forward(request, response);
                    
        }catch(Exception e){
            out.print(e);
        }

        %>
    </body>
</html>
