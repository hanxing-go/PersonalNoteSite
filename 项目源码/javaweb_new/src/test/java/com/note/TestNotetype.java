package com.note;

import note.dao.NotetypeDao;
import note.dao.UserDao;
import note.po.NoteType;
import note.po.User;
import org.junit.jupiter.api.Test;

import java.util.List;

public class TestNotetype {
    @Test
    public void testQueryNotetypeByUserID(){
        NotetypeDao NotetypeDao = new NotetypeDao();
        UserDao userDao = new UserDao();
        User user = userDao.queryUserByUsername("admin");
        System.out.println(user.getUserID());
        List<NoteType> noteType = NotetypeDao.findNoteTypeByUserId(user.getUserID());
//        System.out.println(noteType);
        NoteType noteType1 = noteType.get(0);
        if (noteType1 != null) {
            System.out.println(noteType1.getTypeName());
        } else {
            System.out.println("NoteType not found");
        }
//        System.out.println(user);
//        if (user != null) {
//            System.out.println(user.getPassword());
//        } else {
//            System.out.println("User not found");
//        }
    }
}
