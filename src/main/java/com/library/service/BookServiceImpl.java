package com.library.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dao.BookDao;
import com.library.model.BookModelPojo;

@Service
public class BookServiceImpl implements BookService {
    
    @Autowired
    private BookDao bookDao;

    @Override
    @Transactional
    public void saveBook(BookModelPojo book) {
        bookDao.saveBook(book);
    }

    @Override
    @Transactional
    public List<BookModelPojo> getBooksFromDB() {
        return bookDao.getBooksFromDB();
    }

    @Override
    @Transactional
    public void updateRespectiveBook(BookModelPojo bookFromPage) {
        bookDao.updateRespectiveBook(bookFromPage);
    }

    @Override
    @Transactional
    public void deleteBook(int bId) {
        bookDao.deleteBook(bId);
    }

    @Override
    @Transactional
    public BookModelPojo getBook(int bId) {
        return bookDao.getBook(bId);
    }


}
