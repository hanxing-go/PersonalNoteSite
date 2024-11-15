package note.service;

import note.dao.UserDao;
import note.po.User;
import note.vo.ResultInfo;

public class UserService {
    private UserDao userDao = new UserDao();//数据库查询

    public ResultInfo<User> userLogin(String username, String password) {
        ResultInfo<User> resultInfo = new ResultInfo<>();
        //1.判断参数是否为空
        if (username == null || username.equals("")) {
            resultInfo.setCode(0);
            resultInfo.setMsg_login("用户名不能为空");
            return resultInfo;
        }
        if (password == null || password.equals("")) {
            resultInfo.setCode(0);
            resultInfo.setMsg_login("密码不能为空");
            return resultInfo;
        }
        //2.调用dao层查询用户对象
        User user = userDao.queryUserByUsername(username);


        //3.判断用户对象是否为空
        if (user == null) {
            resultInfo.setCode(0);
            resultInfo.setMsg_login("用户名不存在");
            return resultInfo;
        }
        //4.判断密码是否正确
        if (!user.getPassword().equals(password)) {
            resultInfo.setCode(0);
            resultInfo.setMsg_login("密码错误");
            return resultInfo;
        }

        resultInfo.setCode(1);
        resultInfo.setResult(user);
        return resultInfo;
    }


    public ResultInfo<User> userRegister(String username, String password) {
        //1.判断参数是否为空
        ResultInfo<User> resultInfo = new ResultInfo<>();
        if (username == null || username.equals("")) {
            resultInfo.setCode(0);
            resultInfo.setMsg_register("用户名不能为空");
            return resultInfo;
        }
        if (password == null || password.equals("")) {
            resultInfo.setCode(0);
            resultInfo.setMsg_register("密码不能为空");
            return resultInfo;
        }

        //2.调用dao层查询用户对象
        User user = userDao.queryUserByUsername(username);
        //3.判断用户对象是否为空
        if (user != null) {
            resultInfo.setCode(0);
            resultInfo.setMsg_register("用户名已存在");
            return resultInfo;
        }
        //4.调用dao层插入用户对象
        user = new User();
        user.setUsername(username);
        user.setPassword(password);
//        user.setName(nickname);
        int row = userDao.insertUser(user);
        //5.判断是否插入成功
        if (row == 0) {
            resultInfo.setCode(0);
            resultInfo.setMsg_register("注册失败");
            return resultInfo;
        }
        resultInfo.setCode(1);
        //查询user的完整信息
        user = userDao.queryUserByUsername(username);
        resultInfo.setResult(user);
        return resultInfo;

    }

    public ResultInfo<User> userCenter(String username_old, String username_new, String name, String moto) {
        //1.判断参数是否为空
        ResultInfo<User> resultInfo = new ResultInfo<>();
        if (username_new == null || username_new.equals("")) {
            resultInfo.setCode(0);
            resultInfo.setMsg("用户名不能为空");
            return resultInfo;
        }
        if (name == null || name.equals("")) {
            resultInfo.setCode(0);
            resultInfo.setMsg("昵称不能为空");
            return resultInfo;
        }
//        if (moto == null || moto.equals("")) {
//            resultInfo.setCode(0);
//            resultInfo.setMsg("个性签名不能为空");
//            return resultInfo;
//        }
        //2.调用dao层查询用户对象
        User user = userDao.queryUserByUsername(username_old);
        //3.判断用户对象是否为空
        if (user == null) {
            resultInfo.setCode(0);
            resultInfo.setMsg("系统出错");
            return resultInfo;
        }
        //如果用户名已存在，且不是当前用户的用户名，返回错误信息
        if (!username_old.equals(username_new)) {
            User user1 = userDao.queryUserByUsername(username_new);
            if (user1 != null) {
                resultInfo.setCode(0);
                resultInfo.setMsg("用户名已存在");
                return resultInfo;
            }
        }
        //4.调用dao层更新用户对象，未修改的信息要保存
        user.setUsername(username_new);
        user.setName(name);
        user.setMoto(moto);

        int row = userDao.updateUser(user, username_old);
        //5.判断是否插入成功
        if (row == 0) {
            resultInfo.setCode(0);
            resultInfo.setMsg("修改失败");
            return resultInfo;
        }
        resultInfo.setCode(1);
        //查询user的完整信息
        user = userDao.queryUserByUsername(username_new);
        resultInfo.setResult(user);
        return resultInfo;

    }
}
