package com.note;

import note.po.User;
import note.service.UserService;
import note.vo.ResultInfo;
import org.junit.jupiter.api.Test;

public class TestUsercenter {
    @Test
    public void testUsercenter(){
        System.out.println("testUsercenter");
        //模拟用户信息修改
        //1.获取用户信息
        String username_new = "田所浩二";
        String name = "admin1";
        String moto= "test";
        //2.调用业务逻辑
        UserService userService = new UserService();
        //模拟当前用户信息
        String username_old="admin";
        ResultInfo<User> resultInfo = userService.userCenter(username_old,username_new,name,moto);
        //3.打印结果
        System.out.println(resultInfo.getCode());
        System.out.println(resultInfo.getResult());
        System.out.println(resultInfo.getMsg());
    }
}
