package com.example.demo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.demo.pojo.SaleChance;
import com.example.demo.service.SaleChanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author gxm
 * @since 2024-06-04
 */
@CrossOrigin
@RestController
@RequestMapping("/saleChance")
public class SaleChanceController {
    @Autowired
    SaleChanceService saleChanceService;
//    处理前端发来的请求
    @RequestMapping("/getSaleList")
    public Map<String, Object>
    getSaleList() {
        //通过调用service层的方法，获取用户信息
        List<SaleChance> SaleList = saleChanceService.getSaleList();
        //将用户信息封装成map返回前端
        //创建map对象，构造建值对格式数据
        Map<String, Object> map = new HashMap<>();

        //把指定的建，值添加到Map集合中
        map.put("code", 0);
        map.put("msg", "success");
        map.put("data", SaleList);
        return map;
    }
    @RequestMapping("/getPage")
    public Map<String, Object> getOnePage(Integer currentPage,Integer limit){
        IPage<SaleChance> onePage = saleChanceService.getOnePage(currentPage,limit);

        //创建map对象，构造建值对格式数据
        HashMap<String, Object> map = new HashMap<>();
        //把指定的建，值添加到Map集合中
        map.put("code", 0);
        map.put("msg", "success");
        map.put("data", onePage.getRecords());//查询到的用户信息
        map.put("count", onePage.getTotal());//总条数
        return map;
    }

    @RequestMapping("/updateSale")
    public Map<String, Object> updateSale(SaleChance saleChance){
            Boolean flag =  saleChanceService.updateSale(saleChance);
            //创建map对象，构造建值对格式的数据
            HashMap<String, Object> map = new HashMap<>();
            //把指定的建，值添加到Map集合中
            if (flag){
                map.put("code", 0);
                map.put("msg", "success");
            }else{
                map.put("code", 1);
                map.put("msg", "fail");
            }
            return map;

    }


    @RequestMapping("/addSale")
    public Map<String, Object> addSale(SaleChance saleChance){
        Boolean flag =  saleChanceService.addSale(saleChance);
        //创建map对象，构造建值对格式的数据
        HashMap<String, Object> map = new HashMap<>();
        //把指定的建，值添加到Map集合中
        if (flag){
            map.put("code", 0);
            map.put("msg", "success");
        }else{
            map.put("code", 1);
            map.put("msg", "fail");
        }
        return map;

    }

    @RequestMapping("/delSale")
    public Map<String, Object> delSale(SaleChance saleChance){
        Boolean flag =  saleChanceService.delSale(saleChance);
        //创建map对象，构造建值对格式的数据
        HashMap<String, Object> map = new HashMap<>();
        //把指定的建，值添加到Map集合中
        if (flag){
            map.put("code", 0);
            map.put("msg", "success");
        }else{
            map.put("code", 1);
            map.put("msg", "fail");
        }
        return map;

    }
}
