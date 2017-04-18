package com.theironyard.repository;

import com.theironyard.entity.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RecipeRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    /**
     * List recipes.
     */
    public List<Recipe> listRecipes(String search) {
        System.out.println(jdbcTemplate.getDataSource());
        return jdbcTemplate.query(
                "SELECT * " +
                        "FROM recipe " +
                        "WHERE lower(title) like lower(?) " +
                        "OR lower(description) like lower(?)",

                (rs, rowNum) -> new Recipe(
                        rs.getInt("id" ),
                        rs.getString("title" ),
                        rs.getString("description" ),
                        rs.getInt("servings" )
                ),

                "%" + search.trim() + "%",
                "%" + search.trim() + "%"
        );
    }

}
