package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.model.BookModelPojo;

@Repository
public class BookDaoImpl implements BookDao {

    @Autowired
    private SessionFactory factory;

    @Override
    public void saveBook(BookModelPojo book) {
        Session session = factory.getCurrentSession();
        Query query = session.createQuery("from BookModelPojo");
        List<BookModelPojo> list = query.getResultList();
        

        int totalCount = 0;
        BookModelPojo bookFromDB = null;
        boolean isRecordPresent = false;

        //Logic for update if want to add same book in the DB
        for(int i=0; i<list.size(); i++) {
            bookFromDB = list.get(i);
            if(bookFromDB.getBookName().equalsIgnoreCase(book.getBookName()) && bookFromDB.getBookAuthor().equalsIgnoreCase(book.getBookAuthor())) {
                totalCount = bookFromDB.getNoOfItems()+book.getNoOfItems();
                isRecordPresent = true;
                break;
            }
        }
        
        if(isRecordPresent) {
            bookFromDB.setNoOfItems(totalCount);
            bookFromDB.setBookCost(book.getBookCost());
            session.update(bookFromDB); //This will update the respective ID consisting of this record
        }
        //If the book is not present in the DB, then save it as a new record
        else {
            session.save(book); //This will be saved with an a new ID
        }
    }

    @Override
    public List<BookModelPojo> getBooksFromDB() {
        Session session = factory.getCurrentSession();
        Query query = session.createQuery("from BookModelPojo");
        List<BookModelPojo> list = query.getResultList();
        return list;
    }

    @Override
    public void updateRespectiveBook(BookModelPojo bookFromPage) {

        Session session = factory.getCurrentSession();
        session.update(bookFromPage);

    }

    @Override
    public void deleteBook(int bId) {

        Session session = factory.getCurrentSession();
        BookModelPojo bookToBeDeleted = session.get(BookModelPojo.class, bId);
        session.delete(bookToBeDeleted);

    }

    @Override
    public BookModelPojo getBook(int bId) {

        Session session = factory.getCurrentSession();
        BookModelPojo book = session.get(BookModelPojo.class, bId);
        return book;

    }

}
