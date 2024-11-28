package com.projectTest;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

// Map the servlet to the URL "testServlet"
@WebServlet("/projectTestServlet")
public class projectTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");

        // Get the name parameter from the request
        String name = request.getParameter("name");

        // Write the response
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Response</title></head>");
            out.println("<body>");
            out.println("<h1>Hello, " + name + "!</h1>");
            out.println("<a href=\"homeTest.jsp\">Go Back</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
