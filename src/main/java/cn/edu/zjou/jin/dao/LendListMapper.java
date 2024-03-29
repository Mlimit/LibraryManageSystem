package cn.edu.zjou.jin.dao;

import cn.edu.zjou.jin.po.LendList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LendListMapper {
    void deleteByPrimaryKey(Integer id);

    void insert(LendList record);

    void insertSelective(LendList record);

    LendList selectByPrimaryKey(Integer id);

    void updateByPrimaryKeySelective(LendList record);

    void updateByPrimaryKey(LendList record);

    /**
     * 查询所有借阅记录
     */
    List<LendList> queryLendListAll(LendList lendList);


    /**
     * 查询借阅阅时间线（一本书什么时候被借走过）
     */
    List<LendList> queryLookBookList(@Param("rid") Integer rid, @Param("bid") Integer bid);

    /**
     * 还书操作(正常还)
     */
    void updateLendListSubmit(LendList lendList);

    /**
     * 根据读者id查询借阅记录
     */
    List<LendList> queryLendListByRid(Integer rid);
}