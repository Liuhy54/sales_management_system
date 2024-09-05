package com.example.demo.dao;

import com.example.demo.pojo.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author gxm
 * @since 2024-06-12
 */
@Mapper
public interface UserDao extends BaseMapper<User> {

}
