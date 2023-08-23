package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get form data
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            String status = req.getParameter("status");
            Part part = req.getPart("bimg"); //to access for the files...
            String fileName = part.getSubmittedFileName();
            String quantity = req.getParameter("quantity");
            String about = req.getParameter("about");
            String isbn = req.getParameter("ISBN");

            // Validate all fields
            if (bookName.isEmpty() || author.isEmpty() || price.isEmpty() || categories.isEmpty() || status.isEmpty() ||
                    part.getSize() == 0 || fileName.isEmpty() || about.isEmpty() || isbn.isEmpty()) {
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "All fields are required");
                resp.sendRedirect("admin/add_books.jsp");
                return;
            }

            // Validate ISBN format (must be 13 numerical digits)
            if (!isbn.matches("\\d{13}")) {
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "Invalid ISBN format. ISBN should be 13 numerical digits.");
                resp.sendRedirect("admin/add_books.jsp");
                return;
            }

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

            // Check if ISBN already exists
            boolean isbnExist = dao.checkISBN(isbn);
            BookDtls b = new BookDtls(bookName, author, price, categories, status, quantity, about, isbn, fileName, "admin");
            HttpSession session = req.getSession();
            if (isbnExist) {
                boolean f = dao.addBooks(b);
                if (f) {
                    // the process of storing the file
                    String path = getServletContext().getRealPath("") + "book";
                    File file = new File(path);

                    part.write(path + File.separator + fileName);

                    session.setAttribute("succMsg", "Book Added Successfully");
                    resp.sendRedirect("admin/add_books.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something Went Wrong");
                    resp.sendRedirect("admin/add_books.jsp");
                }
            }else {
                session.setAttribute("failedMsg", "same twice book can't add");
                resp.sendRedirect("admin/add_books.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
