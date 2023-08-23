package com.DAO;

import com.entity.review_user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAOImpl implements ReviewDAo {
    private Connection conn;

    public ReviewDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean review(review_user riv) {

        boolean f = false;
        try {
            PreparedStatement ps;
            ps = conn.prepareStatement("insert into review(name, email, rating, comment) values (?,?,?,?)");
            ps.setString(1, riv.getName());
            ps.setString(2, riv.getEmail());
            ps.setString(3, riv.getRating());
            ps.setString(4, riv.getComment());

            int i;
            i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    @Override
    public List<review_user> getAllreview() {
        List<review_user> list=new ArrayList<review_user>();
        review_user riv=null;
        try {
            String sql="select * from review";
            PreparedStatement ps;
            ps= conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                riv=new review_user();
                riv.setId(1);
                riv.setName(rs.getString(2));
                riv.setEmail(rs.getString(3));
                riv.setRating(rs.getString(4));
                riv.setComment(rs.getString(5));
                list.add(riv);
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}