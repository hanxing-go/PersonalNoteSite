package com.note;

import note.po.User;
import note.service.UserService;
import note.util.DButil;
import note.vo.ResultInfo;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.jupiter.api.Test;

public class TestDB {
    private Logger logger = LogManager.getLogger(TestDB.class);

    /*单元测试方法
    1.方法的返回值，建议使用void，一般没有返回值。
    2.参数列表，建议空参。
    3.方法上需要加入@Test注解
    4.每一个方法都能单独运行
        */
    @Test
    public void testDB(){
        System.out.println(DButil.getConnection());
        //使用日志
        logger.info("获取数据库连接"+DButil.getConnection());
    }

    public static class TestRegister {
        @Test
        public void testregister(){
            //假设接收到参数
            String username = "测试";
            String Nickname = "张三";
            String password = "123456";
            //调用业务逻辑
            UserService userService = new UserService();
            ResultInfo<User> resultInfo = userService.userRegister(username, password);
            //打印结果检验
            System.out.println(resultInfo.getMsg());
            System.out.println(resultInfo.getCode());
            System.out.println(resultInfo.getResult());

        }
    }
}
