package cn.edu.zjou.jin.dao;

import cn.edu.zjou.jin.po.BookInfo;

import java.util.List;

public interface BookInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(BookInfo record);

    int insertSelective(BookInfo record);

    BookInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BookInfo record);

    int updateByPrimaryKey(BookInfo record);

    /**
     * 查询所有图书记录
     */
    List<BookInfo> queryBookInfoAll(BookInfo bookInfo);

    /**
     * 根据类型获取图书数量
     */
    List<BookInfo> getBookCountByType();

    /**
     * 修改同isbn书籍的库存
     * @param bookInfo
     * @return
     */
    void updateBookStockByIsbn(BookInfo bookInfo);
}