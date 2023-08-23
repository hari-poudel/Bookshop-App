package com.DAO;

import com.DB.DBConnect;
import com.entity.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAoImpl implements UseDAO{
    private Connection conn;

    public UserDAoImpl(Connection conn) {
        super();

        this.conn = DBConnect.getConn();
    }


    @Override
    public boolean userRegister(User us) {

        boolean f=false;
        try {

            PreparedStatement ps;
            ps = conn.prepareStatement ("insert into user (name, email, phno, password) values (?, ?, ?, ?)");

            ps.setString(1, us.getName());
                ps.setString(2, us.getEmail());
                ps.setString(3, us.getPhno());
                ps.setString(4, us.getPassword());
            int i = ps.executeUpdate();

            if(i==1){
                f=true;
            }

        } catch (Exception e)
        {
           e.printStackTrace();
            }
        return f;
    }

    @Override
    public User login(String email, String password) {
        User us= null;
        try {
            String sql="select * from user where email=?";
            PreparedStatement ps= conn.prepareStatement(sql);
            ps.setString(1,email);

            ResultSet rs= ps.executeQuery();
            while (rs.next())
            {
                String hashedPasswordFromDb = rs.getString("password");
                if (BCrypt.checkpw(password, hashedPasswordFromDb)) {
                    us = new User();
                    us.setId(rs.getInt(1));
                    us.setName(rs.getString(2));
                    us.setEmail(rs.getString(3));
                    us.setPhno(rs.getString(4));
                    us.setPassword(rs.getString(5));
                    break;
                }


            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return us;

    }

    @Override
    public boolean checkPassword(int id, String ps) {
        boolean f=false;
        try {
            String sql="select * from user where id=?";
            PreparedStatement pst= conn.prepareStatement(sql);
            pst.setInt(1, id);

            ResultSet rs= pst.executeQuery();
            while (rs.next()){
                String hashedPasswordFromDb = rs.getString("password");
                if (BCrypt.checkpw(ps, hashedPasswordFromDb)){
                    f=true;
                }

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updateProfile(User us) {
        boolean f=false;
        try {
            String sql= "update user set name=?,email=?,phno=?  where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
           ps.setInt(4,us.getId());
            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkUser(String email, String phno) {
        boolean f=true;
        try {

            String sql= "select * from user where email=? and phno=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, phno);
           ResultSet rs=ps.executeQuery();
           while (rs.next()){
               f=false;
           }

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<User> getAllUser() {
        List<User>list=new ArrayList<User>();
        User us=null;
        try {
            String sql="select * from user";
            PreparedStatement ps;
            ps= conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                us=new User();
                us.setId(1);
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                list.add(us);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }


    @Override
    public List<User> getUserBySearch(String ch1) {
        List<User> list = new ArrayList<>();
        User us = null;
        try {
            String sql = "SELECT * FROM user WHERE name LIKE ? OR email LIKE ? OR phno LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            // Setting the search parameter for name, email, and phone number
            ps.setString(1, "%" + ch1 + "%");
            ps.setString(2, "%" + ch1 + "%");
            ps.setString(3, "%" + ch1 + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(1);
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                list.add(us);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

