package Dao;

import Model.Book;

import java.util.List;

public interface BookDao {

    public boolean addBook(Book book);
    public List<Book> showBook();
    public Book getBookId(int id);
    public boolean editBook(Book book);
    public boolean deleteBook(int id);
}	
