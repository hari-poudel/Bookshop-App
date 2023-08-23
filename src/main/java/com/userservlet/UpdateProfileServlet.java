package com.userservlet;

import com.DAO.UserDAoImpl;
import com.DB.DBConnect;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id=Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password=req.getParameter("password");

            UserDAoImpl dao=new UserDAoImpl(DBConnect.getConn());
            boolean f= dao.checkPassword(id, password);
            HttpSession session=req.getSession();
            if (phno.matches("^(97|98)\\d{8}$"))
            if(f){
                User us=new User();
                us.setId(id);
                us.setName(name);
                us.setEmail(email);
                us.setPhno(phno);
                boolean f2= dao.updateProfile(us);
                if(f2){
                    session.setAttribute("succMsg", "Profile Update successfully ..");
                    resp.sendRedirect("Edit_profile.jsp");
                }else{
                    session.setAttribute("failedMsg", "Something Wrong..");
                    resp.sendRedirect("Edit_profile.jsp");
                }
            }else{
                session.setAttribute("failedMsg", "Your Password is incorrect");
                resp.sendRedirect("Edit_profile.jsp");
            }else {
                session.setAttribute("failedMsg", "Invalid phone number format");
                resp.sendRedirect("Edit_profile.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
