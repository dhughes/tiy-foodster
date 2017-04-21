package com.theironyard.repository;

import com.theironyard.entity.Ingredient;
import com.theironyard.entity.Instruction;
import com.theironyard.entity.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RecipeRepository {

    final
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public RecipeRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    /**
     * List all recipes, optionally filtered by a search string
     */
    public List<Recipe> listRecipes(String search) {
        System.out.println(jdbcTemplate.getDataSource());
        return jdbcTemplate.query(
                "SELECT * " +
                        "FROM recipe " +
                        "WHERE lower(title) LIKE lower(?) " +
                        "OR lower(description) LIKE lower(?)" +
                        "ORDER BY created DESC",

                (rs, rowNum) -> new Recipe(
                        rs.getInt("id" ),
                        rs.getString("title" ),
                        rs.getString("imageUrl" ),
                        rs.getString("description" ),
                        rs.getInt("servings" )
                ),

                "%" + search.trim() + "%",
                "%" + search.trim() + "%"
        );
    }

    public Recipe getRecipe(Integer recipeId) {
        return jdbcTemplate.queryForObject("SELECT * FROM recipe WHERE id = ?",
                (rs, rowNum) -> new Recipe(
                        rs.getInt("id" ),
                        rs.getString("title" ),
                        rs.getString("imageUrl" ),
                        rs.getString("description" ),
                        rs.getInt("servings" ),
                        listIngredients(recipeId),
                        listInstructions(recipeId)
                ),
                recipeId);
    }

    private List<Ingredient> listIngredients(Integer recipeId) {
        return jdbcTemplate.query("SELECT * FROM ingredient WHERE recipeId = ? ORDER BY id ASC",

                (rs, rowNum) -> new Ingredient(
                        rs.getInt("id" ),
                        rs.getString("name" )
                ),

                recipeId);

    }

    private List<Instruction> listInstructions(Integer recipeId) {
        return jdbcTemplate.query("SELECT * FROM instruction WHERE recipeId = ? ORDER BY id ASC",

                (rs, rowNum) -> new Instruction(
                        rs.getInt("id" ),
                        rs.getString("instruction" )
                ),

                recipeId);
    }

    public void saveRecipe(Recipe recipe) {
        Integer recipieId = jdbcTemplate.queryForObject(
                "INSERT INTO recipe (title, description, servings, imageurl)" +
                        "VALUES (?, ?, ?, ?) RETURNING id",
                int.class,
                recipe.getTitle(),
                recipe.getDescription(),
                recipe.getServings(),
                recipe.getImageUrl()
        );

        // insert ingredients
        for (Ingredient ingredient : recipe.getIngredients()) {
            jdbcTemplate.update(
                    "INSERT INTO ingredient (name, recipeid) VALUES (?, ?)",
                    ingredient.getName(),
                    recipieId
            );
        }

        // insert instructions
        for (Instruction instruction : recipe.getInstructions()) {
            jdbcTemplate.update(
                    "INSERT INTO instruction (instruction, recipeid) VALUES (?, ?)",
                    instruction.getInstruction(),
                    recipieId
            );
        }

    }
}
