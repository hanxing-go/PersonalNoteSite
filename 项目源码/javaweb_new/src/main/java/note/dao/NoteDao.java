package note.dao;

import note.po.Note;

import java.util.ArrayList;
import java.util.List;

public class NoteDao {
    public int addOrUpdate(Note note) {
//        添加笔记，返回受影响的行数
        //定义sql语句
        String sql="insert into tb_note (typeId,title,content,pubTime) values(?,?,?,now())";
        //设置参数
        List<Object> params=new ArrayList<>();
        params.add(note.getTypeId());
        params.add(note.getTitle());
        params.add(note.getContent());
        //调用BaseDao的update方法
        int row=BaseDao.executeUpdate(sql,params);
        return row;
    }

    public long findNoteCount(int userID, String title, String date, String typeId) {
        //定义sql语句
        String sql = "SELECT count(1) FROM tb_note n INNER JOIN " +
                " tb_note_type t on n.typeId = t.typeId " +
                " WHERE userId = ? ";
        //设置参数
        List<Object> params = new ArrayList<>();
        params.add(userID);
        //判断条件查询的参数是否为空，如果不为空，拼接sql语句
        if (title != null && !"".equals(title)) {
            sql += " and n.title like concat('%',?,'%') ";
            params.add(title);
        }
//        if (date != null && !"".equals(date)) {
//            sql += " and date_format(pubTime,'%Y-%m-%d') = ? ";
//            params.add(date);
//        }
        if (typeId != null && !"".equals(typeId)) {
            sql += " and n.typeId = ? ";
            params.add(typeId);
        }



        //调用BaseDao的查询方法
        long count = (long) BaseDao.findSingleValue(sql, params);
        return count;
    }

    public List<Note> findNoteListByPage(int pageSize, int index, int userID, String title, String date, String typeId) {
        //定义sql语句
        String sql = "SELECT n.noteId,n.title,n.content,n.pubTime,t.typeName FROM tb_note n INNER JOIN " +
                " tb_note_type t on n.typeId = t.typeId " +
                " WHERE userId = ? ";
        //设置参数
        List<Object> params = new ArrayList<>();
        params.add(userID);

        //判断条件查询的参数是否为空，如果不为空，拼接sql语句
        if (title != null && !"".equals(title)) {
            sql += " and n.title like concat('%',?,'%') ";
            params.add(title);
        }
        if (date != null && !"".equals(date)) {
            sql += " and date_format(pubTime,'%Y-%m-%d') = ? ";
            params.add(date);
        }
        if (typeId != null && !"".equals(typeId)) {
            sql += " and n.typeId = ? ";
            params.add(typeId);
        }

        // 拼接分页的sql语句 （limit语句需要写在sql语句最后）
        sql += " order by pubTime desc limit ?,?";
        params.add(index);
        params.add(pageSize);

//        params.add(index);
//        params.add(pageNum);
        //调用BaseDao的查询方法
        List<Note> noteList = BaseDao.queryRows(sql, params, Note.class);
        return noteList;
    }

    public List<Note> findNoteListByTypeId(String typeId, int userID) {
        //定义sql语句
        String sql = "SELECT n.noteId,n.title,n.content,n.pubTime,t.typeName FROM tb_note n INNER JOIN " +
                " tb_note_type t on n.typeId = t.typeId " +
                " WHERE userId = ? and n.typeId = ? ";
        //设置参数
        List<Object> params = new ArrayList<>();
        params.add(userID);
        params.add(typeId);
        //调用BaseDao的查询方法
        List<Note> noteList = BaseDao.queryRows(sql, params, Note.class);
        return noteList;
    }

    public Note findNoteById(String noteId) {
        //定义sql语句
        String sql = "select noteId,title,content,pubTime from tb_note n" +
                " inner join tb_note_type t on n.typeId = t.typeId" +
                " where noteId = ?";
        //设置参数
        List<Object> params = new ArrayList<>();
        params.add(noteId);
        //调用BaseDao的查询方法
        Note note = (Note) BaseDao.queryRow(sql, params, Note.class);
        return note;
    }

    public int deletenoteById(String noteId) {
        //定义sql语句
        String sql = "delete from tb_note where noteId = ?";
        //设置参数
        List<Object> params = new ArrayList<>();
        params.add(noteId);
        //调用BaseDao的查询方法
        int row = BaseDao.executeUpdate(sql, params);
        return row;
    }
}
