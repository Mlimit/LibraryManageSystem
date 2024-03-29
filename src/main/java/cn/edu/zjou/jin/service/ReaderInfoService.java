package cn.edu.zjou.jin.service;

import com.github.pagehelper.PageInfo;
import cn.edu.zjou.jin.po.ReaderInfo;

import java.util.List;

public interface ReaderInfoService {

    /**
     * 查询所有记录
     */
    PageInfo<ReaderInfo> queryAllReaderInfo(ReaderInfo readerInfo,Integer pageNum,Integer limit);

    /**
     * 添加
     */
    void addReaderInfoSubmit(ReaderInfo readerInfo);

    /**
     * 查询（修改前先查询）
     */
    ReaderInfo queryReaderInfoById(Integer id);

    /**
     * 查询学号是否已存在（修改前先查询）
     */
    ReaderInfo queryReaderInfoByUsername(String username);

    /**
     * 修改提交
     */
    void updateReaderInfoSubmit(ReaderInfo readerInfo);

    /**
     * 删除
     */
    void deleteReaderInfoByIds(List<String> ids);

    /**
     * 根据学号和密码查询用户信息
     */
    ReaderInfo queryUserInfoByNameAndPassword(String username,String password);


    /**
     * 根据最大已借阅天数来设置读者状态 超60天则设为 0：不可借阅
     * @param readerInfo
     */
    void updateReaderStatusByLendDays(ReaderInfo readerInfo);
}
