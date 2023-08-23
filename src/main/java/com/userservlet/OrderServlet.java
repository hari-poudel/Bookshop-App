package com.userservlet;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_order;
import com.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@WebServlet("/order")

public class OrderServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
           HttpSession session=req.getSession();
            int id=Integer.parseInt(req.getParameter("id"));
            String name=req.getParameter("username");
            String email=req.getParameter("email");
            String phno=req.getParameter("phno");
            String municipality=req.getParameter("municipality");
            String district=req.getParameter("district");
            String city=req.getParameter("city");
            String province=req.getParameter("province");
            String pincode=req.getParameter("pincode");
            String paymentType=req.getParameter("payment");
            String fullAdd=municipality+", "+district+", "+city+", "+province+" "+pincode;
            Date currentDate = new Date();

            //System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
            CartDAOImpl dao= new CartDAOImpl(DBConnect.getConn());

           List<Cart> blist= dao.getBookByUser(id);
           if(blist.isEmpty())
           {
               session.setAttribute("failedMsg", "Add Books..");
               resp.sendRedirect("cart.jsp");
           }else{
               BookOrderImpl dao2=new BookOrderImpl(DBConnect.getConn());


               Book_order o= null;
               ArrayList<Book_order> orderList=new ArrayList<>();
               Random r=new Random();
               for(Cart c:blist)
               {
                   o=new Book_order();
                   o.setOderId("Book-ORD-00"+ r.nextInt(1000));
                   o.setUsername(name);
                   o.setEmail(email);
                   o.setPhno(phno);
                   o.setFulladd(fullAdd);
                   o.setBookName(c.getBookName());
                   o.setAuthor(c.getAuthor());
                   o.setPrice(c.getPrice()+"");
                   o.setPaymentType(paymentType);
                   o.setDate(String.valueOf(currentDate));

                   orderList.add(o);

               }
               if("noselect".equals(paymentType)){
                   session.setAttribute("failedMsg", "Select Payment method..");
                   resp.sendRedirect("cart.jsp");
               }else{
                   boolean f=dao2.saveOrder(orderList);
                   if(f){
                       resp.sendRedirect("order_message.jsp");
                   }else {
                       session.setAttribute("failedMsg", "your order failed");
                       resp.sendRedirect("cart.jsp");
                   }
               }

           }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
