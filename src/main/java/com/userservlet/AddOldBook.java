package com.userservlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get form data
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = "Old";
            String status = "Active";
            String quantity = req.getParameter("quantity");
            String about = req.getParameter("about");
            String isbn = req.getParameter("ISBN");
            Part part = req.getPart("bimg"); //to access for the files...
            String fileName = part.getSubmittedFileName();
            String useremail = req.getParameter("user");

            // Validate all the required fields
            if (bookName.isEmpty() || author.isEmpty() || price.isEmpty()
                    || about.isEmpty() || isbn.isEmpty()) {
                // If any required field is empty, redirect back to the form with an error message
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "All fields are required!");
                resp.sendRedirect("sell_book.jsp");
                return; // Stop processing further as some required fields are missing
            }

            // Validate ISBN number is exactly 13 digits long
            if (isbn.length() != 13) {
                // If ISBN is not 13 digits long, redirect back with an error message
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "ISBN must be exactly 13 digits long!");
                resp.sendRedirect("sell_book.jsp");
                return; // Stop processing further as ISBN is invalid
            }

            // All validations passed, proceed with adding the book
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean isbnExist = dao.checkISBN(isbn);
            BookDtls b = new BookDtls(bookName, author, price, categories, status, quantity, about, isbn, fileName, useremail);


            HttpSession session = req.getSession();
            if (isbnExist) {
                boolean f = dao.addBooks(b);
                if (f) {
                    // the process of storing the file
                    String path = getServletContext().getRealPath("") + "book";
                    File file = new File(path);

                    part.write(path + File.separator + fileName);

                    session.setAttribute("succMsg", "Book Added Successfully");
                    resp.sendRedirect("sell_book.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something Went Wrong");
                    resp.sendRedirect("sell_book.jsp");
                }
            }else {
                session.setAttribute("failedMsg", "Sorry! this book is already avliable, check it first..");
                resp.sendRedirect("sell_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
