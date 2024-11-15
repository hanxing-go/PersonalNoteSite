package note.po;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private int userID;//用户ID
    private String username;//用户名
    private String password;//密码
    private String name;//姓名
    private String head;//头像的地址
    private String moto;//座右铭
}
