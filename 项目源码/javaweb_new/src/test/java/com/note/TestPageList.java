package com.note;

import note.dao.UserDao;
import note.po.Note;
import note.util.Page;
import note.po.User;
import note.service.NoteService;
import org.junit.jupiter.api.Test;

public class TestPageList {
    @Test
    public void testPageList(){
//        1.接收参数（当前页码，每页显示的条数）
        String pageNum = "1";
        String pageSize = "12";

//        2.获取Session中的用户信息
        UserDao userDao = new UserDao();
        User user = userDao.queryUserByUsername("admin");
//        3.调用业务层的方法，返回Page对象
        Page<Note> page = new NoteService().findNoteListByPage(pageNum,pageSize,user.getUserID(),null,null,null);
//        System.out.println(page);
        System.out.println(page.getNextPage()+" "+page.getPrePage()+" "+page.getTotalPages()+" "+page.getTotalCount()+" "+page.getPageSize()+" "+page.getPageNum());
        //输出当前页的笔记
        for (Note note : page.getDataList()) {
            System.out.println(note.getTitle()+"  "+note.getContent());
        }
    }
}
