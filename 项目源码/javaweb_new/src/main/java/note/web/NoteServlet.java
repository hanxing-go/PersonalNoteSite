package note.web;

import com.sun.xml.internal.ws.api.ha.StickyFeature;
import note.po.Note;
import note.service.NoteService;
import note.util.JsonUtil;
import note.vo.ResultInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NoteServlet", value = "/NoteServlet")
public class NoteServlet extends HttpServlet {
    public NoteService noteService=new NoteService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //统一设置编码格式
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Access-Control-Allow-Origin","*");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String actionName=request.getParameter("actionName");


        //判断用户行为
        if("view".equals(actionName)) {
            //查看笔记
            noteview(request, response);
        }else if("addOrUpdate".equals(actionName)){
            //添加
            addOrUpdate(request,response);
        }else if("Deletenote".equals(actionName)){
            //删除笔记
            Deletenote(request,response);
        }else if("getNote".equals(actionName)) {
            //获取笔记
            getNote(request, response);
        }else if ("editorNote".equals(actionName)){
            //修改笔记
            updateNote(request,response);
        }
        
    }



    private void noteview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收参数noteId
        String noteId=request.getParameter("noteId");
//        System.out.println("121212noteId"+noteId);
        //调用业务层的方法，返回resultInfo对象
        Note note= noteService.findNoteById(noteId);
        //将resultInfo对象设置到request域中
        request.setAttribute("note",note);
        //请求转发到view.jsp页面
        request.getRequestDispatcher("view.jsp").forward(request,response);
        //建立会话
        HttpSession session=request.getSession();
        session.setAttribute("note",note);

    }

    private void getNote(HttpServletRequest request, HttpServletResponse response) {
        //从会话中获取note对象
        HttpSession session=request.getSession();
        Note note=(Note)session.getAttribute("note");
        //将note对象转换为JSON格式的字符串，响应给ajax的回调函数
        JsonUtil.toJSON(response,note);

    }


    private void Deletenote(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        1.接收参数（noteId）
        String noteId=request.getParameter("noteId");
//        System.out.println("123213213212312312321noteId"+noteId);
//        2.调用业务层Service的方法，返回resultInfo对象
        ResultInfo<Note> resultInfo=noteService.deletenote(noteId);
//        3.判断resultInfo对象中的code值
//        如果code值为1，说明删除成功，重定向到笔记列表页面
//        如果code值不为1，说明删除失败
//        将resultInfo对象设置到request域中，
        request.setAttribute("resultInfo",resultInfo);
//        将ResultInfo对象转换为JSON格式的字符串，相应给ajax的回调函数
        JsonUtil.toJSON(response,resultInfo);
        response.sendRedirect("docs.jsp");
    }


    private void updateNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //接收参数(noteId)
//        String noteId=request.getParameter("noteId");
//        //调用业务层的方法，返回resultInfo对象
//        ResultInfo<Note> resultInfo=noteService.getNoteBynoteId(noteId);
//        //判断resultInfo对象中的code值
//        if(resultInfo.getCode()==1){
//            //如果code值为1，说明查询成功，跳转到修改笔记页面
//            request.setAttribute("note",resultInfo.getResult());
//            request.getRequestDispatcher("write.jsp").forward(request,response);
//
//        }else{
//            //如果code值不为1，说明查询失败，重定向到笔记列表页面
//            response.sendRedirect("docs.jsp");
//        }
    }
    private void addOrUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//    1.接收参数（类型ID，标题，内容）
        String typeId=request.getParameter("typeId");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
//    2.调用业务层的方法，返回resultInfo对象
        ResultInfo<Note> resultInfo = noteService.addOrUpdate(typeId,title,content);


//    3.判断resultInfo对象中的code值
        if(resultInfo.getCode()==1){
//    如果code值为1，说明发布成功，重定向到笔记列表页面
            response.sendRedirect("docs.jsp");
        }else{
//    如果code值不为1，说明发布失败
//    将resultInfo对象设置到request域中，
            request.setAttribute("resultInfo",resultInfo);
            request.getRequestDispatcher("write.jsp").forward(request,response);

        }


//    请求转发到write.jsp页面


    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
