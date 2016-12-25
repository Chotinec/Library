package com.library.beans;

public class Author {
    
    private long id;
    private String name;
    
    public Author() {
        
    }
    
    public Author(long id, String name) {
        this.id = id;
        this.name = name;
    }
     
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
