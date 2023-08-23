package com.userservlet;

import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Regular expression for password validation (8 to 20 characters, at least one uppercase letter, one lowercase letter, one digit, and one special character)
    private static final String PASSWORD_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=])[a-zA-Z\\d@#$%^&+=]{8,20}$";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;

        // Validate the new password format using regex
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            // Validate password format using regex
            Pattern pattern = Pattern.compile(PASSWORD_REGEX);
            Matcher matcher = pattern.matcher(newPassword);

            if (matcher.matches()) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshope", "root", "SMith_$&@");

                    // Hash the new password using bcrypt
                    String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

                    PreparedStatement pst = con.prepareStatement("update user set password = ? where email = ? ");
                    pst.setString(1, hashedPassword);
                    pst.setString(2, (String) session.getAttribute("email"));

                    int rowCount = pst.executeUpdate();
                    if (rowCount > 0) {
                        session.setAttribute("succMsg", "Password Reset successfully ..");
                        response.sendRedirect("login.jsp");
                    } else {
                        session.setAttribute("failedMsg", "Something Wrong..");
                        response.sendRedirect("login.jsp");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                session.setAttribute("failedMsg", "Password format is invalid.");
                response.sendRedirect("newPassword.jsp");
            }
        } else {
            session.setAttribute("failedMsg", "Your Password do not match.");
            response.sendRedirect("newPassword.jsp");
        }
    }
}
