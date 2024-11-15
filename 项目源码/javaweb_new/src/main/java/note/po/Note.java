package note.po;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Note {
    private int noteId;//笔记ID
    private String typeName;//笔记类型名称
    private String title;//笔记标题
    private String content;//笔记内容
    private int typeId;//笔记类型ID
    private Date pubTime;//笔记发布时间
}
