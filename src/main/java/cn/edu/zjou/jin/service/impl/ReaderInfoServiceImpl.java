package cn.edu.zjou.jin.service.impl;

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

    @Override
    public void updateReaderInfoSubmit(ReaderInfo readerInfo) {
        readerInfoMapper.updateByPrimaryKey(readerInfo);
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
}
