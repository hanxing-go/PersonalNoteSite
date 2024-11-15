package com.note;

import note.dao.UserDao;
import note.po.NoteType;
import note.po.User;
import note.service.NoteTypeService;
import note.util.JsonUtil;
import note.vo.ResultInfo;
import org.junit.jupiter.api.Test;

public class TestDeleteNotetype {
    private NoteTypeService typeService = new NoteTypeService();//定义一个属性类，方便调用

    @Test
    public void testDeleteNoteType(){
        //        1.接收参数（类型ID)
        String typeName = "私人";
        UserDao userDao = new UserDao();
        User user = userDao.queryUserByUsername("zhangsan");
        //        2.调用Service的更新操作，返回ResultInfo对象
        ResultInfo<NoteType> resultInfo = typeService.deleteType(typeName,user.getUserID());
        System.out.println(resultInfo.getMsg());
        System.out.println(resultInfo.getCode());
    }

}
