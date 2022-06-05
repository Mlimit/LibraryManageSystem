package cn.edu.zjou.jin.dao;

import cn.edu.zjou.jin.po.ReaderInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReaderInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(ReaderInfo record);

    int insertSelective(ReaderInfo record);

    ReaderInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReaderInfo record);

    int updateByPrimaryKey(ReaderInfo record);

    /**
     * 查询所有记录信息
     */
    List<ReaderInfo> queryAllReaderInfo(ReaderInfo readerInfo);

    /**
     * 根据学号和密码查询读者信息
     */
    ReaderInfo queryUserInfoByNameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * 根据学号查询读者信息
     * @param username
     * @return
     */
    ReaderInfo selectByUsername(@Param("username") String username);
}