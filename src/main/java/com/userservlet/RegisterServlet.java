package com.userservlet;

import com.DAO.UserDAoImpl;
import com.DB.DBConnect;
import com.entity.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            String conformPassword=req.getParameter("conformPassword");
            String check = req.getParameter("check");

            // Perform validation
            boolean isValid = true;
            String errorMessage = "";

            // Name validation
            if (name.isEmpty()) {
                isValid = false;
                errorMessage += "Name is required.<br>";
            } else if (!Pattern.matches("[a-zA-Z]+(\\s[a-zA-Z]+)?", name)) {
                isValid = false;
                errorMessage += "Invalid name format. Please enter a valid full name.<br>";
            }

            // Password validation
            if (password.isEmpty()) {
                isValid = false;
                errorMessage += "Password is required.<br>";
            } else if (!Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=])[a-zA-Z\\d@#$%^&+=]{8,20}$", password)) {
                isValid = false;
                errorMessage += "Invalid password format. Password must be 8-20 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.<br>";
            }

            // Confirm Password validation
            if (conformPassword.isEmpty()) {
                isValid = false;
                errorMessage += "Confirm password is required.<br>";
            } else if (!conformPassword.equals(password)) {
                isValid = false;
                errorMessage += "Passwords do not match.<br>";
            }


            // Phone number validation
            if (phno.isEmpty()) {
                isValid = false;
                errorMessage += "Phone number is required.<br>";
            } else if (!Pattern.matches("(98|97)\\d{8}", phno)) {
                isValid = false;
                errorMessage += "Invalid phone number format. Please enter a 10-digit number starting with 98 or 97.<br>";
            }

            // Check validation
            if (check == null) {
                isValid = false;
                errorMessage += "Please agree to the terms and conditions.<br>";
            }

            if (isValid) {
                // Proceed with user registration
                User us = new User();
                us.setName(name);
                us.setEmail(email);
                us.setPhno(phno);
                us.setPassword(hashedPassword);
                HttpSession session = req.getSession();

                UserDAoImpl dao = new UserDAoImpl(DBConnect.getConn());
                boolean isUserExist = dao.checkUser(email, phno);

                if (isUserExist) {
                    boolean isSuccess = dao.userRegister(us);
                    if (isSuccess) {
                        session.setAttribute("succMsg", "Registration successful.");
                        resp.sendRedirect("Register.jsp");
                    } else {
                        session.setAttribute("failedMsg", "Something went wrong. Please try again.");
                        resp.sendRedirect("Register.jsp");
                    }
                } else {
                    session.setAttribute("failedMsg", "User already exists. Please try with a different email or phone number.");
                    resp.sendRedirect("Register.jsp");
                }
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", errorMessage);
                resp.sendRedirect("Register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
