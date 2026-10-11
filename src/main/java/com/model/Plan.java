package com.model;

public class Plan {

    private int id;
    private String name;
    private String duration;
    private double price;
    private String description;

    public Plan() {
    }

    public Plan(int id, String name, String duration, double price, String description) {
        this.id = id;
        this.name = name;
        this.duration = duration;
        this.price = price;
        this.description = description;
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

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}