package com.note;

import note.dao.UserDao;
import note.po.User;
import org.junit.jupiter.api.Test;

public class TestUser {
    @Test
    public void testQueryUserByUsername(){
        UserDao userDao = new UserDao();
        User user = userDao.queryUserByUsername("zhangsan");
        System.out.println(user);
        if (user != null) {
            System.out.println(user.getPassword());
        } else {
            System.out.println("User not found");
        }
    }
}
