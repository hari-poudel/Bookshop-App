package com.entity;

public class review_user {
    private int id;
    String name;
    String email;
    String rating;
    String comment;
    public review_user(){
        super();
}
public review_user(String name, String email,String rating, String comment){
    super();
    this.name=name;
    this.email=email;
    this.rating=rating;
    this.comment=comment;
}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "review_user{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", rating='" + rating + '\'' +
                ", comment='" + comment + '\'' +
                '}';
    }
}
