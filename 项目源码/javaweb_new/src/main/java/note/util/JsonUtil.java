package note.util;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


//将对象转换为JSON格式，主要是为了ajax使用
public class JsonUtil {
    public static void toJSON(HttpServletResponse response,Object result){
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String json = JSONObject.toJSONString(result);
        out.write(json);
        out.close();
    }
}
