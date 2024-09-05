<template> <el-button
    style="width: 100%"
    @click="add"
  >添加</el-button>
  <el-table
    :data="state.tableData"
    style="width: 100%"
  >
    <el-table-column
      fixed
      prop="scId"
      label="机会编号"
      width="150"
    />
    <el-table-column
      prop="scCusname"
      label="客户名称"
      width="120"
    />
    <el-table-column
      prop="scComming"
      label="机会来源"
      width="120"
      :formatter="fscComming"
    />
    <el-table-column
      prop="scName"
      label="联系人"
      width="120"
    />
    <el-table-column
      prop="scPhone"
      label="联系电话"
      width="120"
    />
    <el-table-column
      prop="scSuccess"
      label="成功几率"
      width="120"
    />
    <el-table-column
      prop="scMessage"
      label="概要"
      width="120"
    />
    <el-table-column
      prop="scDesc"
      label="机会描述"
      width="120"
    />
    <el-table-column
      prop="scCreateuserid"
      label="创建人编号"
      width="120"
    />
    <el-table-column
      prop="scCreatetime"
      label="创建时间"
      width="120"
    />
    <el-table-column
      prop="scGiveuserid"
      label="指派给谁"
      width="120"
    />
    <el-table-column
      prop="scGivetime"
      label="指派时间"
      width="120"
    />
    <el-table-column
      prop="scStatus"
      label="状态"
      width="120"
    />

    <!-- 按钮 -->
    <el-table-column
      fixed="right"
      label="操作"
      width="200"
    >
      <template #default="scope">
        <el-button
          size="small"
          type="danger"
          @click="handleAssign(scope.$index, scope.row)"
        >
          指派
        </el-button>
        <el-button
          size="small"
          @click="handleEdit(scope.$index, scope.row)"
        >
          修改
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
    v-model="state.dialogVisible"
    title="Tips"
    width="500"
    :before-close="state.handleClose"
  >
    <span>你确定删除这个机会吗？</span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="state.dialogVisible = false">Cancel</el-button>
        <el-button
          type="primary"
          @click="delSubimit"
        >
          Confirm
        </el-button>
      </div>
    </template>
  </el-dialog>
  <!-- 分页 -->
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

  <!-- 弹出指派表单 -->
  <el-dialog
    v-model="state.dialogFormVisible3"
    title="指派销售机会信息"
    width="500"
  >
    <el-form :model="state.form">
      <el-form-item
        label="指派人id"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scGiveuserid"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="指派时间"
        :label-width="formLabelWidth"
      >
        <el-date-picker
          v-model="state.form.scGivetime"
          type="datetime"
          placeholder="Select date and time"
          value-format="YYYY-MM-DD hh:mm:ss"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="state.dialogFormVisible3 = false">取消</el-button>
        <el-button
          type="primary"
          @click="Submit3()"
        >
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>

  <!-- 弹出修改表单 -->
  <el-dialog
    v-model="state.dialogFormVisible"
    title="修改销售机会信息"
    width="500"
  >
    <el-form :model="state.form">
      <el-form-item
        label="销售机会id"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scId"
          autocomplete="off"
          disabled
        />
      </el-form-item>
      <el-form-item
        label="客户名称"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scCusname"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="机会来源"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.scComming"
          placeholder="请选择"
        >
          <el-option
            label="促销"
            value=0
          />
          <el-option
            label="广告"
            value=1
          />
          <el-option
            label="搜索引擎"
            value=2
          />
          <el-option
            label="线上咨询"
            value=3
          />
          <el-option
            label="电话咨询"
            value=4
          />
          <el-option
            label="邮件咨询"
            value=5
          />
          <el-option
            label="客户介绍"
            value=6
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="联系人"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scName"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="联系电话"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scPhone"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="成功率（%）"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scSuccess"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="概要"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scMessage"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="机会描述"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scDesc"
          autocomplete="off"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="state.dialogFormVisible = false">取消</el-button>
        <el-button
          type="primary"
          @click="Submit(),state.dialogFormVisible = false"
        >
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>

  <!-- 弹出添加表单 -->
  <el-dialog
    v-model="state.dialogFormVisible2"
    title="添加销售机会信息"
    width="500"
  >
    <el-form :model="state.form">
      <el-form-item
        label="客户名称"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scCusname"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="机会来源"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.scComming"
          placeholder="请选择"
        >
          <el-option
            label="促销"
            value=0
          />
          <el-option
            label="广告"
            value=1
          />
          <el-option
            label="搜索引擎"
            value=2
          />
          <el-option
            label="线上咨询"
            value=3
          />
          <el-option
            label="电话咨询"
            value=4
          />
          <el-option
            label="邮件咨询"
            value=5
          />
          <el-option
            label="客户介绍"
            value=6
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="联系人"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scName"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="联系电话"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scPhone"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="成功率（%）"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scSuccess"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="概要"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scMessage"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="机会描述"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.scDesc"
          autocomplete="off"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="state.dialogFormVisible2 = false">取消</el-button>
        <el-button
          type="primary"
          @click="Submit2(),state.dialogFormVisible2 = false"
        >
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>
  


  <script lang="ts" setup>
import axios from "axios"; //请求服务器的模块

import { ElMessage, ElMessageBox } from "element-plus"; //ep框架信息

import { reactive, ref } from "vue"; //响应式数据
const handleClick = () => {
  console.log("click");
};

//定义一个响应对象
const state = reactive({
  tableData: [],
  count: 200,
  currentPage4: 1,
  pageSize4: 5,
  dialogFormVisible: false,
  dialogFormVisible2: false,
  dialogFormVisible3: false,
  dialogVisible: false,
  handleClose: false,
  form: {
    scId: "",
    scCusname: "",
    scComming: "",
    scName: "",
    scPhone: "",
    scSuccess: "",
    scMessage: "",
    scDesc: "",
    scGiveuserid: "",
    scGivetime: "",
    scCreatetime: "",
    scCreateuserid: "",
    scStatus: 0,
  },
  oneRow: {},
});

// console.log(localStorage.getItem("uid"));
// console.log(localStorage.getItem("rid"));
// console.log(localStorage.getItem("uname"));

state.form.scCreateuserid = localStorage.getItem("uid"); //获取当前登录用户的id
const rId = localStorage.getItem("rid"); //获取当前登录用户的角色权限
const uIame = localStorage.getItem("uname"); //获取当前登录用户的用户名

//新增按钮
const add = () => {
  state.dialogFormVisible2 = true;
};

//格式化表格列数据
const fscComming = (row, column, cellValue, index) => {
  // console.log(row, column, cellValue, index);
  let res = ""; //用于存储返回的结果
  switch (cellValue) {
    case 0:
      res = "促销";
      break;
    case 1:
      res = "广告";
      break;
    case 2:
      res = "搜索引擎";
      break;
    case 3:
      res = "线上咨询";
      break;
    case 4:
      res = "电话咨询";
      break;
    case 5:
      res = "邮件咨询";
      break;
    case 6:
      res = "客户介绍";
      break;
  }
  return res;
};
//修改和功能
const handleEdit = (index, row) => {
  //console.log(row);
  if (row.scStatus == 0) {
    state.dialogFormVisible = true; //弹出修改表单
    state.form = row; //将当前行的数据赋值给表单
    //格式化机会来源
    switch (state.form.scComming) {
      case 0:
        state.form.scComming = "促销";
        break;
      case 1:
        state.form.scComming = "广告";
        break;
      case 2:
        state.form.scComming = "搜索引擎";
        break;
      case 3:
        state.form.scComming = "线上咨询";
        break;
      case 4:
        state.form.scComming = "电话咨询";
        break;
      case 5:
        state.form.scComming = "邮件咨询";
        break;
      case 6:
        state.form.scComming = "客户介绍";
        break;
    }
  } else {
    ElMessage.error("该机会已指派，无法修改！");
  }
};

//指派按钮
const handleAssign = (index, row) => {
  if (rId == 1) {
    state.dialogFormVisible3 = true; //弹出指派提示框
    state.form = row; //将当前行的数据赋值给表单
    state.form.scStatus = 1; //将状态设置为1，表示已指派
  } else {
    ElMessage.error("只有销售主管才能指派销售机会！");
  }
};

//提交修改的功能
const Submit = () => {
  switch (state.form.scComming) {
    case "促销":
      state.form.scComming = 0;
      break;
    case "广告":
      state.form.scComming = 1;
      break;
    case "搜索引擎":
      state.form.scComming = 2;
      break;
    case "线上咨询":
      state.form.scComming = 3;
      break;
    case "电话咨询":
      state.form.scComming = 4;
      break;
    case "邮件咨询":
      state.form.scComming = 5;
      break;
    case "客户介绍":
      state.form.scComming = 6;
      break;
  }
  //请求访问修改接口
  axios({
    method: "get",
    url: "http://localhost:8080/saleChance/updateSale",
    params: state.form,
  }).then((res) => {
    if (res.data.code != 0) {
      //失败
      ElMessage.error(res.data.msg);
    } else {
      //成功
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.dialogFormVisible = false; //隐藏对话框
      //刷新页面
      axios({
        method: "get",
        url: "http://localhost:8080/saleChance/getPage",

        params: {
          currentPage: state.currentPage4,
          limit: state.pageSize4,
        },
      }).then((res) => {
        //console.log(res.data);
        if (res.data.code != 0) {
          //失败
        } else {
          //成功
          ElMessage({
            message: res.data.msg,
            type: "success",
          });
          state.tableData = res.data.data;
          state.count = res.data.count;
        }
      });
    }
  });
};

//提交指派的功能
const Submit3 = () => {
  if (state.form.scGiveuserid != "" && state.form.scGivetime != null) {
    //判断是否填写了指派人id和指派时间
    axios({//查询用户id是否存在
      method: "get",
      url: "http://localhost:8080/user/getUserId",
      params: {
        rId: state.form.scGiveuserid,
      },
    }).then((res) => {
      if (res.data.code1 != 0) {
        //失败
        ElMessage.error(res.data.msg);
      } else {
        //成功
        switch (state.form.scComming) {
          case "促销":
            state.form.scComming = 0;
            break;
          case "广告":
            state.form.scComming = 1;
            break;
          case "搜索引擎":
            state.form.scComming = 2;
            break;
          case "线上咨询":
            state.form.scComming = 3;
            break;
          case "电话咨询":
            state.form.scComming = 4;
            break;
          case "邮件咨询":
            state.form.scComming = 5;
            break;
          case "客户介绍":
            state.form.scComming = 6;
            break;
        }
        //请求访问修改接口
        axios({
          method: "get",
          url: "http://localhost:8080/saleChance/updateSale",
          params: state.form,
        }).then((res) => {
          if (res.data.code != 0) {
            //失败
            ElMessage.error(res.data.msg);
          } else {
            //成功
            ElMessage({
              message: res.data.msg,
              type: "success",
            });
            state.dialogFormVisible = false;
            //刷新页面
            axios({
              method: "get",
              url: "http://localhost:8080/saleChance/getPage",

              params: {
                currentPage: state.currentPage4,
                limit: state.pageSize4,
              },
            }).then((res) => {
              if (res.data.code != 0) {
                //失败
              } else {
                //成功
                ElMessage({
                  message: res.data.msg,
                  type: "success",
                });
                state.tableData = res.data.data;
                state.count = res.data.count;
                state.dialogFormVisible3 = false; //隐藏对话框
              }
            });
          }
        });
      }
    });
  } else {
    ElMessage.error("完整填写指派人id和指派时间！");
  }
};

// 删除的功能
const handleDelete = (index, row) => {
  //console.log(index, row);
  if (row.scStatus == 0) {//是否指派
    if (row.scCreateuserid == state.form.scCreateuserid) {
      //是否是自己创建的机会
      console.log(row.scCreateuserid);
      state.dialogVisible = true; //弹出删除提示框
      state.oneRow = row;
    } else {
      ElMessage.error("只能删除自己创建的机会！");
    }
  } else {
    ElMessage.error("该机会已指派，无法删除！");
  }
};

//删除按钮弹出框的确定
const delSubimit = () => {
  ElMessageBox.confirm("你真的确定删除这个机会吗?")
    .then(() => {
      //点击确定按钮
      //请求访问删除接口
      axios({
        method: "get",
        url: "http://localhost:8080/saleChance/delSale",
        params: state.oneRow,
      }).then((res) => {
        //console.log(res.data); //获取到请求后端服务器返回到的值
        if (res.data.code != 0) {
          //   //证明请求服务器响应失败
          ElMessage.error(res.data.msg);
        } else {
          //   //查询成功
          //   // 消息提示
          ElMessage({
            message: res.data.msg,
            type: "success",
          });
          state.dialogVisible = false; //点击了修改按钮，隐藏对话框
          // state.tableData = res.data.data; //将查询到的数据赋值到响应式对象里
          //刷新数据
          axios({
            method: "get",
            url: "http://localhost:8080/saleChance/getPage",
            params: {
              currentPage: state.currentPage4,
              limit: state.pageSize4,
            },
          }).then((res) => {
            // console.log(res.data); //获取到请求后端服务器返回到的值
            if (res.data.code != 0) {
              //证明请求服务器响应失败
              // ElMessage.error(res.data.msg)
            } else {
              //查询成功
              // 消息提示
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
    })
    .catch(() => {
      //点击取消按钮
      state.dialogVisible = false;
    });
};

//提交新增的功能
const Submit2 = () => {
  //console.log(state.form);
  switch (state.form.scComming) {
    case "促销":
      state.form.scComming = 0;
      break;
    case "广告":
      state.form.scComming = 1;
      break;
    case "搜索引擎":
      state.form.scComming = 2;
      break;
    case "线上咨询":
      state.form.scComming = 3;
      break;
    case "电话咨询":
      state.form.scComming = 4;
      break;
    case "邮件咨询":
      state.form.scComming = 5;
      break;
    case "客户介绍":
      state.form.scComming = 6;
      break;
  }
  //请求访问修改接口
  axios({
    method: "get",
    url: "http://localhost:8080/saleChance/addSale",
    params: state.form,
  }).then((res) => {
    //console.log(res.data);
    if (res.data.code != 0) {
      //失败
      ElMessage.error(res.data.msg);
    } else {
      //成功
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.dialogFormVisible = false;
      //刷新页面
      axios({
        method: "get",
        url: "http://localhost:8080/saleChance/getPage",

        params: {
          currentPage: state.currentPage4,
          limit: state.pageSize4,
        },
      }).then((res) => {
        //console.log(res.data);
        if (res.data.code != 0) {
          //失败
        } else {
          //成功
          ElMessage({
            message: res.data.msg,
            type: "success",
          });
          state.tableData = res.data.data;
          state.count = res.data.count;
        }
      });
    }
  });
};
//样式
const formLabelWidth = "140px";

//首次请求数据
axios({
  method: "get",
  url: "http://localhost:8080/saleChance/getPage",

  params: {
    currentPage: 1,
    limit: 5,
  },
}).then((res) => {
  if (res.data.code != 0) {
    //失败
  } else {
    //成功
    ElMessage({
      message: res.data.msg,
      type: "success",
    });
    state.tableData = res.data.data;
    state.count = res.data.count;
  }
});

//绑定页码切换的功能
const handleSizeChange = (res) => {
  state.pageSize4 = res;
  //只要执行了当前的功能，才会运行下方的请求数据
  axios({
    method: "get",
    url: "http://localhost:8080/saleChance/getPage",

    params: {
      currentPage: state.currentPage4,
      limit: state.pageSize4,
    },
  }).then((res) => {
    if (res.data.code != 0) {
      //失败
    } else {
      //成功
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.tableData = res.data.data;
      state.count = res.data.count;
    }
  });
};

//绑定页码选择的功能
const handleCurrentChange = (res) => {
  state.currentPage4 = res;
  //只要执行了当前的功能，才会运行下方的请求数据
  axios({
    method: "get",
    url: "http://localhost:8080/saleChance/getPage",

    params: {
      currentPage: state.currentPage4,
      limit: state.pageSize4,
    },
  }).then((res) => {
    //console.log(res.data);
    if (res.data.code != 0) {
      //失败
    } else {
      //成功
      ElMessage({
        message: res.data.msg,
        type: "success",
      });
      state.tableData = res.data.data;
      state.count = res.data.count;
    }
  });
};
</script>
  