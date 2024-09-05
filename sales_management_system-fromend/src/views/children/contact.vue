<template>
  <el-button
    style="width:100%"
    @click="add"
  >
    添加数据
  </el-button>
  <el-table
    :data="state.tableData"
    style="width: 100%"
  >
    <el-table-column
      fixed
      prop="conId"
      label="联系人id"
      width="100"
    />
    <el-table-column
      prop="conName"
      label="联系人名字"
      width="100"
    />
    <el-table-column
      prop="conSex"
      label="联系人性别"
      width="100"
    />
    <el-table-column
      prop="conJob"
      label="联系人职位"
      width="100"
    />
    <el-table-column
      prop="conTel"
      label="办公电话"
      width="100"
    />
    <el-table-column
      prop="conPhone"
      label="联系人手机号"
      width="150"
    />
    <el-table-column
      prop="conNote"
      label="备注"
      width="80"
    />
    <el-table-column
      prop="cusId"
      label="客户编号"
      width="100"
    />
    <el-table-column
      fixed="right"
      label="操作"
      width="140"
    >
      <template #default="scope">
        <el-button
          size="small"
          @click="dialogFormVisible(scope.$index, scope.row)"
        >
          编辑
        </el-button>
        <el-button
          size="small"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)"
        >
          删除
        </el-button>
      </template>
    </el-table-column>
  </el-table>
  <el-dialog
    v-model="state.dialogFormVisible3"
    title=" 提示"
    width="500"
  >
    <span>确定删除该条数据吗？</span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="state.dialogFormVisible3 = false">取消</el-button>
        <el-button
          type="primary"
          @click="submit3"
        >
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog
    v-model="state.dialogFormVisible"
    title="编辑客户信息"
    width="500"
    draggable
  >
    <el-form :model="state.form">
      <el-form-item
        label="联系人id"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusId"
          autocomplete="off"
          disabled
        />
      </el-form-item>
      <el-form-item
        label="联系人姓名"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conName"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="性别"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conSex"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="职位"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conJob"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="办公电话"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conTel"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="手机号"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conPhone"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="备注"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conNote"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户编号"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusId"
          autocomplete="off"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button
          type="primary"
          @click="state.dialogFormVisible = false"
        >
          返回
        </el-button>
        <el-button
          type="primary"
          @click="submit()"
        >
          保存
        </el-button>
      </div>
    </template>
  </el-dialog>
  <el-dialog
    v-model="state.dialogFormVisible2"
    title="新增客户信息"
    width="500"
    draggable
  >
    <el-form :model="state.form">
      <el-form-item
        label="联系人id"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusId"
          autocomplete="off"
          disabled
        />
      </el-form-item>
      <el-form-item
        label="联系人姓名"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conName"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="性别"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conSex"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="职位"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conJob"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="办公电话"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conTel"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="手机号"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conPhone"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="备注"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.conNote"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户id"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusId"
          autocomplete="off"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button
          type="primary"
          @click="state.dialogFormVisible2 = false"
        >
          返回
        </el-button>
        <el-button
          type="primary"
          @click="submit2()"
        >
          提交
        </el-button>
      </div>
    </template>
  </el-dialog>
  <div class="demo-pagination-block">
    <el-pagination
      v-model:current-page="state.currentPage4"
      v-model:page-size="state.pageSize4"
      :page-sizes="[5, 10, 15, 20]"
      layout="total, sizes, prev, pager, next, jumper"
      :total="state.count"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />
  </div>
</template>
<script lang="ts" setup>
import { useRoute } from "vue-router";
import axios from "axios"; //请求服务器模块
import { ElMessage, formatter } from "element-plus"; //ep框架消息提示模块
import { column } from "element-plus/es/components/table-v2/src/common";
import { reactive } from "vue"; //响应式
import { ref } from "vue";

const formLabelWidth = "140px";
// 获取当前路由对象
const route = useRoute();
//定义响应式对象
const state = reactive({
  tableData: [],
  count: 200,
  currentPage4: 1,
  pageSize4: 5,
  dialogFormVisible: false, //编辑按钮隐藏
  dialogFormVisible2: false, //新增按钮隐藏
  dialogFormVisible3: false, //删除按钮隐藏
  form: {
    //修改操作用来获取数据
    conId: "",
    conName: "",
    conSex: "",
    conJob: "",
    conTel: "",
    conPhone: "",
    conNote: "",
    cusId: "",
  },
  customerId: route.query.id || null, // 从查询参数中获取 id，并赋值给 customerId,
});

// console.log(state.customerId);

//查询数据
axios({
  method: "get",
  url: "http://localhost:8080/contact/getPage",
  params: {
    id: state.customerId,
    currentPage: state.currentPage4,
    limit: state.pageSize4,
  },
}).then((res) => {
  // console.log(res);
  console.log(res.data); //获取请求后端服务器返回到的值
  if (res.data.code != 0) {
    // ElMessage.error('Oops, this is a error message.')
  } else {
    //消息提示
    ElMessage({
      message: res.data.msg,
      type: "success",
    });
    state.tableData = res.data.data; //将查询到的数据赋值到响应式对象里
    state.count = res.data.count;
    // console.log(state.tableData[0]);
  }
});

//绑定页码切换功能
const handleSizeChange = (val: number) => {
  // console.log(`${val} items per page`)//每页显示条数
  axios({
    method: "get",
    url: "http://localhost:8080/customer/getPage",
    params: {
      id: state.customerId,
      currentPage: state.currentPage4,
      limit: val,
    },
  }).then((res) => {
    // console.log(res);
    // console.log(res.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      // ElMessage.error('Oops, this is a error message.')
    } else {
      //消息提示
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.tableData = res.data.data; //将查询到的数据赋值到响应式对象里
      state.count = res.data.count;
    }
  });
};
const handleCurrentChange = (val: number) => {
  // console.log(`current page: ${val}`)//页码变化
  state.pageSize4;
  pagequery(val);
};
const pagequery = (val: number) => {
  axios({
    method: "get",
    url: "http://localhost:8080/contact/getPage",
    params: {
      id: state.customerId,
      currentPage: val,
      limit: state.pageSize4,
    },
  }).then((res) => {
    // // console.log(res);
    // console.log(res.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      // ElMessage.error('Oops, this is a error message.')
    } else {
      //消息提示
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.tableData = res.data.data; //将查询到的数据赋值到响应式对象里
      state.count = res.data.count;
    }
  });
};

//编辑提交
const submit = () => {
  //请求访问修改接口
  axios({
    method: "get",
    url: "http://localhost:8080/contact/updateCon",
    params: state.form,
  }).then((res) => {
    // console.log(res);
    //   console.log(res.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      ElMessage.error(res.data.msg); //请求服务器响应式失败
    } else {
      //消息提示
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.dialogFormVisible = false; //点击修改按钮，隐藏对话框
      // state.tableData = res.data.data//将查询到的数据赋值到响应式对象里
      // state.count = res.data.count
      axios({
        method: "get",
        url: "http://localhost:8080/contact/getPage",
        params: {
          id: state.customerId,
          currentPage: state.currentPage4,
          limit: state.pageSize4,
        },
      }).then((res) => {
        // console.log(res);
        //console.log(res.data);//获取请求后端服务器返回到的值
        if (res.data.code != 0) {
          // ElMessage.error('Oops, this is a error message.')
        } else {
          //消息提示
          ElMessage({
            message: res.data.msg,
            type: "success",
          });
          state.tableData = res.data.data; //将查询到的数据赋值到响应式对象里
          // state.count = res.data.count;
        }
      });
    }
  });
};
//新增提交
const submit2 = () => {
  //请求访问修改接口
  axios({
    method: "get",
    url: "http://localhost:8080/contact/addCon",
    params: state.form,
  }).then((res) => {
    // console.log(res);
    //   console.log(res.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      ElMessage.error(res.data.msg); //请求服务器响应式失败
    } else {
      //消息提示
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.dialogFormVisible2 = false; //点击修改按钮，隐藏对话框
      // state.tableData = res.data.data//将查询到的数据赋值到响应式对象里
      // state.count = res.data.count
      axios({
        method: "get",
        url: "http://localhost:8080/contact/getPage",
        params: {
          id: state.customerId,
          currentPage: state.currentPage4,
          limit: state.pageSize4,
        },
      }).then((res) => {
        // console.log(res);
        //console.log(res.data);//获取请求后端服务器返回到的值
        if (res.data.code != 0) {
          // ElMessage.error('Oops, this is a error message.')
        } else {
          //消息提示
          ElMessage({
            message: res.data.msg,
            type: "success",
          });
          state.tableData = res.data.data; //将查询到的数据赋值到响应式对象里
          state.count = res.data.count;
        }
      });
    }
  });
};
//删除提交
const submit3 = () => {
  //请求访问修改接口
  axios({
    method: "get",
    url: "http://localhost:8080/contact/deleteCon",
    params: state.form,
  }).then((res) => {
    // console.log(res);
    //   console.log(res.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      ElMessage.error(res.data.msg); //请求服务器响应式失败
    } else {
      //消息提示
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.dialogFormVisible3 = false; //点击确定按钮，隐藏对话框
      // state.tableData = res.data.data//将查询到的数据赋值到响应式对象里
      // state.count = res.data.count
      axios({
        method: "get",
        url: "http://localhost:8080/contact/getPage",
        params: {
          id: state.customerId,
          currentPage: state.currentPage4,
          limit: state.pageSize4,
        },
      }).then((res) => {
        // console.log(res);
        //console.log(res.data);//获取请求后端服务器返回到的值
        if (res.data.code != 0) {
          // ElMessage.error('Oops, this is a error message.')
        } else {
          //消息提示
          ElMessage({
            message: res.data.msg,
            type: "success",
          });
          state.tableData = res.data.data; //将查询到的数据赋值到响应式对象里
          state.count = res.data.count;
        }
      });
    }
  });
};

//新增按钮
const add = (index, row) => {
  state.dialogFormVisible2 = true;
};
//修改按钮
const dialogFormVisible = (index, row) => {
  state.dialogFormVisible = true; //点击修改按钮，出现对话框
  state.form = row;
};
//删除按钮
const handleDelete = (index, row) => {
  state.dialogFormVisible3 = true;
  state.form = row;
};
</script>