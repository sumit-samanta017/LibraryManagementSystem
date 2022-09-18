package com.library.dao;

import java.util.List;

import com.library.model.BookModelPojo;

public interface BookDao {
    
    public void saveBook(BookModelPojo book);
    public List<BookModelPojo> getBooksFromDB();
    public void updateRespectiveBook(BookModelPojo bookFromPage);
    public BookModelPojo getBook(int bId);
    public void deleteBook(int bId);

}
