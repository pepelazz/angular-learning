package models;

import play.db.jpa.*;

public class Message extends Model {

    public String subject;
    public String sender;
    public String message;

}
