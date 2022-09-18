package com.library.controller;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.library.model.BookModelPojo;
import com.library.service.BookService;

@Controller
public class MyController {

    private ModelAndView mv;

    @Autowired(required = true)
    private BookService bookService;


    @RequestMapping("/")
    public ModelAndView homePage() {
        mv = new ModelAndView("home_page");
        return mv;
    }

    @RequestMapping("/chooseUser")
    public String getUserType(@RequestParam(value = "userType", required = true) String userType, Model model) {
        if(userType.equalsIgnoreCase("admin")) return "admin_actions";

        List<BookModelPojo> booksFromDB = bookService.getBooksFromDB();

        if(booksFromDB.size() == 0) model.addAttribute("msg1", "*** Sorry, we don't have any books which can be issued currently ***");

        model.addAttribute("bookRecords", booksFromDB);

        return "display_records_to_user";
    }

    @RequestMapping("/addRecord")
    public String addRecord() {
        return "add_records";
    }

    @RequestMapping(value = {"/saveRecord"}, method = {RequestMethod.POST})
    public ModelAndView saveRecord(@Valid @ModelAttribute BookModelPojo book, BindingResult res, Model model) {

        if(res.hasErrors()) {
            model.addAttribute("message", "*** Please fill all the required fields correctly ***");
            return new ModelAndView("add_records");
        }

        bookService.saveBook(book);


        return new ModelAndView("save_records");
    }

    //Display the records to the admin
    @RequestMapping(value = "/displayRecord")
    public String displayRecordsToAdmin(Model model) {

        List<BookModelPojo> bookRecords = bookService.getBooksFromDB();

        if(bookRecords.size() == 0) model.addAttribute("msg", "*** Oops... There are no records to display ***");

        else model.addAttribute("bookRecordsFromDB", bookRecords);

        return "display_records_to_admin";
    }

    @RequestMapping("/deleteRecord/{id}")
    public String deleteRecord(@PathVariable("id") int bookId) {

        bookService.deleteBook(bookId);
        return "redirect:/displayRecord";
    }

    @RequestMapping(value = {"/updateRecord/{id}"})
    public String getRecord(@PathVariable("id") int bID, Model model) {

        BookModelPojo bookFromPage = bookService.getBook(bID);

        model.addAttribute("bookRecord", bookFromPage);

        return "update_record";
    }

    @RequestMapping("/updateRecord/updateBookRecord")
    public String updateParticularRecord(@ModelAttribute BookModelPojo book) {

        bookService.updateRespectiveBook(book);

        return "redirect:/displayRecord";
    }

    @RequestMapping("/issueBook/{uniqueID}")
    public String getBookToBeIssued(@PathVariable("uniqueID") String uniqueID, Model model) {
        
        try {
            int bookID = Integer.parseInt(uniqueID.substring(10));
            BookModelPojo bookToBeIssued = bookService.getBook(bookID);
            model.addAttribute("bookToBeIssued", bookToBeIssued);
            
        }catch(NumberFormatException | StringIndexOutOfBoundsException e) {
            e.printStackTrace();
        }

        return "issue_books";
    }
    
    @RequestMapping("/issueSelectedBook")
    public ModelAndView issueBookAndUpdateDatabase(@ModelAttribute(value = "bookToBeIssued") BookModelPojo bookIssued, Model model) {
        
        if(bookIssued.getNoOfBookIssued() > 2) {
            model.addAttribute("msg", "*** Can't issue more than two books at a time ***");
            return new ModelAndView("issue_books");
        }
        
        int noOfIssuedBooks = bookIssued.getNoOfBookIssued();
        int noOfBooksPresentInLib = bookIssued.getNoOfItems();
        
        if(noOfIssuedBooks > noOfBooksPresentInLib) {
            model.addAttribute("msg", "*** Not enough books present ***");
            return new ModelAndView("issue_books");
        } 
        
        int updatedBooks = noOfBooksPresentInLib-noOfIssuedBooks;
        
        System.out.println(bookIssued.getBookId());
        
        if(updatedBooks == 0) {
            int bookId = bookIssued.getBookId();
            bookService.deleteBook(bookId);
        }
        
        else {
            bookIssued.setNoOfItems(updatedBooks);
            bookService.updateRespectiveBook(bookIssued);
        }
        
        List<BookModelPojo> booksFromDB = bookService.getBooksFromDB();
        
        if(booksFromDB.size() == 0) model.addAttribute("msg1", "*** Sorry we don't have any books which can be issued currently ***");
        
        model.addAttribute("bookRecords", booksFromDB);
        
        return new ModelAndView("display_records_to_user");
    }
    
    @RequestMapping("/returnBook/{uniqueID}")
    public String returnSelectedBook(@PathVariable("uniqueID") String uniqueID, Model model) {
        
        try {
            int bookID = Integer.parseInt(uniqueID.substring(10));
            BookModelPojo bookToBeReturned= bookService.getBook(bookID);
            model.addAttribute("bookToBeReturned", bookToBeReturned);
            
        }catch(NumberFormatException | StringIndexOutOfBoundsException e) {
            e.printStackTrace();
        }
        
        return "return_books";
        
    }

}
