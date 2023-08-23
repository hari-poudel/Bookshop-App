package com.DAO;

import com.entity.Book_order;

import java.util.List;

public interface BookOrderDAO {

    boolean saveOrder(List<Book_order> b);
    public List<Book_order> getBook(String email);
    public List<Book_order> getAllOrder();
    public boolean cancelorder(String id);
}
