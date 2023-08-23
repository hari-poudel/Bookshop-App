package com.DAO;

import com.entity.review_user;

import java.util.List;

public interface ReviewDAo {
    public  boolean review (review_user riv);
    public List<review_user> getAllreview();
}
