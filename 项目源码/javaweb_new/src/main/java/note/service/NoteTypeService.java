package note.service;

import note.dao.NotetypeDao;
import note.po.NoteType;
import note.po.User;
import note.vo.ResultInfo;

import java.util.List;

//        Service层：
//                1. 调用Dao层的查询方法，通过用户ID查询类型集合
//                2. 返回类型列表
public class NoteTypeService {
    private NotetypeDao typeDao = new NotetypeDao();

    /*
    * 查找
    */
    public List<NoteType> findNoteTypeByUserId(int userId) {
        return typeDao.findNoteTypeByUserId(userId);
    }

    /*
     * 删除
     */
    public ResultInfo<NoteType> deleteType(String typeName, int userID) {
        ResultInfo<NoteType> resultInfo = new ResultInfo<>();
//        1.判断参数是否为空
        if(typeName==null||typeName.equals("")){
            resultInfo.setCode(0);
            resultInfo.setMsg("系统异常请重试");
            return resultInfo;
        }
//        2.调用Dao层，通过类型ID查询该类型下的笔记数量
        long notecount = typeDao.findNoteCountByTypeId(typeName);
        System.out.println("一共有"+notecount+"条记录");
//        3.如果云记数量大于0，说明存在子记录，不可删除，返回ResultInfo对象
//                code=0，msg="该类型下存在笔记，不可删除" 返回resultInfo对象
        if(notecount>0){
            resultInfo.setCode(0);
            resultInfo.setMsg("该类型下存在笔记，不可删除");
            return resultInfo;
        }
//        4.如果不存在子记录，调用Dao层的删除方法，通过类型ID删除指定的类型记录，返回受影响的行数
        int row = typeDao.deleteTypeByTypeId(typeName, userID);
//        5.判断受影响的行数是否大于0，大于0，删除成功，返回ResultInfo对象
//                code=1，msg="删除成功" 返回resultInfo对象
        if(row>0){
            resultInfo.setCode(1);
            resultInfo.setMsg("删除成功");
            return resultInfo;
        }
//        6.如果受影响的行数小于等于0，删除失败，返回ResultInfo对象
//                code=0，msg="删除失败" 返回resultInfo对象
        resultInfo.setCode(0);
        resultInfo.setMsg("删除失败");
        return resultInfo;
    }

    public ResultInfo<NoteType> addNoteType(String typeName, int userID) {
        System.out.println("addNoteType:typeName"+typeName);
        System.out.println("addNoteType:userID"+userID);
        ResultInfo<NoteType> resultInfo = new ResultInfo<>();
//        1.判断参数是否为空
        if(typeName==null||typeName.equals("")){
            resultInfo.setCode(0);
            resultInfo.setMsg("名字为空.");
            return resultInfo;
        }
//        2.调用Dao层的查询方法，通过类型名称和用户ID查询类型对象
        NoteType type = typeDao.findNoteTypeByTypeNameAndUserId(typeName, userID);
//        3.判断类型对象是否为空
//                如果不为空，说明类型已经存在，返回ResultInfo对象
//                code=0，msg="该类型已经存在" 返回resultInfo对象
        if(type!=null){
            resultInfo.setCode(0);
            resultInfo.setMsg("该类型已经存在");
            return resultInfo;
        }
//        4.如果为空，调用Dao层的添加方法，返回受影响的行数
        int row = typeDao.addNoteType(typeName, userID);
//        5.判断受影响的行数是否大于0，大于0，添加成功，返回ResultInfo对象
//                code=1，msg="添加成功" 返回resultInfo对象
        if(row>0){
            resultInfo.setCode(1);
            resultInfo.setMsg("添加成功");
            return resultInfo;
        }
//        6.如果受影响的行数小于等于0，添加失败，返回ResultInfo对象
//                code=0，msg="添加失败" 返回resultInfo对象
        resultInfo.setCode(0);
        resultInfo.setMsg("添加失败");
        return resultInfo;
    }

    public ResultInfo<NoteType> updateNoteType(String typeId,String typeName, int userID) {
        ResultInfo<NoteType> resultInfo = new ResultInfo<>();
//        1.判断参数是否为空
        if(typeName==null||typeName.equals("")){
            resultInfo.setCode(0);
            resultInfo.setMsg("名字为空.");
            return resultInfo;
        }
//        2.调用Dao层的查询方法，通过类型Id和用户ID查询类型对象
        NoteType type = typeDao.findNoteTypeByTypeIdAndUserId(typeId, userID);
//            调用Dao层的查询方法，判断当前类型名，是否已存在
        NoteType type1 = typeDao.findNoteTypeByTypeNameAndUserId(typeName, userID);
//        if(type!=null){
//            System.out.println(type.getTypeId()+" "+type.getTypeName());
//        }
//        else
//            System.out.println("空");
//        3.判断类型对象是否为空
//                如果不为空，说明类型已经存在，返回ResultInfo对象
//                code=0，msg="该类型已经存在" 返回resultInfo对象
        if(type1!=null){
            resultInfo.setCode(0);
            resultInfo.setMsg("该类型已经存在");
            return resultInfo;
        }
//        4.如果为空，调用Dao层的更新方法，返回受影响的行数
        int row = typeDao.updateNoteType(typeName, type.getTypeId());
//        5.判断受影响的行数是否大于0，大于0，更新成功，返回ResultInfo对象
//                code=1，msg="更新成功" 返回resultInfo对象
        if(row>0){
            resultInfo.setCode(1);
            resultInfo.setMsg("更新成功");
            return resultInfo;
        }
//        6.如果受影响的行数小于等于0，更新失败，返回ResultInfo对象
//                code=0，msg="更新失败" 返回resultInfo对象
        resultInfo.setCode(0);
        resultInfo.setMsg("更新失败");
        return resultInfo;
    }
}
