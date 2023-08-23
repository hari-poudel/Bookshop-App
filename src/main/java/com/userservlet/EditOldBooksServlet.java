package com.userservlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/editoldbooks")
public class EditOldBooksServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id=Integer.parseInt(req.getParameter("id"));
            String bookName=req.getParameter("bname");
            String author=req.getParameter("author");
            String price=req.getParameter("price");
            BookDtls c= new BookDtls();
            c.setBookId(id);
            c.setBookName(bookName);
            c.setAuthor(author);
            c.setPrice(price);
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            boolean f= dao.updateOldBooks(c);
            HttpSession session=req.getSession();
            if(f)
            {
                session.setAttribute("succMsg", "Book Update Successfully..");
                resp.sendRedirect("old_book.jsp");
            }else {
                session.setAttribute("failedMsg", "Something wrong on server");
                resp.sendRedirect("old_book.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

