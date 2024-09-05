package com.example.demo.controller;

import com.example.demo.pojo.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lsy
 * @since 2024-06-11
 */
@CrossOrigin
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //处理登录请求
    @RequestMapping("/login")
    public Map<String,Object> login(String uname, String password) {
        HashMap<String,Object> map = new HashMap<>();

        if(userService.selectUser(uname)){
            User user =  userService.getUser(uname,password);
            if (user == null) {
                map.put("msg","密码错误");
            } else {
                map.put("msg","登录成功");
                map.put("user",user);
            }
        } else {
            map.put("msg","用户不存在");
        }

        return map;
    }

    @RequestMapping("/getUserId")
    public Map<String,Object> getUserId(Integer rId) {
        Boolean flag =  userService.getUserById(rId);

        HashMap<String,Object> map = new HashMap<>();

        if (flag) {
            map.put("code1", 0);
            map.put("msg","指派成功");
        } else {
            map.put("code1", 1);
            map.put("msg","该id用户不存在");
        }

        return map;
    }

    @RequestMapping("/register")
    public Map<String, Object> register(String uname, String password, int rId) {

        //创建map存放数据并抛出
        HashMap<String,Object> map = new HashMap<>();

        //先判断注册的用户是否已经存在
        Boolean flag = userService.selectUser(uname);
        if (flag) {
            //如果注册用户已经存在，则抛出错误
            map.put("msg","注册失败，用户已存在");
            map.put("code",0);
        } else {
            //反之，将注册用户添加到数据库
            userService.createUser(uname,password,rId);

            map.put("msg","注册成功");
            map.put("code",1);

        }

        return map;
    }
}
