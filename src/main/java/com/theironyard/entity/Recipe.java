package com.theironyard.entity;

import java.util.List;

public class Recipe {

    private Integer id;
    private String title;
    private String description;
    private Integer servings;
    private List<Ingredient> ingredients;
    private List<Instruction> instruction;

    public Recipe(int id, String title, String description, int servings) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.servings = servings;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getServings() {
        return servings;
    }

    public void setServings(Integer servings) {
        this.servings = servings;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public List<Instruction> getInstruction() {
        return instruction;
    }

    public void setInstruction(List<Instruction> instruction) {
        this.instruction = instruction;
    }

    @Override
    public String toString() {
        return "Recipe{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", servings=" + servings +
                ", ingredients=" + ingredients +
                ", instruction=" + instruction +
                '}';
    }
}
