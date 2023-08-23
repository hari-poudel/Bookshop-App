package com.userservlet;

import com.DAO.BookOrderImpl;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cancel_order")
public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id=req.getParameter("id");
            BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
            boolean f= dao.cancelorder(id);
            HttpSession session=req.getSession();
            if(f){
                session.setAttribute("succMsg", "Order Cancelled .");
                resp.sendRedirect("order.jsp");
            }else {
                session.setAttribute("failedMsg", "Something Wrong..");
                resp.sendRedirect("order.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
