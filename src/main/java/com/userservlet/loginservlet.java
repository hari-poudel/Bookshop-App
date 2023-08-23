package com.userservlet;

import com.DAO.UserDAoImpl;
import com.DB.DBConnect;
import com.entity.User;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/login")
public class loginservlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAoImpl dao=new UserDAoImpl(DBConnect.getConn());
            HttpSession session= req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // admin login...!
            if("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us=new User();
                us.setName("Admin");
                session.setAttribute("userobj", us);
                resp.sendRedirect("admin/home.jsp");
            } else {
                User us=dao.login(email, password);
                if(us!=null){
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("index.jsp");
                }else {
                    session.setAttribute("failedMsg", "email & password invalid");
                    resp.sendRedirect("login.jsp");
                }


            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
