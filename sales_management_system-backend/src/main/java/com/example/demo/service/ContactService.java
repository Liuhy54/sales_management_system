package com.example.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.dao.ContactDao;
import com.example.demo.pojo.Contact;
import com.example.demo.pojo.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactService {
    @Autowired
    ContactDao contactDao;

    //查询客户对应联系人信息表的所有信息
    public List<Contact> getlianxiren(Integer id) {
        QueryWrapper<Contact> contactQueryWrapper = new QueryWrapper<>();
        contactQueryWrapper.eq("cus_id", id);

        List contact = contactDao.selectList(contactQueryWrapper);
        return contact;
    }

    //查询某一页中的所有客户信息
    //需要 页码、每页显示条数
    public IPage<Contact> getOnePage(Integer currentPage, Integer limit, Integer id) {
        //创建page对象
        Page<Contact> custPage = new Page<>(currentPage, limit);
        QueryWrapper<Contact> contactQueryWrapper = new QueryWrapper<>();
        contactQueryWrapper.eq("cus_id", id);
        //调用分页查询方法
        contactDao.selectPage(custPage, contactQueryWrapper);
        return custPage;
    }

    //修改数据
    public Boolean updateCon(Contact contact) {
        int i = contactDao.updateById(contact);
        return i > 0;//修改成功
    }
    //添加数据
    public Boolean addCon(Contact contact) {
        int i = contactDao.insert(contact);
        return i > 0;//添加成功
    }

    //删除数据
    public Boolean deleteCon(Contact contact) {
        int i = contactDao.deleteById(contact);
        return i > 0;//添加成功
    }
}
