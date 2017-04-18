package com.theironyard.entity;

/**
 * Created by doug on 4/18/17.
 */
public class Ingredient {

    private Integer id;
    private String quantity;
    private String name;

    public Ingredient(int id, String quantity, String name) {
        this.id = id;
        this.quantity = quantity;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Ingredient{" +
                "id=" + id +
                ", quantity='" + quantity + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
