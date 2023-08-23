package com.userservlet;

import com.DAO.ReviewDAOImpl;
import com.DB.DBConnect;
import com.entity.review_user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/AddReviewServlet")

public class AddReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        try {

            String userName = request.getParameter("user_name");
            String Email=request.getParameter("user_email");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("comment");

            review_user riv=new review_user(userName,Email,rating,comment);
            ReviewDAOImpl dao= new ReviewDAOImpl(DBConnect.getConn());
            boolean f;
            f= dao.review(riv);
            HttpSession session=request.getSession();
            if(f){

                session.setAttribute("succMsg", "thank you for your valuable feedback");
                response.sendRedirect("index.jsp");;
            }else{
                session.setAttribute("failedMsg", "Something  Wrong");
                response.sendRedirect("index.jsp");

            }


        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
