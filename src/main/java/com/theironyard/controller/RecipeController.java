package com.theironyard.controller;

import com.theironyard.repository.RecipeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RecipeController {

    @Autowired
    RecipeRepository repository;

    @GetMapping("/")
    public String listRecipes(ModelMap model, @RequestParam(defaultValue = "") String search){

        model.put("recipes", repository.listRecipes(search));
        model.put("search", search);

        return "index";
    }

    @GetMapping("/recipe")
    public String showRecipe(Integer recipeId){
        return "recipe";
    }
}
