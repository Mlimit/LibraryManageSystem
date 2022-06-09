package cn.edu.zjou.jin.controller;

import cn.edu.zjou.jin.service.BookInfoService;
import cn.edu.zjou.jin.service.LendListService;
import cn.edu.zjou.jin.service.ReaderInfoService;
import com.github.pagehelper.PageInfo;
import cn.edu.zjou.jin.po.BookInfo;
import cn.edu.zjou.jin.po.LendList;
import cn.edu.zjou.jin.po.ReaderInfo;
import cn.edu.zjou.jin.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class LendListController {
    @Autowired
    private LendListService lendListService;
    @Autowired
    private ReaderInfoService readerService;

    @Autowired
    private BookInfoService bookInfoService;

    @GetMapping("/lendListIndex")
    public String lendListIndex(){
        return "lend/lendListIndex";
    }

    /**
     * 查询所有的列表
     * 1 request获取
     * 2、参数绑定
     * 3、对象绑定
     */
    @ResponseBody
    @RequestMapping("/lendListAll")
    public DataInfo lendListAll(Integer type, String username, String bookName, Integer status,
                         @RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "15")Integer limit){

        LendList info=new LendList();
        info.setBackType(type);

        //创建读者对象
        ReaderInfo reader=new ReaderInfo();
        reader.setUsername(username);
        //把以上对象交给info
        info.setReaderInfo(reader);

       //图书对象
        BookInfo book=new BookInfo();
        book.setName(bookName);
        book.setStatus(status);
        info.setBookInfo(book);

        //分页查询所有的记录信息
        PageInfo pageInfo=lendListService.queryLendListAll(info,page,limit);
        return DataInfo.ok("ok",pageInfo.getTotal(),pageInfo.getList());
    }


    /**
     * 添加跳转
     */
    @GetMapping("/addLendList")
    public String addLendList(){
        return "lend/addLendList";
    }

    /**
     * 借书信息提交
     * 1判断读者学号是否存在
     * 2、可借的数据是否大于等于当前的借书量
     * 3、添加借书记录，同时改变书的状态信息
     * cardnumber:借书号码
     * ids：字符串 书id的集合
     */
    @ResponseBody
    @RequestMapping("/addLend")
    public DataInfo addLend(String username,String ids){
        //获取图书id的集合
        List<String> list= Arrays.asList(ids.split(","));
        //判断学号是否存在
        ReaderInfo reader=new ReaderInfo();
        reader.setUsername(username);
        PageInfo<ReaderInfo> pageInfo=readerService.queryAllReaderInfo(reader,1,1);
        if(pageInfo.getList().size()==0){
            return DataInfo.fail("学号信息不存在");
        }else{
            ReaderInfo readerCard2=pageInfo.getList().get(0);
            for(String bid:list) {
                BookInfo bookInfo = bookInfoService.queryBookInfoById(Integer.valueOf(bid));
                if (bookInfo.getStock() > 0 && bookInfo.getStatus() == 1 && readerCard2.getStatus() == 1) {//可借阅
                    LendList lendList = new LendList();
                    lendList.setReaderId(readerCard2.getId());//读者id
                    lendList.setBookId(Integer.valueOf(bid));//书的id
                    lendList.setLendDate(new Date());
                    lendList.setLendDays(0);
                    lendListService.addLendListSubmit(lendList);
                    int stock = bookInfo.getStock();
                    bookInfo.setStock(--stock);//图书借出，库存-1
                    bookInfo.setStatus(0);//改为已借出(不可借阅)
                    bookInfoService.updateBookSubmit(bookInfo);
                    bookInfoService.updateBookStockByIsbn(bookInfo);//更改所有同isbn的书籍库存
                } else if (bookInfo.getStock() == 0) {//已无库存
                    return DataInfo.fail("该书已无库存！");
                } else if (bookInfo.getStatus() == 0) {//已被借走
                    return DataInfo.fail("该书已被借阅！");
                } else if(readerCard2.getStatus()==0){
                    return DataInfo.fail("您有超期图书未归还,请归还后再进行借阅！");
                }
            }

        }

        return DataInfo.ok();
    }


    /**
     * 删除借阅记录
     */
    @ResponseBody
    @RequestMapping("/deleteLendListByIds")
    public DataInfo deleteLendListByIds(String ids, String bookIds){
        List list=Arrays.asList(ids.split(","));//借阅记录的id
        List blist=Arrays.asList(bookIds.split(","));//图书信息的id

        lendListService.deleteLendListById(list,blist);
        return DataInfo.ok();
    }

    /**
     * 还书功能
     */
    @ResponseBody
    @RequestMapping("/backLendListByIds")
    public DataInfo backLendListByIds(String ids,String bookIds){
        List list=Arrays.asList(ids.split(","));//借阅记录的id
        List blist=Arrays.asList(bookIds.split(","));//图书信息的id
        lendListService.updateLendListSubmit(list,blist);
        return DataInfo.ok();
    }

    /**
     * 页面跳转 异常还书
     */
    @GetMapping("/excBackBook")
    public String excBackBook(HttpServletRequest request, Model model){
       //获取借阅记录id
        String id=request.getParameter("id");
        String  bId=request.getParameter("bookId");
        model.addAttribute("id",id);
        model.addAttribute("bid",bId);
        return "lend/excBackBook";
    }

    /**
     * 异常还书
     */
    @ResponseBody
    @RequestMapping("/updateLendInfoSubmit")
    public DataInfo updateLendInfoSubmit(LendList lendList){
        lendListService.backBook(lendList);
        return DataInfo.ok();
    }

    /**
     * 查阅时间线
     */
    @RequestMapping("/queryLookBookList")
    public String queryLookBookList(String flag,Integer id,Model model){
        List<LendList> list=null;
        if(flag.equals("book")){
             list=lendListService.queryLookBookList(null,id);
        }else{
             list=lendListService.queryLookBookList(id,null);
        }
        model.addAttribute("info",list);
        return "lend/lookBookList";
    }

    @RequestMapping("/queryLookBookList2")
    public String queryLookBookList(HttpServletRequest request,Model model){
        ReaderInfo readerInfo = (ReaderInfo) request.getSession().getAttribute("user");
        List<LendList> list = list=lendListService.queryLookBookList(readerInfo.getId(),null);
        model.addAttribute("info",list);
        return "lend/lookBookList";
    }


}
