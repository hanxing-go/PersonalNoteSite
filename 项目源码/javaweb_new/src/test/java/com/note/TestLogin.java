package com.note;

import note.po.User;
import note.service.UserService;
import note.vo.ResultInfo;
import org.junit.jupiter.api.Test;

public class TestLogin {
    @Test
    public void testlogin(){

        String username = "zhangsan";
        String password = "123456";
        // 2.调用service层处理业务逻辑
        UserService userService = new UserService();
        ResultInfo<User> resultInfo = userService.userLogin(username, password);
        System.out.println("成功了"+resultInfo.getCode());
        System.out.println(resultInfo.getMsg());
    }
}
