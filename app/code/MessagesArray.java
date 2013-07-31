package code;

import models.Message;

import java.util.*;

public class MessagesArray {

    ArrayList<Message> Messages = new ArrayList<Message>();

    public ArrayList<Message> messages(){

        Message message1 = new Message();
        message1.sender = "Bob";
        message1.subject = "Come here!";
        message1.message = "Wating for plane to lone island...";

        Message message2 = new Message();
        message2.sender = "John";
        message2.subject = "May be or may be not";
        message2.message = "Bottle is empty, but glass is full...";

        Messages.add(message1);
        Messages.add(message2);

        return Messages;

    }





}
