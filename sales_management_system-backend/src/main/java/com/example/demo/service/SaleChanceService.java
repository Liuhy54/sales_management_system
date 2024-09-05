package com.example.demo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.dao.SaleChanceDao;
import com.example.demo.pojo.SaleChance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaleChanceService {
    @Autowired
    SaleChanceDao saleChanceDao;
    //查询销售机会表的所有信息
    public List<SaleChance> getSaleList() {
        List<SaleChance> saleChances = saleChanceDao.selectList(null);
        return saleChances;
    }

//    查询某一页的所有客户信息
    //需要 页码、每页显示的数量
    public IPage<SaleChance> getOnePage(Integer currentPage, Integer limit){
        Page<SaleChance> salePage = new Page<>(currentPage,limit); //每页显示limit条数据，当前第currentPage页
        //调用分页查寻方法
        saleChanceDao.selectPage(salePage,null);
        return salePage;
    }

//    修改数据

    public boolean updateSale(SaleChance saleChance) {
        int i = saleChanceDao.updateById(saleChance);
        return i > 0;
    }

    //    添加数据

    public boolean addSale(SaleChance saleChance) {
        int i = saleChanceDao.insert(saleChance);
        return i > 0;//添加成功
    }

    //    删除数据

    public boolean delSale(SaleChance saleChance) {
        int i = saleChanceDao.deleteById(saleChance);
        return i > 0;//删除成功
    }
}
