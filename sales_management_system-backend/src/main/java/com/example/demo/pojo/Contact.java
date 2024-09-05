package com.example.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zjs
 * @since 2024-06-11
 */
@TableName("t_contact")
public class Contact implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "con_id", type = IdType.AUTO)
    private Integer conId;

    /**
     * 联系人名字
     */
        private String conName;

    /**
     * 联系人性别
     */
    private String conSex;

    /**
     * 联系人职位
     */
    private String conJob;

    /**
     * 办公电话
     */
    private String conTel;

    /**
     * 联系人手机号
     */
    private String conPhone;

    /**
     * 备注
     */
    private String conNote;

    /**
     * 客户编号
     */
    private Integer cusId;

    public Integer getConId() {
        return conId;
    }

    public void setConId(Integer conId) {
        this.conId = conId;
    }

    public String getConName() {
        return conName;
    }

    public void setConName(String conName) {
        this.conName = conName;
    }

    public String getConSex() {
        return conSex;
    }

    public void setConSex(String conSex) {
        this.conSex = conSex;
    }

    public String getConJob() {
        return conJob;
    }

    public void setConJob(String conJob) {
        this.conJob = conJob;
    }

    public String getConTel() {
        return conTel;
    }

    public void setConTel(String conTel) {
        this.conTel = conTel;
    }

    public String getConPhone() {
        return conPhone;
    }

    public void setConPhone(String conPhone) {
        this.conPhone = conPhone;
    }

    public String getConNote() {
        return conNote;
    }

    public void setConNote(String conNote) {
        this.conNote = conNote;
    }

    public Integer getCusId() {
        return cusId;
    }

    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }

    @Override
    public String toString() {
        return "Contact{" +
        "conId = " + conId +
        ", conName = " + conName +
        ", conSex = " + conSex +
        ", conJob = " + conJob +
        ", conTel = " + conTel +
        ", conPhone = " + conPhone +
        ", conNote = " + conNote +
        ", cusId = " + cusId +
        "}";
    }
}
