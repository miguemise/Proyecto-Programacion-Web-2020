package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Security.MD5;
import java.sql.*;
import com.mysql.jdbc.Driver;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link href=\"//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" integrity=\"sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z\" crossorigin=\"anonymous\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>login</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("            <div class=\"Container sm-5\">\n");
      out.write("                <h3>&nbsp;&nbsp;Ingreso Al Sistema</h3>\n");
      out.write("                <div class=\"card-md-6\">\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <form action=\"login.jsp\" method=\"post\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label>Login</label>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"user\" placeholder=\"Ingrese Usuario\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label>Password</label>\n");
      out.write("                                <input type=\"password\" class=\"form-control\" name=\"password\" placeholder=\"Ingrese clave\">\n");
      out.write("                            </div>\n");
      out.write("                            <button type=\"submit\" name=\"btnAceptar\" class=\"btn btn-primary\">Aceptar</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\" integrity=\"sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\" integrity=\"sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            body {\n");
      out.write("              color: purple;\n");
      out.write("              background-color: black }\n");
      out.write("            h3{\n");
      out.write("                color: aliceblue\n");
      out.write("            }\n");
      out.write("            label{\n");
      out.write("                color: aliceblue\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("</body>\n");
      out.write("    ");

        
        Statement st=null;
        ResultSet rs=null;
        MD5 md5= new MD5();
        
            if (request.getParameter("btnAceptar")!= null){
                Connection con;
                String user = request.getParameter("user");
                String password = request.getParameter("password");
                HttpSession sesion = request.getSession();
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectocine", "root", "root");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM usuario where login='"+user+"'and password= '"+md5.getMD5(password)+"';");
                    while (rs.next()) {
                        sesion.setAttribute("logueado",rs.getString("tipouser"));
                        sesion.setAttribute("nombre",rs.getString("nombre"));
                        sesion.setAttribute("user",rs.getString("login"));
                        response.sendRedirect("principal.jsp");
                    }
                    out.print("<div class=\"alert alert-danger\" role=\"alert\">usuario no valido</div>");
                    con.close();
                } catch (Exception e) {
                    out.print("<div class=\"alert alert-danger\" role=\"alert\">No se conecta a la base "+e.getMessage()+"</div>");
                } finally {
                    
                }
            }
        
        
      out.write("\n");
      out.write("</html\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
