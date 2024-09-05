<script setup>
import axios from 'axios';
import { ElMessage } from 'element-plus';
import { reactive } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

const form = reactive({
  uname: "",
  password: "",
})

//提交按钮
const submitForm = () => {
  axios({
    method: 'get',
    url: 'http://localhost:8080/user/login',
    params: {
      uname: form.uname,
      password: form.password,
    }
  }).then(res => {
    if (res.data.msg == "用户不存在") {
      //查询失败，没有找到用户
      ElMessage({
        message: res.data.msg,
        type: 'error'
      })
    } else if (res.data.msg == "密码错误") {
      //查询失败，密码错误
      ElMessage({
        message: res.data.msg,
        type: 'error'
      })
    } else {
      ElMessage({
        message: res.data.msg,
        type: 'success'
      });
      //登录成功，保存用户信息
      localStorage.setItem('uid', res.data.user.uId)
      localStorage.setItem('rid', res.data.user.rId)
      localStorage.setItem('uname', res.data.user.uname);

      //通过Router跳转到首页
      // router.push('/saleChance');
      router.push({ path: '/saleChance', query: { name: form.uname } })
      console.log(form.uname);
    }
  })
}

</script>

<template>
  <div>
    <el-card class="box-card">
      <h2>登录</h2>
      <el-form
        :model="form"
        status-icon
        ref="ruleForm"
        label-position="left"
        label-width="70px"
        class="login-from"
      >
        <el-form-item label="用户名">
          <el-input
            v-model="form.uname"
            autocomplete="off"
          />
        </el-form-item>
        <el-form-item label="密码">
          <el-input
            type="password"
            v-model="form.password"
            autocomplete="off"
          />
        </el-form-item>
      </el-form>
      <div class="btnGroup">
        <el-button
          type="primary"
          @click="submitForm('ruleForm')"
          v-loading="loading"
        >登录
        </el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
        <router-link to="/register">
          <el-button style="margin-left: 10px">注册</el-button>
        </router-link>
      </div>
    </el-card>
  </div>
</template>



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