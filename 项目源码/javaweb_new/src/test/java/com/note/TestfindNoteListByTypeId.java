package com.note;

import note.dao.UserDao;
import note.po.Note;
import note.po.NoteType;
import note.po.User;
import note.service.NoteService;
import note.vo.ResultInfo;
import org.junit.jupiter.api.Test;

import java.util.List;

public class TestfindNoteListByTypeId {

    @Test
    public void testfindnoteListByTypeId(){
        //        1.接收参数（获取类型ID）
        String typeId = "1";
        //        2.获取Session中的用户信息
        UserDao userDao = new UserDao();
        User user = userDao.queryUserByUsername("admin");
        //        3.调用业务层的方法，返回noteList对象(笔记列表)
        NoteService noteService = new NoteService();
        List<Note> noteList = noteService.findNoteListByTypeId(typeId,user.getUserID());
//        4.将noteList对象设置到request域中
        System.out.println(noteList);
        //逐个打印noteList中的note对象
        for (Note note : noteList) {
            System.out.println(note.getTitle());
        }
    }
}
