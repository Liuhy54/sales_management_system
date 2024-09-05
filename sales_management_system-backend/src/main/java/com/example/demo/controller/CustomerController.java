package com.example.demo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.demo.pojo.Customer;
import com.example.demo.pojo.Report;
import com.example.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zjs
 * @since 2024-06-07
 */
@CrossOrigin
@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    //处理前端发来的查询请求
    @RequestMapping("/getcustList")
    public Map<String, Object> getSaleList() {
        List<Customer> customerList = customerService.getcustList();
        HashMap<String, Object> map = new HashMap<>();


        map.put("code", 0);
        map.put("msg", "成功查询");
        map.put("data", customerList);


        return map;
    }

    //分页查询客户信息
    @RequestMapping("/getPage")
    public Map<String, Object> getOnePage(Integer currentPage, Integer limit) {
        IPage<Customer> onePage = customerService.getOnePage(currentPage, limit);
        HashMap<String, Object> map = new HashMap<>();


        map.put("code", 0);
        map.put("msg", "成功查询");
        map.put("data", onePage.getRecords());//查询到的对象数据
        map.put("count", onePage.getTotal());//count查询到的数据条数

        return map;
    }

    //修改数据
    @RequestMapping("/updateCust")

    public Map<String, Object> updateCust(Customer customer) {

        Boolean flag = customerService.updateCust(customer);
        HashMap<String, Object> map = new HashMap<>();

        if (flag) {
            map.put("code", 0);
            map.put("msg", "修改成功");
        } else {
            map.put("code", 1);
            map.put("msg", "修改失败");
        }

        return map;
    }

    //新增数据
    @RequestMapping("/addCust")

    public Map<String, Object> addCust(Customer customer) {

        Boolean flag = customerService.addCust(customer);
        HashMap<String, Object> map = new HashMap<>();

        if (flag) {
            map.put("code", 0);
            map.put("msg", "添加成功");
        } else {
            map.put("code", 1);
            map.put("msg", "添加失败");
        }

        return map;
    }

    //删除数据
    @RequestMapping("/deleteCust")

    public Map<String, Object> deleteCust(Customer customer) {

        Boolean flag = customerService.deleteCust(customer);
        HashMap<String, Object> map = new HashMap<>();

        if (flag) {
            map.put("code", 0);
            map.put("msg", "删除成功");
        } else {
            map.put("code", 1);
            map.put("msg", "删除失败");
        }

        return map;
    }

    //查询客户等级
    @RequestMapping("/rep1")
    public Map<String, Object> rep1() {
        List<Report> cuslev = customerService.getCusLev();

        //定义变量
        ArrayList<String> xdata = new ArrayList<>();//分类
        ArrayList<Integer> ydata = new ArrayList<>();//具体数量
        for (Report report : cuslev) {
            String res = null;
            switch (report.getItem()) {
                case 'A':
                    res = "重点客户";
                    break;
                case 'B':
                    res = "普通客户";
                    break;
                case 'C':
                    res = "非优先客户";
                    break;
            }
            xdata.add(res);
            ydata.add(report.getNum());
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("xdata", xdata);
        map.put("ydata", ydata);
        map.put("code", 0);
        return map;
    }

    //查询客户等级
    @RequestMapping("/rep2")
    public Map<String, Object> rep2() {
        List<Report> cusreg = customerService.getCusReg();

        //定义变量
        ArrayList<String> xdata = new ArrayList<>();//分类
        ArrayList<Integer> ydata = new ArrayList<>();//具体数量
        for (Report report : cusreg) {
            String res = null;
            switch (report.getItem()) {
                case '1':
                    res = "东北";
                    break;
                case '2':
                    res = "华北";
                    break;
                case '3':
                    res = "西北";
                    break;
                case '4':
                    res = "西南";
                    break;
                case '5':
                    res = "华南";
                    break;
                case '6':
                    res = "华中";
                    break;
                case '7':
                    res = "华东";
                    break;
            }
            xdata.add(res);
            ydata.add(report.getNum());
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("xdata", xdata);
        map.put("ydata", ydata);
        map.put("code", 0);
        return map;
    }

    //查询客户行业
    @RequestMapping("/rep3")
    public Map<String, Object> rep3() {
        List<Report> cusind = customerService.getCusInd();

        //定义变量
        List<Map<String, Object>> data = new ArrayList<>();
        ArrayList<String> xdata = new ArrayList<>();//分类
        ArrayList<Integer> ydata = new ArrayList<>();//具体数量

        for (Report report : cusind) {
            String res = null;
            switch (report.getItem()) {
                case '1':
                    res = "金融";
                    break;
                case '2':
                    res = "房地产";
                    break;
                case '3':
                    res = "商业服务";
                    break;
                case '4':
                    res = "运输物流";
                    break;
                case '5':
                    res = "生产";
                    break;
                case '6':
                    res = "政府";
                    break;
                case '7':
                    res = "文化传媒";
                    break;
                case '8':
                    res = "其它";
                    break;
            }
            if (res != null) {
                Map<String, Object> itemData = new HashMap<>();
                itemData.put("name", res);
                itemData.put("value", report.getNum());
                data.add(itemData);
            }
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("data", data);
        map.put("code", 0);
        return map;
    }
}
