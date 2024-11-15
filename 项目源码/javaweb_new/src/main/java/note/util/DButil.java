package note.util;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DButil {
    private static Properties properties = new Properties();

    static {
        try{
            //加载配置文件(输入流)
            InputStream in = DButil.class.getClassLoader().getResourceAsStream("db.properties");
            //通过load()方法properties对象加载输入流
            properties.load(in);
            // 通过配置文件对象的getProperty()方法获取配置文件中的键值对
            Class.forName(properties.getProperty("jdbcName"));
        }catch (Exception e){
            e.printStackTrace();
        }

    }


    /*
    获取数据库连接
     */
    public static Connection getConnection(){
        Connection connection = null;
        try {
            //得到数据库连接的相关信息
            String dbUrl = properties.getProperty("dbUrl");
            String dbName = properties.getProperty("dbName");
            String dbPwd = properties.getProperty("dbPwd");
            //得到数据库连接
            connection = DriverManager.getConnection(dbUrl, dbName, dbPwd);
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }

        return connection;
    }

    public static void close(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) throws SQLException {
        //判断资源对象不为空,则关闭
        if(resultSet != null){
            resultSet.close();
        }
        if(preparedStatement != null){
            preparedStatement.close();
        }
        if(connection != null){
            connection.close();
        }
    }
}
