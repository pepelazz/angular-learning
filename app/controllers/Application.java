package controllers;

import code.MessagesArray;
import com.fasterxml.jackson.databind.ObjectMapper;
import models.Recipe;
import play.mvc.Controller;
import java.io.*;
import java.util.List;

public class Application extends Controller {

    public static void index() {
        render();
    }


    public static  void messages(){

        MessagesArray messages = new MessagesArray();

        renderJSON(messages.messages());
    }


    public static void recipesList(){
        List<Recipe> recipes = Recipe.findAll();
        String s = null;
        final ObjectMapper mapper = new ObjectMapper();
        try {
            s = mapper.writeValueAsString(recipes);
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        renderJSON(s);
    }


    public static void recipe(Long id){
        Recipe recipe = Recipe.findById(id);
        String s = null;
        final ObjectMapper mapper = new ObjectMapper();
        try {
            s = mapper.writeValueAsString(recipe);
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        renderJSON(s);
    }

}