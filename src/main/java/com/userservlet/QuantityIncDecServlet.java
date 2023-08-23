package com.userservlet;

import com.entity.Book_order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            ArrayList<Book_order> order_list = (ArrayList<Book_order>) request.getSession().getAttribute("order-list");

            if (action != null && id >= 1) {
                if (action.equals("inc")) {
                    for (Book_order b : order_list) {
                        if (b.getId() == id) {
                            int quantity = b.getQuantity();
                            quantity++;
                            b.setQuantity(quantity);
                            response.sendRedirect("cart.jsp");
                        }
                    }
                }

                if (action.equals("dec")) {
                    for (Book_order b : order_list){
                        if (b.getId() == id && b.getQuantity() > 1) {
                            int quantity = b.getQuantity();
                            quantity--;
                            b.setQuantity(quantity);
                            break;
                        }
                    }
                    response.sendRedirect("cart.jsp");
                }
            } else {
                response.sendRedirect("cart.jsp");
            }
        }
    }

}
