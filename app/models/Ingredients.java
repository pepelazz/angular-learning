package models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import play.db.jpa.GenericModel;

import javax.persistence.*;

@Entity
public class Ingredients extends GenericModel {

    @Id
    @SequenceGenerator(name = "ingridients_seq", sequenceName = "ingridients_seq", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ingridients_seq")
    public long id;

    public String amount;
    public String amountUnit;
    public String ingredientName;
    @ManyToOne (fetch = FetchType.EAGER)
    @JsonIgnore
    public Recipe recipe;
}
