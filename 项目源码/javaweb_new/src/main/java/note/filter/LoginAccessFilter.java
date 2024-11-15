package note.filter;

import note.po.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
*  非法访问拦截
*  拦截的资源：
*       所有的资源
*       需要被放行的资源
*               1.指定页面，放行  （用户无需登入的页面即可访问的资源即可放行；例如login.jsp  index.jsp）
*               2.静态资源，放行  （存放在static目录下的资源，例如：js、css、images等）
*               3.指定行为，放行  （用户无需登入即可访问的行为，例如：登录、注册即actionname=login等）
*               4.登录状态，放行  （判断session作用域中是否存在user对象；存在则方行，不存在，则拦截跳转到登录页面）
*   免登录访问：
*      通过Cookie对象实现
*      什么时候使用免登录：
*             当用户处于未登录状态，且去请求需要登录才能访问的资源时，调用自动登录功能
*      目的：
*             当用户处于登录状态（自动调用登录方法
*      实现：
*             从Cookie中获取用户的姓名和密码，自动执行登录操作
*                 1.获取Cookie数组   request.getCookies()
*                 2.判断Cookie数组是否为空
*                 3.遍历Cookie数组，获取指定的Cookie对象 （name为user的cookie对象）
*                 4.得到对应的cookie对象的value （username-password）
*                 5.通过split方法，将value字符串分割成数组
*                 6.得到用户名和密码
*                 7.请求转发到登录操作  user?actionName=login&username=用户名&password=密码
*                 8.return
*
*   如果以上判断都不满足，则拦截请求，重定向到登录界面
 */




@WebFilter(filterName = "LoginAccessFilter",
        urlPatterns = "/*",/*通配符（*）表示对所有的web资源进行拦截*/
        initParams = {
                @WebInitParam(name = "charset", value = "utf-8")/*这里可以放一些初始化的参数*/
        })
public class LoginAccessFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletrequest, ServletResponse servletresponse, FilterChain filterChain) throws ServletException, IOException {


        //基于HTTP
        HttpServletRequest request = (HttpServletRequest) servletrequest;
        HttpServletResponse response = (HttpServletResponse) servletresponse;

        //得到访问的路径
        String path = request.getRequestURI();//格式：/项目名/资源名


        //*       1.指定页面，放行  （用户无需登入的页面即可访问的资源即可放行；例如login.jsp  index.jsp）
        if(path.contains("/login.jsp") || path.contains("/index.jsp")){
            filterChain.doFilter(request,response);
            return;
        }
        // *      2.静态资源，放行  （存放在static目录下的资源，例如：js、css、images等）
        if(path.contains("/static")){
            filterChain.doFilter(request,response);
            return;
        }
        // *      3.指定行为，放行  （用户无需登入即可访问的行为，例如：登录、注册即actionname=login等）
        if(path.contains("/UserServlet")){
            //得到用户行为
            String actionName = request.getParameter("actionName");
            //判断用户行为是否为登录
            if("login".equals(actionName)){
                filterChain.doFilter(request,response);
                return;
            }
            filterChain.doFilter(request,response);
            return;
        }
        // *      4.登录状态，放行  （判断session作用域中是否存在user对象；存在则方行，不存在，则拦截跳转到登录页面）
        User user = (User) request.getSession().getAttribute("user");
        //判断user是否为空
        if (user != null){
            //用户已登录，放行
            filterChain.doFilter(request,response);
            return;
        }


        /*
        *   免登录访问：
         */
        //*                 1.获取Cookie数组   request.getCookies()
        Cookie[] cookies = request.getCookies();
        //*                 2.判断Cookie数组是否为空
        if (cookies != null && cookies.length>0){
            //*                 3.遍历Cookie数组，获取指定的Cookie对象 （name为user的cookie对象）
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())){
                    //*                 4.得到对应的cookie对象的value （username-password）
                    String value = cookie.getValue();//zhangsan-123456
                    //*                 5.通过split方法，将value字符串分割成数组
                    String[] values = value.split("-");
                    //*                 6.得到用户名和密码
                    String username = values[0];
                    String password = values[1];
                    //实现用户免登录：
                    System.out.println("免登录操作");
                    System.out.println("用户名："+username+"密码："+password);
                    //*                 7.请求转发到登录操作  user?actionName=login&username=用户名&password=密码
                    String url = "UserServlet?actionName=login&login_username="+username+"&login_password="+password;
                    request.getRequestDispatcher(url).forward(request,response);
                    //*                 8.return
                    return;
                }
            }
        }


        //拦截请求，重定向到登录界面
        response.sendRedirect("login.jsp");

        filterChain.doFilter(servletrequest, servletresponse);
    }
}
