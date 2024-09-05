package com.example.demo.dao;

import com.example.demo.pojo.Contact;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.sql.SQLOutput;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zjs
 * @since 2024-06-11
 */
@Mapper
public interface ContactDao extends BaseMapper<Contact> {

    @Select("select * from t_contact where cus_id=#{customerId}")
    Contact selectName(Integer customerId);
}
