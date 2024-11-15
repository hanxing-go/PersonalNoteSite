package note.dao;

import note.po.NoteType;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class NotetypeDao {
    public List<NoteType> findNoteTypeByUserId(int userId) {
//        Dao层：
//        1. 编写sql语句，通过用户ID查询类型集合
        String sql= "select * from tb_note_type where userId=?";
//        2. 设置参数列表
        List<Object> params = new ArrayList<>();
        params.add(userId);
//        3. 调用BaseDao的查询方法，返回集合
        List<NoteType> list = BaseDao.queryRows(sql, params, NoteType.class);
//        4. 返回集合
        return list;
    }

    public long findNoteCountByTypeId(String typeName) {
//        通过类型ID查询该类型下的笔记数量
//        1.编写sql语句，通过类型ID查询该类型下的笔记数量
//            先通过typeName获取typeId
        String sql1="select typeId from tb_note_type where typeName=?";
        List<Object> params1 = new ArrayList<>();
        params1.add(typeName);
        int typeID = (int) BaseDao.findSingleValue(sql1, params1);


        String sql="select count(*) from tb_note where typeid=?";
//        2.设置参数列表
        List<Object> params = new ArrayList<>();
        params.add(typeID);
//        3.调用BaseDao的查询方法，返回数量
        long count = (long) BaseDao.findSingleValue(sql, params);
        return count;

    }

    public int deleteTypeByTypeId(String typeName, int userID) {
//        通过类型ID删除指定的类型记录
//        1.编写sql语句，通过类型ID删除指定的类型记录
        String sql="delete from tb_note_type where typeName=? and userId=?";
//        2.设置参数列表
        List<Object> params = new ArrayList<>();
        params.add(typeName);
        params.add(userID);
//        3.调用BaseDao的更新方法，返回受影响的行数
        int row = BaseDao.executeUpdate(sql, params);
        return row;
    }

    public NoteType findNoteTypeByTypeNameAndUserId(String typeName, int userID) {
        //定义sql语句
        String sql = "select * from tb_note_type where typeName=? and userId=?";
        //设置参数列表
        List<Object> params = new ArrayList<>();
        params.add(typeName);
        params.add(userID);
        //调用BaseDao的查询方法，返回类型对象
        NoteType type = (NoteType) BaseDao.queryRow(sql, params, NoteType.class);
        //返回类型对象
        return type;
    }

    public int addNoteType(String typeName, int userID) {
        //定义sql语句
        String sql = "insert into tb_note_type values(null,?,?)";
        //设置参数列表
        List<Object> params = new ArrayList<>();
        params.add(typeName);
        params.add(userID);
        //调用BaseDao的更新方法，返回受影响的行数
        int row = BaseDao.executeUpdate(sql, params);
        //返回受影响的行数
        return row;
    }

    public int updateNoteType(String typeName, int typeID) {
        //定义sql语句
        String sql = "update tb_note_type set typeName=? where typeId=?";
        //设置参数列表
        List<Object> params = new ArrayList<>();
        params.add(typeName);
        params.add(typeID);
        //调用BaseDao的更新方法，返回受影响的行数
        int row = BaseDao.executeUpdate(sql, params);
        //返回受影响的行数
        return row;
    }

    public NoteType findNoteTypeByTypeIdAndUserId(String typeId, int userID) {
        //定义sql语句
        String sql = "select * from tb_note_type where typeId=? and userId=?";
        //设置参数列表
        List<Object> params = new ArrayList<>();
        params.add(typeId);
        params.add(userID);
        //调用BaseDao的查询方法，返回类型对象
        NoteType type = (NoteType) BaseDao.queryRow(sql, params, NoteType.class);
        //返回类型对象
        return type;
    }
}
