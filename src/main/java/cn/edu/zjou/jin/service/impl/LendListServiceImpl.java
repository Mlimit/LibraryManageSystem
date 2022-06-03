package cn.edu.zjou.jin.service.impl;

import cn.edu.zjou.jin.codeutil.DateUtil;
import cn.edu.zjou.jin.service.LendListService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.edu.zjou.jin.dao.BookInfoMapper;
import cn.edu.zjou.jin.dao.LendListMapper;
import cn.edu.zjou.jin.po.BookInfo;
import cn.edu.zjou.jin.po.LendList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service("lendListService")
public class LendListServiceImpl implements LendListService {

    @Autowired
    private LendListMapper lendListMapper;
    @Autowired
    private BookInfoMapper bookInfoMapper;


    @Override
    public PageInfo<LendList> queryLendListAll(LendList lendList, int page, int limit) {
        PageHelper.startPage(page,limit);
        List<LendList> list=lendListMapper.queryLendListAll(lendList);

        PageInfo pageInfo=new PageInfo(list);
        return pageInfo;
    }

    /**
     * 借书，添加借书记录
     * @param lendList
     */
    @Override
    public void addLendListSubmit(LendList lendList) {
        lendListMapper.insert(lendList);
    }


    /**
     * 删除
     */
    @Override
    public void deleteLendListById(List<String> ids, List<String> bookIds) {

        //删除借阅记录
        for(String id:ids){
            lendListMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
        //更改图书标识，更新状态为未借出
        for(String bid:bookIds){
            //根据id查询图书记录信息
            BookInfo bookInfo=bookInfoMapper.selectByPrimaryKey(Integer.parseInt(bid));
            int stock = bookInfo.getStock();
            bookInfo.setStock(++stock);//库存+1
            bookInfo.setStatus(1);//改为未借出(可借阅)
            bookInfoMapper.updateBookStockByIsbn(bookInfo);//更新所有同isbn的库存
            bookInfoMapper.updateByPrimaryKey(bookInfo);
        }
    }

    /**
     * 还书
     */
    @Override
    public void updateLendListSubmit(List<String> ids, List<String> bookIds) {
        for(String id:ids){
            //根据id查询借阅记录信息
            LendList lendList=new LendList();
            lendList.setId(Integer.parseInt(id));
            LendList lendList1 = lendListMapper.selectByPrimaryKey(Integer.parseInt(id));
            lendList.setBackDate(new Date());
            lendList.setBackType(0);//正常还书
            if (lendList1.getBackType() == null) {
                lendList.setLendDays(DateUtil.dateCompute(lendList1.getLendDate(), new Date()));
            }else{
                lendList.setLendDays(DateUtil.dateCompute(lendList1.getLendDate(),lendList1.getBackDate()));
            }
            lendListMapper.updateLendListSubmit(lendList);//如果用updatePrimarykey会默认很多赋值为空
        }
        //修改书的状态
        //更改图书标识，更新状态为未借出
        for(String bid:bookIds){
            //根据id查询图书记录信息
            BookInfo bookInfo=bookInfoMapper.selectByPrimaryKey(Integer.parseInt(bid));
            int stock = bookInfo.getStock();
            bookInfo.setStock(++stock);//图书归还，库存+1
            bookInfo.setStatus(1);//改为未借出(可借阅)
            bookInfoMapper.updateBookStockByIsbn(bookInfo);//更新所有同isbn的库存
            bookInfoMapper.updateByPrimaryKey(bookInfo);
        }
    }

    /**
     * 异常还书
     */
    @Override
    public void backBook(LendList lendList) {
        LendList lend=new LendList();
        lend.setId(lendList.getId());
        lend.setBackType(lendList.getBackType());
        lend.setBackDate(new Date());
        lend.setExceptRemarks(lendList.getExceptRemarks());
        lend.setBookId(lendList.getBookId());
        lendListMapper.updateLendListSubmit(lend);
        //判断异常还书 如果是延期或者正常还书，需要更改书的状态
        if(lend.getBackType()==0 || lend.getBackType()==1){
            BookInfo bookInfo=bookInfoMapper.selectByPrimaryKey(lend.getBookId());
            int stock = bookInfo.getStock();
            bookInfo.setStock(--stock);
            bookInfo.setStatus(1);//改为未借出(可借阅)
            bookInfoMapper.updateBookStockByIsbn(bookInfo);//更新所有同isbn的库存
            bookInfoMapper.updateByPrimaryKey(bookInfo);
        }

    }

    /**
     * 时间线查询
     */
    @Override
    public List<LendList> queryLookBookList(Integer rid, Integer bid) {
        return lendListMapper.queryLookBookList(rid, bid);
    }

    /**
     * 更新已被借阅天数
     *
     * @param lendList
     */
    @Override
    public void updateLendDays(LendList lendList){
        List<LendList> list = lendListMapper.queryLendListAll(lendList);
        int days;
        for (LendList lendlist : list) {
            if (lendlist.getBackType() == null) {
                days = DateUtil.dateCompute(lendlist.getLendDate(), new Date());
                lendlist.setLendDays(++days);
            }
            lendListMapper.updateByPrimaryKey(lendlist);
        }
    }

}
