package com.example.demo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.dao.CustomerDao;
import com.example.demo.pojo.Customer;
import com.example.demo.pojo.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    @Autowired
    CustomerDao customerDao;

    //查询客户信息表的所有信息
    public List<Customer> getcustList() {
        List<Customer> customers = customerDao.selectList(null);
        return customers;
    }

    //查询某一页中的所有客户信息
    //需要 页码、每页显示条数
    public IPage<Customer> getOnePage(Integer currentPage, Integer limit) {
        //创建page对象
        Page<Customer> custPage = new Page<>(currentPage, limit);
        //调用分页查询方法
        customerDao.selectPage(custPage, null);
        return custPage;
    }

    //修改数据
    public Boolean updateCust(Customer customer) {
        int i = customerDao.updateById(customer);
        return i > 0;//修改成功
    }

    //添加数据
    public Boolean addCust(Customer customer) {
        int i = customerDao.insert(customer);
        return i > 0;//添加成功
    }

    //删除数据
    public Boolean deleteCust(Customer customer) {
        int i = customerDao.deleteById(customer);
        return i > 0;//添加成功
    }

    //查询客户等级和对应条数
    public List<Report> getCusLev() {
        List<Report> rep = customerDao.countByLevel();
        return rep;
    }

    //查询客户地区和对应条数
    public List<Report> getCusReg() {
        List<Report> rep = customerDao.countByRegion();
        return rep;
    }

    //查询客户行业和对应条数
    public List<Report> getCusInd() {
        List<Report> rep = customerDao.countByIndustry();
        return rep;
    }
}
