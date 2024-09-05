package com.example.demo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.pojo.Customer;
import com.example.demo.pojo.Report;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author zjs
 * @since 2024-06-07
 */
@Mapper
public interface CustomerDao extends BaseMapper<Customer> {
    @Select("SELECT COUNT(*)num,cus_level item FROM t_customer GROUP BY cus_level")
    public List<Report> countByLevel();

    @Select("SELECT COUNT(*)num,cus_region item FROM t_customer GROUP BY cus_region")
    public List<Report> countByRegion();

    @Select("SELECT COUNT(*)num,cus_industry item FROM t_customer GROUP BY cus_industry")
    public List<Report> countByIndustry();
}
