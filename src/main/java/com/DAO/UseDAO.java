package com.DAO;

import com.entity.User;

import java.util.List;

public interface UseDAO {
    public boolean userRegister(User us);
    public User login(String email, String password);
    public boolean checkPassword(int id, String ps);
    public boolean updateProfile(User us);
   public boolean checkUser(String email, String phno);
    public List<User>getAllUser();
    public List<User> getUserBySearch(String ch1);



}
