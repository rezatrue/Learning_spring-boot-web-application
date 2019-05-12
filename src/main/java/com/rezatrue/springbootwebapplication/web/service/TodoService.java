package com.rezatrue.springbootwebapplication.web.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;

import com.rezatrue.springbootwebapplication.web.model.Todo;

@Service
public class TodoService {
    private static List<Todo> todos = new ArrayList<Todo>();
    private static int todoCount = 4;

    static {
        todos.add(new Todo(1, "ali", "Learn Spring MVC", new Date(),
                false));
        todos.add(new Todo(2, "ali", "Learn Hibernate", new Date(), false));
        todos.add(new Todo(3, "ali", "Learn Security", new Date(),
                false));
        todos.add(new Todo(4, "ali", "Learn Cloud", new Date(),
                false));
    }

    public List<Todo> retrieveTodos(String user) {
        List<Todo> filteredTodos = new ArrayList<Todo>();
        for (Todo todo : todos) {
            if (todo.getUser().equalsIgnoreCase(user)) {
                filteredTodos.add(todo);
            }
        }
        return filteredTodos;
    }
    
    public Todo retrieveTodo(int id) {
        for (Todo todo : todos) {
            if (todo.getId()== id) {
                return todo;
            }
        }
        return null;
    }
    
    
    public void updateTodo(Todo todo) {
    	todos.remove(todo);
    	todos.add(todo);
    }
 
 
    public void addTodo(String name, String desc, Date targetDate,
            boolean isDone) {
        todos.add(new Todo(++todoCount, name, desc, targetDate, isDone));
    }

    public void deleteTodo(int id) {
        Iterator<Todo> iterator = todos.iterator();
        while (iterator.hasNext()) {
            Todo todo = iterator.next();
            if (todo.getId() == id) {
                iterator.remove();
            }
        }
    }
}
