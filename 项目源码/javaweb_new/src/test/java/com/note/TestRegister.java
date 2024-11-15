package com.note;

import note.po.User;
import note.service.UserService;
import note.vo.ResultInfo;
import org.junit.jupiter.api.Test;

import java.io.FilterOutputStream;


public class TestRegister {
    @Test
    public void testregister(){
        //定义参数
        String username="测试用户";
        String password="123456";
        //调用方法
        UserService userService=new UserService();
        ResultInfo<User> resultInfo = userService.userRegister(username,password);
        //打印结果
        System.out.println(resultInfo.getCode());
        System.out.println(resultInfo.getMsg_register());
        if (resultInfo.getResult()!=null){
            System.out.println(resultInfo.getResult().getUsername());
            System.out.println(resultInfo.getResult().getUserID());
        }
    }
}
