package com.example.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.dao.UserDao;
import com.example.demo.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserDao userDao;

    //获取用户信息
    public User getUser(String uname, String password) {
        //构造查询条件
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();

        userQueryWrapper.eq("u_name",uname).eq("u_password",password);

        //将查询条件作为参数传入查询方法
        return userDao.selectOne(userQueryWrapper);
    }

    //判断表中是否存在某用户
    public Boolean selectUser(String uname) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("u_name",uname);

        if(userDao.selectOne(userQueryWrapper) != null)
            return true;
        else
            return false;
    }

    //rId判断表中是否存在某用户
    public Boolean getUserById(int rId) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("u_id",rId);

        if(userDao.selectOne(userQueryWrapper) != null)
            return true;
        else
            return false;
    }


    //新增用户信息
    public void createUser(String uname, String password, int rId) {
        User user = new User();
        user.setrId(rId);
        user.setuName(uname);
        user.setuPassword(password);
        userDao.insert(user);

    }
}