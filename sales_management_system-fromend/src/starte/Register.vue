<template>
  <div>
    <el-card class="box-card">
      <h2>注册</h2>
      <el-form
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-position="left"
        label-width="80px"
        class="demo-ruleForm"
      >
        <el-form-item
          label="用户名"
          prop="uname"
        >
          <el-input v-model="ruleForm.uname"></el-input>
        </el-form-item>
        <el-form-item
          label="密码"
          prop="password"
        >
          <el-input
            type="password"
            v-model="ruleForm.password"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item
          label="确认密码"
          prop="confirmPassword"
        >
          <el-input
            type="password"
            v-model="ruleForm.confirmPassword"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="用户职位">
          <el-select
            v-model="ruleForm.rId"
            placeholder="选择职位"
          >
            <el-option
              label="销售主管"
              value="1"
            />
            <el-option
              label="客户经理"
              value="2"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div class="btnGroup">
        <el-button
          type="primary"
          @click="submitForm('ruleForm')"
          v-loading="loading"
        >提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
        <el-button @click="goBack">返回</el-button>
      </div>
    </el-card>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data () {
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.ruleForm.checkPass !== "") {
          this.$refs.ruleForm.validateField("checkPass");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.ruleForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    var validatePass3 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请选择用户职位"));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        uname: "",
        password: "",
        confirmPassword: "",
        rId: "1"
      },
      rules: {
        uname: [
          { required: true, message: "用户名不能为空！", trigger: "blur" },
        ],
        password: [{ required: true, validator: validatePass, trigger: "blur" }],
        confirmPassword: [
          { required: true, validator: validatePass2, trigger: "blur" },
        ],
        rId: [{ required: true, validator: validatePass3, trigger: "change" }]
      },
      loading: false
    };
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        this.loading = true;  // 提交按钮显示加载动画
        if (valid) {
          let _this = this;
          axios({     // axios 向后端发起请求
            url: "http://localhost:8080/user/register",  // 请求地址
            method: "get",             // 请求方法
            headers: {                  // 请求头
              "Content-Type": "application/json",
            },
            params: {
              uname: _this.ruleForm.uname,
              password: _this.ruleForm.password,
              rId: _this.ruleForm.rId,
            },
          }).then((res) => { // 当收到后端的响应时执行该括号内的代码，res 为响应信息，也就是后端返回的信息
            if (res.data.code === 1) {  // 当响应的编码为 1 时，说明注册成功
              this.$message({
                message: res.data.msg,
                type: "success",
              });
              _this.$router.push('/');  // 注册成功后跳转到登录界面

            } else {  // 当响应的编码不为 1 时，说明注册失败
              this.$message({
                message: res.data.msg,
                type: "warning",
              });
            }
            // 不管响应成功还是失败，收到后端响应的消息后就不再让登录按钮显示加载动画了
            _this.loading = false;
            console.log(res);
          });
        } else { // 如果账号或密码有一个没填，就直接提示必填，不向后端请求
          console.log("error submit!!");
          this.loading = false;
          return false;
        }
      });
    },
    resetForm (formName) {
      this.$refs[formName].resetFields();
    },
    goBack () {
      this.$router.go(-1);
    },
  },
};
</script>

<style scoped>
/* 设置登录面板居中，宽度为400px */
.box-card {
  margin: auto auto;
  width: 400px;
}

/* 设置登录面板中的表单居中 */
.login-from {
  margin: auto auto;
}
</style>