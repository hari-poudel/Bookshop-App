package com.DAO;

import com.entity.BookDtls;

import java.util.List;

public interface BookDAO {
    public boolean addBooks(BookDtls b);
    public List< BookDtls> getAllBooks();
    public BookDtls getBookbyId(int id);
    public boolean updateEditBooks(BookDtls b);
    public boolean deleteBooks(int id);
    public List<BookDtls> getNewBook();
    public List<BookDtls> getRecentBooks();
    public List<BookDtls>getOldBooks();
    public List<BookDtls>getAllRecentBook();
    public List<BookDtls>getAllNewBook();
    public List<BookDtls>getAllOldBook();
    public List<BookDtls> getBookByold(String email, String cate);
    public boolean oldBookDelete(String email, String cat, int id);
    public List<BookDtls> getBookBySearch(String ch);
    public boolean updateOldBooks(BookDtls c);
    public boolean checkISBN(String isbn);
    public List<BookDtls>getBookAdmin(String ch2);


}
