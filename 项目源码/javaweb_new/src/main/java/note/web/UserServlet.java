package note.web;

import note.po.User;
import note.service.UserService;
import note.util.JsonUtil;
import note.vo.ResultInfo;
import org.apache.commons.io.FileUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;


@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //统一设置编码格式
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Access-Control-Allow-Origin","*");

        //获取用户行为
        String actionName = request.getParameter("actionName");
        System.out.println(actionName);
        //判断用户行为
        if(actionName.equals("login")){
            //用户登录
            userLogin(request,response);
        }else if (actionName.equals("logout")){
            //用户退出
            userLogout(request,response);
        }else if(actionName.equals("register")){
            //用户注册
            userRegister(request,response);
        }else if(actionName.equals("userCenter")) {
            //用户中心
            userCenter(request,response);
        }else if(actionName.equals("userHead")) {
            //用户头像
            userHead(request, response);
        }else if(actionName.equals("getUserInfo")){
            //获取用户信息
            getUserInfo(request,response);
        }

    }

    private void getUserInfo(HttpServletRequest request, HttpServletResponse response) {
        //1.从session中获取用户对象
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        //2.将用户对象响应给客户端
        JsonUtil.toJSON(response,user);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    private void userHead(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        1.获取图片名称
        String head = request.getParameter("iamgeName");
//        System.out.println(head);
//        2.得到图片的存放路径(request.getServletContext().getRealPath("/upload"))
        String realPath = request.getServletContext().getRealPath("/WEB-INF/upload/");
//        3.通过图片的完整路径，得到file对象
        File file = new File(realPath+"/"+head);
//        4.通过截取，得到图片的后缀名
        String pic = head.substring(head.lastIndexOf(".")+1);//最后一个点，并且不包含这个点
//        5.通过不同的图片后缀，设置不同的响应的类型
        if("jpg".equalsIgnoreCase(pic)||"jpeg".equalsIgnoreCase(pic)){
            response.setContentType("image/jpeg");
        }else if("png".equalsIgnoreCase(pic)){
            response.setContentType("image/png");
        }else if("gif".equalsIgnoreCase(pic)){
            response.setContentType("image/gif");
        }
//        6.利用FileUtil的copyFile()方法，将图片拷贝给浏览器
        FileUtils.copyFile(file,response.getOutputStream());
    }
    private void userCenter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1、接收用户参数
        String username_new = request.getParameter("username");
        String name = request.getParameter("name");
        String moto=request.getParameter("moto");
        //2、调用业务逻辑
        UserService userService = new UserService();
        //从会话中获取用户对象
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        String username_old=user.getUsername();
        ResultInfo<User> resultInfo = userService.userCenter(username_old,username_new,name,moto);
        //将信息存储到request中
        request.setAttribute("resultInfo", resultInfo);
        //跳转到用户中心页面
//        request.getRequestDispatcher("/user.jsp").forward(request, response);
        //写成JSON格式
        JsonUtil.toJSON(response,resultInfo);
        //将更新后的信息存储到session中
        session.setAttribute("user", resultInfo.getResult());
    }

    private void userRegister(HttpServletRequest request, HttpServletResponse response) {
        //1、接收用户参数
        String username = request.getParameter("resgister_username");
        String password = request.getParameter("resgister_password");
//        String nickname = request.getParameter("resgister_nickname");
        //2、调用业务逻辑
        UserService userService = new UserService();
        ResultInfo<User> resultInfo = userService.userRegister(username, password);
        //3、根据处理结果跳转到不同页面
        if (resultInfo.getCode() == 1) {
            //注册成功
            //将用户信息存储到session中
            System.out.println("注册成功");
            System.out.println(resultInfo.getResult().getUsername());
            System.out.println(resultInfo.getResult().getUserID());
            HttpSession session = request.getSession(false);
            session.setAttribute("user", resultInfo.getResult());
            //跳转到主页
            try {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            //注册失败
            //将错误信息存储到request中
            request.setAttribute("resultInfo", resultInfo);
            //跳转到注册页面
            try {
                System.out.println("注册失败");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    }
    private void userLogout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        1.清空session作用域中的用户对象
        request.getSession().invalidate();
//        2.清空cookie对象  没有对应的方法，就把时间设置为0
        Cookie cookie=new Cookie("user","");
        cookie.setMaxAge(0);
//        cookie.setPath(request.getContextPath());
        response.addCookie(cookie);
//        3.重定向跳转到登录页面
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    private void userLogin(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        //1、接收用户参数
        String username = request.getParameter("login_username");
        String password = request.getParameter("login_password");
        //response.getWriter().write("用户名："+username+"密码："+password);
        //2、调用业务逻辑
        UserService userService = new UserService();
        ResultInfo<User> resultInfo = userService.userLogin(username, password);
        //3、根据处理结果跳转到不同页面
        if (resultInfo.getCode() == 1) {
            //登录成功
            //将用户信息存储到session中
            HttpSession session = request.getSession(false);
            session.setAttribute("user", resultInfo.getResult());
            String rem=request.getParameter("rem");
//            System.out.println(rem);
            if("on".equals(rem)){
                //创建cookie对象
                Cookie cookie=new Cookie("user",username+"-"+password);
                System.out.println("成功记住"+cookie.getValue());
                //设置cookie的有效时间
                cookie.setMaxAge(3*24*60*60);
                //设置cookie的有效路径
                cookie.setPath(request.getContextPath());
                //将cookie响应给客户端
                response.addCookie(cookie);
            }
            else{
                //创建cookie对象
                Cookie cookie=new Cookie("user",username+"-"+password);
                System.out.println("没成功记住"+cookie.getValue());
                //设置cookie的有效时间
                cookie.setMaxAge(0);
                //设置cookie的有效路径
                cookie.setPath(request.getContextPath());
                //将cookie响应给客户端
                response.addCookie(cookie);
            }
            //跳转到主页
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            //登录失败
            //将错误信息存储到request中
            request.setAttribute("resultInfo", resultInfo);
            //跳转到登录页面
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            //写成JSON格式
//            JsonUtil.toJSON(response,resultInfo);
        }
    }
}
