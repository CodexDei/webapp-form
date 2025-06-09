package org.codexdei.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/registration")
public class FormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        //los nombres que van dentro del getParameter deben ser los mismos que estan en el "name" del html
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        String[] languagesProgramming = req.getParameterValues("languages");
        String[] roles = req.getParameterValues("roles");
        String language = req.getParameter("language");
        boolean enabled = req.getParameter("enabled") != null &&
                req.getParameter("enabled").contains("on");
        String secret = req.getParameter("secret");
        //Validacion que general de los campos anteriores
        Map<String,String> errors = new HashMap();

        //isBlank es mas completo que is.empty, porque cubre vacios y en blanco
        if (userName == null || userName.isBlank()) {
            errors.put("username","Username cannnot be null or empty");
        }
        if (password == null || password.isBlank()) {
            errors.put("password","Password cannnot be null or empty");
        }
        if (email == null || email.isBlank() || !email.contains("@")) {
            errors.put("email","Email cannnot be null or empty and must include '@'");
        }
        if (country == null || country.isBlank()) {
            errors.put("country","Username cannnot be null or empty");
        }
        if (languagesProgramming == null || languagesProgramming.length == 0) {
            errors.put("languagesProgramming","Languages programming cannnot be null or empty");
        }
        if (roles == null || roles.length == 0) {
            errors.put("roles","You must select at least one Rol");
        }
        //Solo con null, ya que es un radio button, es decir, unica opcion
        //Por lo que no aplica vacio
        if (language == null) {
            errors.put("language","You must select one language");
        }

        if (errors.isEmpty()) {

            try (PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");
                out.println("       <title></title>");
                out.println("   </head>");
                out.println("   <body>");
                out.println("       <h1></h1>");
                out.println("   </body>");
                out.println("</html>");
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");
                out.println("       <title>Result Form</title>");
                out.println("   </head>");
                out.println("   <body>");
                out.println("     <h1>Result Form!</h1>");

                out.println("     <ul>");
                out.println("          <li>Username : " + userName + "</li>");
                out.println("          <li>Password : " + password + "</li>");
                out.println("          <li>Email : " + email + "</li>");
                out.println("          <li>Country : " + country + "</li>");

                out.print("          <li>Language(s) Programming: <ul>");
                Arrays.asList(languagesProgramming).forEach(lang ->
                        out.println("<li>" + lang + "</li>"));
                out.print("                          </ul></li>");

                out.print("          <li>Language(s): <ul>");
                Arrays.asList(roles).forEach(role ->
                        out.println("<li>" + role + "</li>"));
                out.print("                          </ul></li>");


                out.println("          <li>Language: " + language + "</li>");
                out.println("          <li>Enabled: " + enabled + "</li>");
                out.println("          <li>Secret: " + secret + "</li>");

                out.println("      </ul>");

                out.println("   </body>");
                out.println("</html>");

            }

        } else {
//                errors.forEach(error -> {
//                    out.println("<li>" + error + "</li>");
//                });
//                out.println("<p><a href= \"/webapp-form/index.jsp\">Return form</a></p>");
            req.setAttribute("errors", errors);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
