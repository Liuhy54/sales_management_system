package com.example.demo.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.demo.dao.ContactDao;
import com.example.demo.pojo.Contact;
import com.example.demo.pojo.Customer;
import com.example.demo.service.ContactService;
import com.example.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zjs
 * @since 2024-06-11
 */
@CrossOrigin
@RestController
@RequestMapping("/contact")
public class ContactController {
    @Autowired
    ContactService contactService;

    //处理前端发来的查询请求
    @RequestMapping("/getconList")
    public Map<String, Object> getConList(Integer id) {
        List<Contact> contact=contactService.getlianxiren(id);
        HashMap<String, Object> map = new HashMap<>();

        System.out.println(contactService.getlianxiren(id));
        map.put("code", 0);
        map.put("msg", "成功查询");
        map.put("data", contact);


        return map;
    }

    //分页查询客户信息
    @RequestMapping("/getPage")
    public Map<String, Object> getOnePage(Integer currentPage, Integer limit,Integer id) {
        IPage<Contact> onePage = contactService.getOnePage(currentPage, limit,id);
        HashMap<String, Object> map = new HashMap<>();


        map.put("code", 0);
        map.put("msg", "成功查询");
        map.put("data", onePage.getRecords());//查询到的对象数据
        map.put("count", onePage.getTotal());//count查询到的数据条数

        return map;
    }
    //修改数据
    @RequestMapping("/updateCon")

    public Map<String, Object> updateCon(Contact contact) {

        Boolean flag = contactService.updateCon(contact);
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
    @RequestMapping("/addCon")

    public Map<String, Object> addCon(Contact contact) {

        Boolean flag = contactService.addCon(contact);
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
    @RequestMapping("/deleteCon")

    public Map<String, Object> deleteCon(Contact contact) {

        Boolean flag = contactService.deleteCon(contact);
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
}
