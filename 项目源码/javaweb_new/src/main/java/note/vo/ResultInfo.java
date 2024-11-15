package note.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResultInfo<T> {
    private int code;//状态码 1成功，0失败
    private String msg;//提示信息
    private String msg_login;//提示信息
    private String msg_register;//提示信息
    private T result;//返回的对象 可以使任意类型

}
