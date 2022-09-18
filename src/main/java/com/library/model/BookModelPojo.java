package com.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "bookcollection")
public class BookModelPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bId")
    private int bookId;

    @Column(name = "bName")
    @NotNull(message = "please specify the book name")
    private String bookName;

    @Column(name = "bAuthor")
    @NotNull(message = "please specify a book Author")
    private String bookAuthor;

    @Column(name = "bPrice")
    @NotNull(message = "please specify the cost of the book")
    private int bookCost;

    @Column(name = "bCount")
    @NotNull(message = "please specify the number of books to be added")
    private int noOfItems;

    @Column(name = "bIssueCount")
    @NotNull(message = "please specify the number of books you want to issue")
    private int noOfBookIssued;

    public BookModelPojo() {
        super();
    }

    public int getNoOfBookIssued() {
        return noOfBookIssued;
    }

    public void setNoOfBookIssued(int noOfBookIssued) {
        this.noOfBookIssued = noOfBookIssued;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public int getBookCost() {
        return bookCost;
    }

    public void setBookCost(int bookCost) {
        this.bookCost = bookCost;
    }

    public int getNoOfItems() {
        return noOfItems;
    }

    public void setNoOfItems(int noOfItems) {
        this.noOfItems = noOfItems;
    }

}
