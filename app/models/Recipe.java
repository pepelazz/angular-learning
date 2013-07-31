package models;

import play.db.jpa.GenericModel;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;
import javax.persistence.SequenceGenerator;
import java.util.*;

@Entity
public class Recipe extends GenericModel {

    @Id
    @SequenceGenerator(name = "recipe_seq", sequenceName = "recipe_seq", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "recipe_seq")
    public long id;

    public String title;
    public String description;
    @OneToMany (mappedBy = "recipe", fetch = FetchType.EAGER)
    public List<Ingredients> ingredients;
    public String instructions;

}
