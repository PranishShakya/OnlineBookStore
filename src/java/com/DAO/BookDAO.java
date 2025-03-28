/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.BookDtls;
import java.util.List;

/**
 *
 * @author User
 */
public interface BookDAO {
    public boolean addBooks(BookDtls b);
    
    public List<BookDtls> getAllBooks();
    
    public BookDtls getBookById(int id);
    
    public boolean updateEditBooks(BookDtls b);
    
    public boolean deleteBooks(int id);
    
    public List<BookDtls> getNewBook();
    
    public List<BookDtls> getRecentBooks();
    
    public List<BookDtls> getOldBooks();
    
    public List<BookDtls> getAllRecentBook();
    
    public List<BookDtls> getAllNewBook();
    
    public List<BookDtls> getAllOldBook();
    
    public List<BookDtls> getBookByOld(String email, String cate);
    
    public boolean oldBookDelete(String email, String cat, int id);
    
    public List<BookDtls> getBookBySearch(String ch);
}
