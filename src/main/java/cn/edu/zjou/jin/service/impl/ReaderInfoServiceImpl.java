package cn.edu.zjou.jin.service.impl;

import cn.edu.zjou.jin.dao.LendListMapper;
import cn.edu.zjou.jin.po.LendList;
import cn.edu.zjou.jin.service.ReaderInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.edu.zjou.jin.dao.ReaderInfoMapper;
import cn.edu.zjou.jin.po.ReaderInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("readerInfoService")
public class ReaderInfoServiceImpl implements ReaderInfoService {

    @Autowired
    private ReaderInfoMapper readerInfoMapper;

    @Autowired
    private LendListMapper lendListMapper;

    @Override
    public PageInfo<ReaderInfo> queryAllReaderInfo(ReaderInfo readerInfo, Integer pageNum, Integer limit) {
        PageHelper.startPage(pageNum,limit);
        List<ReaderInfo> readerInfoList =  readerInfoMapper.queryAllReaderInfo(readerInfo);
        return new PageInfo<>(readerInfoList);
    }

    @Override
    public void addReaderInfoSubmit(ReaderInfo readerInfo) {
        readerInfoMapper.insert(readerInfo);
    }

    @Override
    public ReaderInfo queryReaderInfoById(Integer id) {
        return readerInfoMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询学号是否已存在（修改前先查询）
     * @param username
     */
    @Override
    public ReaderInfo queryReaderInfoByUsername(String username) {
        return readerInfoMapper.selectByUsername(username);
    }

    @Override
    public void updateReaderInfoSubmit(ReaderInfo readerInfo) {
        readerInfoMapper.updateByPrimaryKeySelective(readerInfo);
    }

    @Override
    public void deleteReaderInfoByIds(List<String> ids) {
        for (String id : ids){
            readerInfoMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
    }

    @Override
    public ReaderInfo queryUserInfoByNameAndPassword(String username, String password) {
        return readerInfoMapper.queryUserInfoByNameAndPassword(username, password);
    }

    /**
     * 根据最大已借阅天数来设置读者状态 超60天则设为 0：不可借阅
     * @param readerInfo
     */
    @Override
    public void updateReaderStatusByLendDays(ReaderInfo readerInfo) {
        List<LendList> list = lendListMapper.queryLendListByRid(readerInfo.getId());
        int maxLendDays=0;
        for (LendList lendList : list) {
            if (lendList.getLendDays() > maxLendDays) {
                maxLendDays = lendList.getLendDays();
            }
        }
        if(maxLendDays>60){
            readerInfo.setStatus(0);
        }
        readerInfoMapper.updateByPrimaryKey(readerInfo);
    }
}
