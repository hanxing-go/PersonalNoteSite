package note.util;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Page<T> {
    private int PageNum;//当前页码
    private int PageSize;//每页显示的条数
    private long totalCount;//总条数(从数据库中查询)

    private int totalPages;//总页数(计算得到 总记录数/每页显示的条数)
    private int prePage;//上一页(当前页码-1；如果当前页码为1，则上一页为1
    private int nextPage;//下一页(当前页码+1；如果当前页码为总页数，则下一页为总页数)
    private int startNavPage;//开始导航页码(当前页码-5；如果当前页码小于5，则开始导航页码为1)
    private int endNavPage;//结束导航页码(当前页码+5；如果当前页码+5大于总页数，则结束导航页码为总页数)

    private List<T> dataList;//当前页码显示的数据集合(从数据库中查询)

    public Page(int pageNum, int pageSize, long totalCount) {
        PageNum = pageNum;
        PageSize = pageSize;
        this.totalCount = totalCount;

        //总页数 (总记录数/每页显示的条数，将参数转换为浮点型，再向上取整)
        this.totalPages = (int) Math.ceil(totalCount * 1.0 / pageSize);
        //上一页 (当前页码-1；如果当前页码为1，则上一页为1)
        this.prePage = PageNum - 1 < 1 ? 1 : PageNum - 1;

        //下一页 (当前页码+1；如果当前页码为总页数，则下一页为总页数)
        this.nextPage = PageNum + 1 > totalPages ? totalPages : PageNum + 1;

        //开始导航页码 (当前页码-5；如果当前页码小于5，则开始导航页码为1)
        this.startNavPage = PageNum - 5 < 1 ? 1 : PageNum - 5;
        //结束导航页码 (当前页码+5；如果当前页码+5大于总页数，则结束导航页码为总页数)
        this.endNavPage = PageNum + 5 > totalPages ? totalPages : PageNum + 5;
    }
}
