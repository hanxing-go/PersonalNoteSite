package com.note;

import note.dao.UserDao;
import note.po.NoteType;
import note.po.User;
import note.service.NoteTypeService;
import note.vo.ResultInfo;
import org.junit.jupiter.api.Test;

public class TestAddNotetype {
    private NoteTypeService typeService = new NoteTypeService();//定义一个属性类，方便调用
    @Test
    public void testAddNotetype(){
//        1.接收参数（类型名称，用户ID）
        String typeName = "test1";
        UserDao userDao = new UserDao();
        User user = userDao.queryUserByUsername("zhangsan");
//        2.调用Service的添加方法，返回ResultInfo对象
        ResultInfo<NoteType> resultInfo = typeService.addNoteType(typeName,user.getUserID());
        System.out.println(resultInfo.getMsg());
        System.out.println(resultInfo.getCode());
    }
}
