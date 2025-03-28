/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

/**
 *
 * @author User
 */
import com.entity.User;
public interface UserDAO {
    public boolean userRegister(User us);
    
    public User login(String email, String password);
    
    public boolean checkPassword(int id, String ps);
    
    public boolean updateProfile(User us);
    
    public boolean checkUser(String em);    
}
