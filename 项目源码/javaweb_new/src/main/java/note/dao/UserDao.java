package note.dao;

import note.po.User;
import note.util.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    public User queryUserByUsername(String username){
//        1.定义SQL语句
        String sql = "select * from user where username=?";
//        2.设置参数集合
        List<Object> params = new ArrayList<>();
        params.add(username);

//        3.调用BaseDao的查询方法
        User user = (User) BaseDao.queryRow(sql, params, User.class);
//        4.返回查询结果
        return user;
    }
    //        通过用户名查询用户对象，返回用户对象
    //        1.获取数据库连接
    //        2.定义sql语句
    //        3.获取预编译对象
    //        4.设置参数
    //        5.执行sql语句
    //        6.处理结果集
    //        7.释放资源
//    public ResultSet resultSet = null;
    public User queryUserByUsername02(String username) {

        User user=null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        System.out.println(resultSet);
        boolean flag = false;
        try {
            //        1.获取数据库连接
            connection = DButil.getConnection();
            //        2.定义sql语句
            String sql = "select * from user where username=?";
            //        3.获取预编译对象
            preparedStatement = connection.prepareStatement(sql);
            //        4.设置参数
            preparedStatement.setString(1,username);
            //        5.执行sql语句
            resultSet = preparedStatement.executeQuery();
            //        6.处理结果集
            if(resultSet.next()){
                flag=true;
//                System.out.println(resultSet.getString(1));
//                System.out.println(flag);
                user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setHead(resultSet.getString("head"));
                user.setMoto(resultSet.getString("moto"));
//                System.out.println("#########################################");
//                System.out.println(user.getUsername());
//                System.out.println(user.getPassword());
//                System.out.println(user.getName());
//                System.out.println(user.getHead());
            }
        }catch (Exception e){

        }
        finally {
            //        7.释放资源
            try {
                DButil.close(resultSet,preparedStatement,connection);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return user;
    }


    public int insertUser(User user) {
        //        1.定义SQL语句
        String sql = "insert into user(username,password) values(?,?)";
        //        2.设置参数集合
        List<Object> params = new ArrayList<>();
        params.add(user.getUsername());
        params.add(user.getPassword());
//        params.add(user.getName());
        //        3.调用BaseDao的增删改方法
        int row = BaseDao.executeUpdate(sql, params);
        //        4.返回结果
        return row;
    }

    public int updateUser(User user, String username_old) {
        //        1.定义SQL语句
        String sql = "update user set username=?,name=?,moto=? where username=?";
        //        2.设置参数集合
        List<Object> params = new ArrayList<>();
        params.add(user.getUsername());
        params.add(user.getName());
        params.add(user.getMoto());
        params.add(username_old);
        //        3.调用BaseDao的增删改方法
        int row = BaseDao.executeUpdate(sql, params);
        //        4.返回结果
        return row;
    }
}
