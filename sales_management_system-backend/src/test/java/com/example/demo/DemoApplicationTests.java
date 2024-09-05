package com.example.demo;

import com.example.demo.dao.CustomerDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class DemoApplicationTests {

    @Autowired
    private CustomerDao customerDao;

    @Test
    void contextLoads() {

        customerDao.selectList(null).forEach(System.out::println);
    }

}
