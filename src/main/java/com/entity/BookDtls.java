package com.entity;

public class BookDtls {
    private int bookId;
    private String bookName;
    private String author;
    private String price;
    private String bookCategory;
    private String status;
    private String quantity;
    private String about;
    private  String ISBN;
    private String photoName;
    private String email;


    public BookDtls(){
        super();
    }

    public BookDtls(String bookName, String author, String price, String bookCategory, String status,String quantity,String about, String ISBN, String photoName, String email) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.status = status;
        this.quantity=quantity;
        this.about=about;
        this.ISBN=ISBN;
        this.photoName = photoName;
        this.email = email;


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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "BookDtls{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", price='" + price + '\'' +
                ", bookCategory='" + bookCategory + '\'' +
                ", status='" + status + '\'' +
                ", quantity='" + quantity + '\'' +
                ", about='" + about + '\'' +
                ", ISBN='" + ISBN + '\'' +
                ", photoName='" + photoName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
