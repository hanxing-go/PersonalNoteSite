package note.service;

import note.dao.NoteDao;
import note.po.Note;
import note.util.Page;
import note.vo.ResultInfo;

import java.util.List;

public class NoteService {
    private NoteDao noteDao=new NoteDao();

    public ResultInfo<Note> addOrUpdate(String typeId, String title, String content) {

        ResultInfo<Note> resultInfo=new ResultInfo<>();
//        1.接收参数（类型ID，标题，内容）
        Note note=new Note();
        note.setTypeId(Integer.parseInt(typeId));
        note.setTitle(title);
        note.setContent(content);

//        2.参数的非空判断 如果为空，设置resultInfo对象的code值为0，msg值为“参数不能为空”
        if(typeId==null||"".equals(typeId)){
            resultInfo.setCode(0);
            resultInfo.setMsg("笔记类型不能为空");
            return resultInfo;
        }
        if(title==null||"".equals(title)){
            resultInfo.setCode(0);
            resultInfo.setMsg("笔记标题不能为空");
            return resultInfo;
        }
        if(content==null||"".equals(content)){
            resultInfo.setCode(0);
            resultInfo.setMsg("笔记内容不能为空");
            return resultInfo;
        }
        resultInfo.setResult(note);
//        3.调用Dao层的方法，返回受影响的行数
        int row=noteDao.addOrUpdate(note);
//        4.判断受影响的行数是否大于0
        if(row>0){
            resultInfo.setCode(1);
        }else{
            resultInfo.setCode(0);
            resultInfo.setMsg("发布失败");
        }
//        如果大于0，说明发布成功，设置resultInfo对象的code值为1
//        如果不大于0，说明发布失败，设置resultInfo对象的code值为0，msg值为“发布失败”

        return resultInfo;
    }

    public Page<Note> findNoteListByPage(String pageNumstr, String pageSizeStr, int userID, String title,String date, String typeId) {
//
//        1.参数的非空判断
//        如果分页参数为空，则设置默认值
        int PageNum=1;//默认当前页是第一页
        int PageSize=12;//默认每页显示12条记录
        if(pageNumstr!=null&&!"".equals(pageNumstr)){//参数的非空校验，如果参数不为空，则将参数转换为整型
            PageNum=Integer.parseInt(pageNumstr);
        }
        if(pageSizeStr!=null&&!"".equals(pageSizeStr)){//参数的非空校验，如果参数不为空，则将参数转换为整型
            PageSize=Integer.parseInt(pageSizeStr);
        }
        System.out.println("PageNum:"+PageNum+" PageSize:"+PageSize);
//        2.查询当前登录用户的云集数量，返回总记录数，（long类型）
        long count=noteDao.findNoteCount(userID,title,date,typeId);
        System.out.println("count:"+count);
//        3.判断总记录数是否大于0
//        如果大于0，调用Page类的代餐构造，得到其他分页参数的值，返回Page对象
        if(count<1){
            return null;
        }
        Page<Note> page=new Page<>(PageNum,PageSize,count);
        System.out.println("page:"+page);
        //得到数据库中分页查询的开始下标
        int index=(PageNum-1)*PageSize;
        System.out.println("index:"+index);
//        index=1;
//        4.查询当前登录用户下当前页的数据列表，返回note集合
        List<Note> noteList = noteDao.findNoteListByPage(PageSize, index, userID,title,date,typeId);
//        5.将note集合设置到page对象中
        page.setDataList(noteList);
//        6.返回page对象
        return page;
    }

    public List<Note> findNoteListByTypeId(String typeId, int userID) {
        List<Note> noteList = noteDao.findNoteListByTypeId(typeId, userID);

        return noteList;
    }

    public Note findNoteById(String noteId) {
//        1.接收参数（笔记ID）
        if (noteId==null||"".equals(noteId)){
            return null;
        }
//        2.调用Dao层的方法，返回note对象
        Note note=noteDao.findNoteById(noteId);
//        3.返回note对象
        return note;
    }

    public ResultInfo<Note> deletenote(String noteId) {
        ResultInfo<Note> resultInfo=new ResultInfo<>();
//        1.接收参数（noteId）
        if(noteId==null||"".equals(noteId)){
            resultInfo.setCode(0);
            resultInfo.setMsg("笔记ID不能为空");
            return resultInfo;
        }
//        2.调用Dao层的方法，返回受影响的行数
        int row=noteDao.deletenoteById(noteId);
//        3.判断受影响的行数是否大于0
//        如果大于0，说明删除成功，设置resultInfo对象的code值为1
//        如果不大于0，说明删除失败，设置resultInfo对象的code值为0，msg值为“删除失败”
        if(row>0){
            resultInfo.setCode(1);
        }else{
            resultInfo.setCode(0);
            resultInfo.setMsg("删除失败");
        }
//        4.返回resultInfo对象
        return resultInfo;
    }
}
