package note.web;

import com.alibaba.fastjson.JSONObject;
import note.po.NoteType;
import note.po.User;
import note.service.NoteTypeService;
import note.util.JsonUtil;
import note.vo.ResultInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "NoteTypeServlet", value = "/NoteTypeServlet")
public class NoteTypeServlet extends HttpServlet {

    private NoteTypeService typeService = new NoteTypeService();//定义一个属性类，方便调用
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //统一设置编码格式
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Access-Control-Allow-Origin","*");

        //获取用户行为
        String actionName = request.getParameter("actionName");
        //判断用户行为
        if(actionName.equals("addNoteType")){
            //添加笔记类型
            addNoteType(request,response);
        }else if(actionName.equals("deleteNoteType")){
            //删除笔记类型
            deleteNoteType(request,response);
        }else if(actionName.equals("updateNoteType")){
            //修改笔记类型
            updateNoteType(request,response);
        }else if(actionName.equals("findNoteType")){
            //查询笔记类型
            findNoteType(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    private void findNoteType(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        1. 获取Session作用域中国设置的user对象
        User user = (User) request.getSession().getAttribute("user");
//        2. 调用Service层的查询方法，查询当前登录用户的类型集合，返回集合
        List<NoteType> typeList = typeService.findNoteTypeByUserId(user.getUserID());

        // 3. 返回JSON字符串
        JsonUtil.toJSON(response,typeList);
    }

    private void updateNoteType(HttpServletRequest request, HttpServletResponse response) {
//        1.接收参数
//        String typeID = request.getParameter("typeId");
        String typeName = request.getParameter("typeName");
        String typeId = request.getParameter("typeId");
        System.out.println("typeId"+typeId);
        System.out.println("typeName"+typeName);
        User user = (User) request.getSession().getAttribute("user");
//        2.调用Service的更新方法，返回ResultInfo对象
        ResultInfo<NoteType> resultInfo = typeService.updateNoteType(typeId,typeName,user.getUserID());
//        3.将ResultInfo对象转换为JSON格式的字符串，相应给ajax的回调函数
        JsonUtil.toJSON(response,resultInfo);
    }

    private void deleteNoteType(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        1.接收参数（类型ID)
        String typeName = request.getParameter("typeName");
        System.out.println("addNoteType:typeName"+typeName);
        User user = (User) request.getSession().getAttribute("user");

//        2.调用Service的更新操作，返回ResultInfo对象
        ResultInfo<NoteType> resultInfo = typeService.deleteType(typeName,user.getUserID());
//        3.将ResultInfo对象转换为JSON格式的字符串，相应给ajax的回调函数
        JsonUtil.toJSON(response,resultInfo);
    }

    private void addNoteType(HttpServletRequest request, HttpServletResponse response) {
//        1.接收参数（类型名称，用户ID）
        String typeName = request.getParameter("typeName");
//        System.out.println("addNoteType:typeName"+typeName);
        User user = (User) request.getSession().getAttribute("user");
//        2.调用Service的添加方法，返回ResultInfo对象
        ResultInfo<NoteType> resultInfo = typeService.addNoteType(typeName,user.getUserID());
//        3.将ResultInfo对象转换为JSON格式的字符串，相应给ajax的回调函数
        JsonUtil.toJSON(response,resultInfo);
    }


}
