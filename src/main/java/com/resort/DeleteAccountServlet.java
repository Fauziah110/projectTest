package com.resort;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteAccount")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer staffId = (Integer) session.getAttribute("staffId");

        if (staffId == null) {
            response.sendRedirect("index.jsp?error=notLoggedIn");
            return;
        }

        System.out.println("Attempting to delete account for staffId: " + staffId); // Debugging line

     
    

        try {
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = AzureConnection.getConnection();
            String sql = "DELETE FROM STAFF WHERE STAFFID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, staffId);

            int rowsDeleted = ps.executeUpdate();
            System.out.println("Rows Deleted: " + rowsDeleted); // Debugging line

            if (rowsDeleted > 0) {
                // Invalidate the session and redirect to a confirmation page
                session.invalidate();
                response.sendRedirect("AccountDeleted.jsp");
            } else {
                response.sendRedirect("AdminProfile.jsp?error=deleteFailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminProfile.jsp?error=exception");
        }
    }
}
