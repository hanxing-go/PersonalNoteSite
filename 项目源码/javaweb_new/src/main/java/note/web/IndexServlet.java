package note.web;

import note.po.Note;
import note.util.JsonUtil;
import note.util.Page;
import note.po.User;
import note.service.NoteService;
import note.vo.NoteVo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexServlet", value = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //统一设置编码格式
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Access-Control-Allow-Origin","*");

        // 得到用户行为 （判断是什么条件查询：标题查询、日期查询、类型查询）
        String actionName = request.getParameter("actionName");
        // 将用户行为设置到request作用域中 （分页导航中需要获取）
        request.setAttribute("action", actionName);

        // 判断用户行为
        if ("findaNoteListByTitle".equals(actionName)) { // 标题查询

            // 得到查询条件：标题
            String title = request.getParameter("title");
            // 将查询条件设置到request请求域中（查询条件的回显）
            request.setAttribute("title", title);

            // 标题搜索
            noteList(request, response, title, null, null);

        }  else if ("findaNoteListByTypeId".equals(actionName)) { // 类型查询

            // 得到查询条件：类型ID
            String typeId = request.getParameter("typeId");

            // 将查询条件设置到request请求域中（查询条件的回显）
            request.setAttribute("typeId", typeId);
            System.out.println("查询的标题为: "+typeId);
            // 类型搜索
            noteList(request, response, null, null, typeId);

        } else {
            // 分页查询云记列表
            noteList(request, response, null, null, null);
        }


        // 设置首页动态包含的页面
        request.setAttribute("changePage","note/list.jsp");
        // 请求转发到index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);



    }

    private void noteList(HttpServletRequest request, HttpServletResponse response,
                          String title, String date, String typeId) throws ServletException, IOException {
        // 1. 接收参数 （当前页、每页显示的数量）
        String pageNum = request.getParameter("pageNum");
        String pageSize = request.getParameter("pageSize");

        // 2. 获取Session作用域中的user对象
        User user = (User) request.getSession().getAttribute("user");

        // 3. 调用Service层查询方法，返回Page对象
        Page<Note> page = new NoteService().findNoteListByPage(pageNum, pageSize, user.getUserID(), title, date, typeId);

        // 4. 将page对象设置到request作用域中
        request.setAttribute("page", page);
                //将总页数和当前页码设置到request域中
        request.setAttribute("totalPages", page.getTotalPages());
        request.setAttribute("currentPage", page.getPageNum());
        //写成JSON格式，回调
        JsonUtil.toJSON(response,page);
//        5.设置首页动态包含的页面值
//        6.请求转发到docs.jsp页面
        request.getRequestDispatcher("docs.jsp").forward(request, response);

    }

//    private void findaNoteListByTypeId(HttpServletRequest request, HttpServletResponse response) {
//        //        1.接收参数（获取类型ID）
//        String typeId = request.getParameter("typeId");
////        2.获取Session中的用户信息
//        User user = (User) request.getSession().getAttribute("user");
////        3.调用业务层的方法，返回noteList对象(笔记列表)
//        NoteService noteService = new NoteService();
//        List<Note> noteList = noteService.findNoteListByTypeId(typeId,user.getUserID());
////        4.将noteList对象设置到request域中
//        request.setAttribute("noteList",noteList);
//        //将结果集写成JSON格式，回调
//        JsonUtil.toJSON(response,noteList);
//
//    }

//    private void findNoteListByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //        1.接收参数（当前页码，每页显示的条数）
//        String pageNum = request.getParameter("pageNum");
//        String pageSize = request.getParameter("pageSize");
////        System.out.println("调用了");
//
////        2.获取Session中的用户信息
//        User user = (User) request.getSession().getAttribute("user");
////        3.调用业务层的方法，返回Page对象
//        Page<Note> page = new NoteService().findNoteListByPage(pageNum,pageSize,user.getUserID());
//
////        4.将Page对象设置到request域中
//        request.setAttribute("page",page);
//        //将总页数和当前页码设置到request域中
//        request.setAttribute("totalPages", page.getTotalPages());
//        request.setAttribute("currentPage", page.getPageNum());
//        //写成JSON格式，回调
//        JsonUtil.toJSON(response,page);
////        5.设置首页动态包含的页面值
////        6.请求转发到docs.jsp页面
//        request.getRequestDispatcher("docs.jsp").forward(request, response);
//
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
