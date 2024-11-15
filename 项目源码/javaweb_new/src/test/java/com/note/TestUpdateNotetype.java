package com.note;

import note.dao.UserDao;
import note.po.NoteType;
import note.po.User;
import note.service.NoteTypeService;
import note.vo.ResultInfo;
import org.junit.jupiter.api.Test;

public class TestUpdateNotetype {

    private NoteTypeService typeService = new NoteTypeService();//定义一个属性类，方便调用

    @Test
    public void testupdateNotetype(){
        //        1.接收参数
//        String typeID = request.getParameter("typeId");
        String typeName = "test3";
        String typeId = "10";
        UserDao userDao = new UserDao();
        User user = userDao.queryUserByUsername("zhangsan");
//        2.调用Service的更新方法，返回ResultInfo对象
        ResultInfo<NoteType> resultInfo = typeService.updateNoteType(typeId,typeName,user.getUserID());
        System.out.println(resultInfo.getMsg());
        System.out.println(resultInfo.getCode());
    }
}
