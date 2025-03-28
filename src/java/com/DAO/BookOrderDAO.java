/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Book_Order;
import java.util.List;

/**
 *
 * @author User
 */
public interface BookOrderDAO {

    
    public boolean saveOrder(List<Book_Order> b);
    
    public List<Book_Order> getBook(String email);
    
    public List<Book_Order> getAllOrder();
}
