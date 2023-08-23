package com.DAO;

import com.entity.Book_order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderImpl implements BookOrderDAO {
    private Connection conn;

    public BookOrderImpl(Connection conn) {
        this.conn = conn;
    }




    @Override
    public boolean saveOrder(List<Book_order> blist) {
        boolean f =false;
        try {
            String sql = "insert into book_order(order_id,user_name,email,address,phno,book_name,author,price,payment,date) values(?,?,?,?,?,?,?,?,?,?)";

            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            for (Book_order b : blist) {
                ps.setString(1, b.getOderId());
                ps.setString(2, b.getUsername());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getFulladd());
                ps.setString(5, b.getPhno());
                ps.setString(6, b.getBookName());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPaymentType());
                ps.setString(10,b.getDate());
               ps.addBatch();

            }
            int[] count = ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Book_order> getBook(String email) {
        List<Book_order> list=new ArrayList<Book_order>();
        Book_order o=null;
        try {
            String sql= "select * from book_order where email=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs= ps.executeQuery();
            while (rs.next()){
                o=new Book_order();
                o.setId(rs.getInt(1));
                o.setOderId(rs.getString(2));
                o.setUsername(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFulladd(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                o.setQuantity(rs.getInt(11));
                list.add(o);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Book_order> getAllOrder() {
        List<Book_order> list=new ArrayList<Book_order>();
        Book_order o=null;
        try {
            String sql= "select * from book_order ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                o=new Book_order();
                o.setId(rs.getInt(1));
                o.setOderId(rs.getString(2));
                o.setUsername(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFulladd(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                o.setDate(rs.getString(11));
                list.add(o);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean cancelorder(String id) {

        boolean f = false;
        try {
            String sql = "delete From book_order where order_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, String.valueOf(id));
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}



