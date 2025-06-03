package org.codexdei.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/registration")
public class FormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //los nombres que van dentro del getParameter deben ser los mismos que estan en el "name" del html
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        resp.setContentType("text/html");

        try (PrintWriter out = resp.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("       <title>Result Form</title>");
            out.println("   </head>");
            out.println("   <body>");
            out.println("       <h1>Result Form!</h1>");
            out.println("       <ul>");
            out.println("          <li>Username : " + userName + "</li>");
            out.println("          <li>Password : " + password + "</li>");
            out.println("          <li>Email : " + email + "</li>");
            out.println("       </ul>");
            out.println("   </body>");
            out.println("</html>");
        }
    }
}
