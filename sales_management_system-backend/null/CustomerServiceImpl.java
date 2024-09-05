package com.example.demo.service.impl;

import com.example.demo.pojo.Customer;
import com.example.demo.dao.CustomerDao;
import com.example.demo.service.ICustomerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gxm
 * @since 2024-06-07
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerDao, Customer> implements ICustomerService {

}
