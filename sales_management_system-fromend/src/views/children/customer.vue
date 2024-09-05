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
      prop="cusId"
      label="客户编号"
      width="100"
    />
    <el-table-column
      prop="cusName"
      label="客户名称"
      width="100"
    />
    <el-table-column
      prop="cusRegion"
      label="客户地区"
      width="100"
      :formatter="fcusRegion"
    />
    <el-table-column
      prop="cusIndustry"
      label="客户行业"
      width="100"
      :formatter="fcusIndustry"
    />
    <el-table-column
      prop="cusLevel"
      label="客户等级"
      width="100"
      :formatter="fcusLevel"
    />
    <el-table-column
      prop="cusSatisfy"
      label="客户满意度"
      width="100"
      :formatter="fcusSatisfy"
    />
    <el-table-column
      prop="cusCredit"
      label="客户信用度"
      width="100"
      :formatter="fcusCredit"
    />
    <el-table-column
      prop="cusAddr"
      label="客户地址"
      width="150"
    />
    <el-table-column
      prop="cusZipcode"
      label="客户邮编"
      width="100"
    />
    <el-table-column
      prop="cusPhone"
      label="客户电话"
      width="150"
    />
    <el-table-column
      prop="cusFax"
      label="客户传真"
      width="100"
    />
    <el-table-column
      prop="cusUrl"
      label="客户网址"
      width="100"
    />
    <el-table-column
      prop="userId"
      label="客户经理id"
      width="100"
    />
    <el-table-column
      prop="cusStatus"
      label="客户状态"
      width="100"
      :formatter="fcusStatus"
    />
    <el-table-column
      prop="cusCreatetime"
      label="创建时间"
      width="220"
    />
    <el-table-column
      fixed="right"
      label="操作"
      width="240"
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
        <el-button
          size="small"
          type="danger"
          @click="cleck(scope.$index, scope.row)"
        >
          查看联系人
        </el-button>
      </template>
    </el-table-column>
  </el-table>
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

  <el-dialog
    v-model="state.dialogFormVisible"
    title="编辑客户信息"
    width="500"
    draggable
  >
    <el-form :model="state.form">
      <el-form-item
        label="客户编号"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusId"
          autocomplete="off"
          disabled
        />
      </el-form-item>
      <el-form-item
        label="客户名称"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusName"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户地区"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusRegion"
          placeholder="请选择"
        >
          <el-option
            label="东北"
            value="1"
          />
          <el-option
            label="华北"
            value="2"
          />
          <el-option
            label="西北"
            value="3"
          />
          <el-option
            label="西南"
            value="4"
          />
          <el-option
            label="华南"
            value="5"
          />
          <el-option
            label="华中"
            value="6"
          />
          <el-option
            label="华东"
            value="7"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户行业"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusIndustry"
          placeholder="请选择"
        >
          <el-option
            label="金融"
            value="1"
          />
          <el-option
            label="房地产"
            value="2"
          />
          <el-option
            label="商业服务"
            value="3"
          />
          <el-option
            label="运输物流"
            value="4"
          />
          <el-option
            label="生产"
            value="5"
          />
          <el-option
            label="政府"
            value="6"
          />
          <el-option
            label="文化传媒"
            value="7"
          />
          <el-option
            label="其它"
            value="8"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户等级"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusLevel"
          placeholder="请选择"
        >
          <el-option
            label="重点客户"
            value="A"
          />
          <el-option
            label="普通客户"
            value="B"
          />
          <el-option
            label="非优先客户"
            value="C"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户信用度"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusCredit"
          placeholder="请选择"
        >
          <el-option
            label="一级"
            value="1"
          />
          <el-option
            label="二级"
            value="2"
          />
          <el-option
            label="三级"
            value="3"
          />
          <el-option
            label="四级"
            value="4"
          />
          <el-option
            label="五级"
            value="5"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户地址"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusAddr"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户邮编"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusZipcode"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户电话"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusPhone"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户传真"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusFax"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户网址"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusUrl"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户经理id"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.userId"
          autocomplete="off"
          disabled
        />
      </el-form-item>
      <el-form-item
        label="客户状态"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusCredit"
          placeholder="请选择"
        >
          <el-option
            label="流失"
            value="0"
          />
          <el-option
            label="正常"
            value="1"
          />
        </el-select>
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
        label="客户名称"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusName"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户地区"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusRegion"
          placeholder="请选择"
        >
          <el-option
            label="东北"
            value="1"
          />
          <el-option
            label="华北"
            value="2"
          />
          <el-option
            label="西北"
            value="3"
          />
          <el-option
            label="西南"
            value="4"
          />
          <el-option
            label="华南"
            value="5"
          />
          <el-option
            label="华中"
            value="6"
          />
          <el-option
            label="华东"
            value="7"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户行业"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusIndustry"
          placeholder="请选择"
        >
          <el-option
            label="金融"
            value="1"
          />
          <el-option
            label="房地产"
            value="2"
          />
          <el-option
            label="商业服务"
            value="3"
          />
          <el-option
            label="运输物流"
            value="4"
          />
          <el-option
            label="生产"
            value="5"
          />
          <el-option
            label="政府"
            value="6"
          />
          <el-option
            label="文化传媒"
            value="7"
          />
          <el-option
            label="其它"
            value="8"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户等级"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusLevel"
          placeholder="请选择"
        >
          <el-option
            label="重点客户"
            value="A"
          />
          <el-option
            label="普通客户"
            value="B"
          />
          <el-option
            label="非优先客户"
            value="C"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户信用度"
        :label-width="formLabelWidth"
      >
        <el-select
          v-model="state.form.cusCredit"
          placeholder="请选择"
        >
          <el-option
            label="一级"
            value="1"
          />
          <el-option
            label="二级"
            value="2"
          />
          <el-option
            label="三级"
            value="3"
          />
          <el-option
            label="四级"
            value="4"
          />
          <el-option
            label="五级"
            value="5"
          />
        </el-select>
      </el-form-item>
      <el-form-item
        label="客户地址"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusAddr"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户邮编"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusZipcode"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户电话"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusPhone"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户传真"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusFax"
          autocomplete="off"
        />
      </el-form-item>
      <el-form-item
        label="客户网址"
        :label-width="formLabelWidth"
      >
        <el-input
          v-model="state.form.cusUrl"
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

</template>
<script lang="ts" setup>
import router from "../../router";
import axios from "axios"; //请求服务器模块
import { ElMessage, formatter } from "element-plus"; //ep框架消息提示模块
import { column } from "element-plus/es/components/table-v2/src/common";
import { reactive } from "vue"; //响应式
import { ref } from "vue";

const formLabelWidth = "140px";
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
    cusId: "",
    cusName: "",
    cusRegion: "",
    cusIndustry: "",
    cusLevel: "",
    cusSatisfy: "",
    cusCredit: "",
    cusAddr: "",
    cusZipcode: "",
    cusPhone: "",
    cusFax: "",
    cusUrl: "",
    userId: "",
    cusStatus: "",
    cusCreatetime: "",
  },
});

//查询数据
axios({
  method: "get",
  url: "http://localhost:8080/customer/getPage",
  params: {
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
  }
});

//格式化定义
const fcusRegion = (row, column, cellValue, index) => {
  // console.log(cellValue);
  let res = "";
  //客户地区。1-东北，2-华北，3-西北，4-西南，5-华南，6-华中，7-华东
  switch (cellValue) {
    case 1:
      res = "东北";
      break;
    case 2:
      res = "华北";
      break;
    case 3:
      res = "西北";
      break;
    case 4:
      res = "西南";
      break;
    case 5:
      res = "华南";
      break;
    case 6:
      res = "华中";
      break;
    case 7:
      res = "华东";
      break;
    default:
      res = "null";
  }
  return res;
};
const fcusIndustry = (row, column, cellValue, index) => {
  // console.log(cellValue);
  let res = "";
  //客户行业. 1-金融，2-房地产，3-商业服务，4-运输物流，	   5-生产，6-政府，7-文化传媒，8-其它
  switch (cellValue) {
    case 1:
      res = "金融";
      break;
    case 2:
      res = "房地产";
      break;
    case 3:
      res = "商业服务";
      break;
    case 4:
      res = "运输物流";
      break;
    case 5:
      res = "生产";
      break;
    case 6:
      res = "政府";
      break;
    case 7:
      res = "文化传媒";
      break;
    case 8:
      res = "其它";
      break;
    default:
      res = "null";
  }
  return res;
};
const fcusLevel = (row, column, cellValue, index) => {
  // console.log(cellValue);
  let res = "";
  //客户等级. A-重点客户；B-普通客户；C-非优先客户
  switch (cellValue) {
    case "A":
      res = "重点客户";
      break;
    case "B":
      res = "普通用户";
      break;
    case "C":
      res = "非优先客户";
      break;
    default:
      res = "null";
  }
  return res;
};
const fcusSatisfy = (row, column, cellValue, index) => {
  // console.log(cellValue);
  let res = "";
  //客户满意度. 1-一级，2-二级，3-三级，4-四级，5-五级
  switch (cellValue) {
    case 1:
      res = "一级";
      break;
    case 2:
      res = "二级";
      break;
    case 3:
      res = "三级";
      break;
    case 4:
      res = "四级";
      break;
    case 5:
      res = "五级";
      break;
    default:
      res = "null";
  }
  return res;
};
const fcusCredit = (row, column, cellValue, index) => {
  // console.log(cellValue);
  let res = "";
  //客户信用度. 1-一级，2-二级，3-三级，4-四级，5-五级
  switch (cellValue) {
    case 1:
      res = "一级";
      break;
    case 2:
      res = "二级";
      break;
    case 3:
      res = "三级";
      break;
    case 4:
      res = "四级";
      break;
    case 5:
      res = "五级";
      break;
    default:
      res = "null";
  }
  return res;
};
const fcusStatus = (row, column, cellValue, index) => {
  // console.log(cellValue);
  let res = "";
  //客户状态.1-正常，0-流失
  switch (cellValue) {
    case 0:
      res = "流失";
      break;
    case 1:
      res = "正常";
      break;
    default:
      res = "null";
  }
  return res;
};

//绑定页码切换功能
const handleSizeChange = (val: number) => {
  // console.log(`${val} items per page`)//每页显示条数
  axios({
    method: "get",
    url: "http://localhost:8080/customer/getPage",
    params: {
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
    url: "http://localhost:8080/customer/getPage",
    params: {
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
//新增按钮
const add = (index, row) => {
  state.dialogFormVisible2 = true;
};
//修改按钮
const dialogFormVisible = (index, row) => {
  state.dialogFormVisible = true; //点击修改按钮，出现对话框
  state.form = row;
  //客户地区。1-东北，2-华北，3-西北，4-西南，5-华南，6-华中，7-华东
  switch (state.form.cusRegion) {
    case "1":
      state.form.cusRegion = "东北";
      break;
    case "2":
      state.form.cusRegion = "华北";
      break;
    case "3":
      state.form.cusRegion = "西北";
      break;
    case "4":
      state.form.cusRegion = "西南";
      break;
    case "5":
      state.form.cusRegion = "华南";
      break;
    case "6":
      state.form.cusRegion = "华中";
      break;
    case "7":
      state.form.cusRegion = "华东";
      break;
  }
  //客户行业. 1-金融，2-房地产，3-商业服务，4-运输物流，	   5-生产，6-政府，7-文化传媒，8-其它
  switch (state.form.cusIndustry) {
    case "1":
      state.form.cusIndustry = "金融";
      break;
    case "2":
      state.form.cusIndustry = "房地产";
      break;
    case "3":
      state.form.cusIndustry = "商业服务";
      break;
    case "4":
      state.form.cusIndustry = "运输物流";
      break;
    case "5":
      state.form.cusIndustry = "生产";
      break;
    case "6":
      state.form.cusIndustry = "政府";
      break;
    case "7":
      state.form.cusIndustry = "文化传媒";
      break;
    case "8":
      state.form.cusIndustry = "其它";
      break;
  }
  //客户等级. A-重点客户；B-普通客户；C-非优先客户
  switch (state.form.cusLevel) {
    case "A":
      state.form.cusLevel = "重点客户";
      break;
    case "B":
      state.form.cusLevel = "普通客户";
      break;
    case "C":
      state.form.cusLevel = "非优先客户";
      break;
  }
  //客户信用度. 1-一级，2-二级，3-三级，4-四级，5-五级
  switch (state.form.cusCredit) {
    case "1":
      state.form.cusCredit = "一级";
      break;
    case "2":
      state.form.cusCredit = "二级";
      break;
    case "3":
      state.form.cusCredit = "三级";
      break;
    case "4":
      state.form.cusCredit = "四级";
      break;
    case "5":
      state.form.cusCredit = "五级";
      break;
  }
  //客户状态.1-正常，0-流失
  switch (state.form.cusStatus) {
    case "0":
      state.form.cusStatus = "流失";
      break;
    case "1":
      state.form.cusStatus = "正常";
      break;
  }
};

//删除按钮
const handleDelete = (index, row) => {
  state.dialogFormVisible3 = true;
  state.form = row;
};
//查看按钮
const cleck = (index, row) => {
  console.log(row.cusId);
  router.push({ path: "/Contact", query: { id: row.cusId } });
};
//编辑提交
const submit = () => {
  // console.log(state.form.scComming);
  //客户地区。1-东北，2-华北，3-西北，4-西南，5-华南，6-华中，7-华东
  switch (state.form.cusRegion) {
    case "东北":
      state.form.cusRegion = "1";
      break;
    case "华北":
      state.form.cusRegion = "2";
      break;
    case "西北":
      state.form.cusRegion = "3";
      break;
    case "西南":
      state.form.cusRegion = "4";
      break;
    case "华南":
      state.form.cusRegion = "5";
      break;
    case "华中":
      state.form.cusRegion = "6";
      break;
    case "华东":
      state.form.cusRegion = "7";
      break;
  }
  //客户行业. 1-金融，2-房地产，3-商业服务，4-运输物流，	   5-生产，6-政府，7-文化传媒，8-其它
  switch (state.form.cusIndustry) {
    case "金融":
      state.form.cusIndustry = "1";
      break;
    case "房地产":
      state.form.cusIndustry = "2";
      break;
    case "商业服务":
      state.form.cusIndustry = "3";
      break;
    case "运输物流":
      state.form.cusIndustry = "4";
      break;
    case "生产":
      state.form.cusIndustry = "5";
      break;
    case "政府":
      state.form.cusIndustry = "6";
      break;
    case "文化传媒":
      state.form.cusIndustry = "7";
      break;
    case "其它":
      state.form.cusIndustry = "8";
      break;
  }
  //客户等级. A-重点客户；B-普通客户；C-非优先客户
  switch (state.form.cusLevel) {
    case "重点客户":
      state.form.cusLevel = "A";
      break;
    case "普通客户":
      state.form.cusLevel = "B";
      break;
    case "非优先客户":
      state.form.cusLevel = "C";
      break;
  }
  //客户信用度. 1-一级，2-二级，3-三级，4-四级，5-五级
  switch (state.form.cusCredit) {
    case "一级":
      state.form.cusCredit = "1";
      break;
    case "二级":
      state.form.cusCredit = "2";
      break;
    case "三级":
      state.form.cusCredit = "3";
      break;
    case "四级":
      state.form.cusCredit = "4";
      break;
    case "五级":
      state.form.cusCredit = "5";
      break;
  }
  //客户状态.1-正常，0-流失
  switch (state.form.cusStatus) {
    case "流失":
      state.form.cusStatus = "0";
      break;
    case "正常":
      state.form.cusStatus = "1";
      break;
  }

  //请求访问修改接口
  axios({
    method: "get",
    url: "http://localhost:8080/customer/updateCust",
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
        url: "http://localhost:8080/customer/getPage",
        params: {
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
//新增提交
const submit2 = () => {
  //客户地区。1-东北，2-华北，3-西北，4-西南，5-华南，6-华中，7-华东
  switch (state.form.cusRegion) {
    case "东北":
      state.form.cusRegion = "1";
      break;
    case "华北":
      state.form.cusRegion = "2";
      break;
    case "西北":
      state.form.cusRegion = "3";
      break;
    case "西南":
      state.form.cusRegion = "4";
      break;
    case "华南":
      state.form.cusRegion = "5";
      break;
    case "华中":
      state.form.cusRegion = "6";
      break;
    case "华东":
      state.form.cusRegion = "7";
      break;
  }
  //客户行业. 1-金融，2-房地产，3-商业服务，4-运输物流，	   5-生产，6-政府，7-文化传媒，8-其它
  switch (state.form.cusIndustry) {
    case "金融":
      state.form.cusIndustry = "1";
      break;
    case "房地产":
      state.form.cusIndustry = "2";
      break;
    case "商业服务":
      state.form.cusIndustry = "3";
      break;
    case "运输物流":
      state.form.cusIndustry = "4";
      break;
    case "生产":
      state.form.cusIndustry = "5";
      break;
    case "政府":
      state.form.cusIndustry = "6";
      break;
    case "文化传媒":
      state.form.cusIndustry = "7";
      break;
    case "其它":
      state.form.cusIndustry = "8";
      break;
  }
  //客户等级. A-重点客户；B-普通客户；C-非优先客户
  switch (state.form.cusLevel) {
    case "重点客户":
      state.form.cusLevel = "A";
      break;
    case "普通客户":
      state.form.cusLevel = "B";
      break;
    case "非优先客户":
      state.form.cusLevel = "C";
      break;
  }
  //客户信用度. 1-一级，2-二级，3-三级，4-四级，5-五级
  switch (state.form.cusCredit) {
    case "一级":
      state.form.cusCredit = "1";
      break;
    case "二级":
      state.form.cusCredit = "2";
      break;
    case "三级":
      state.form.cusCredit = "3";
      break;
    case "四级":
      state.form.cusCredit = "4";
      break;
    case "五级":
      state.form.cusCredit = "5";
      break;
  }
  //客户状态.1-正常，0-流失
  switch (state.form.cusStatus) {
    case "流失":
      state.form.cusStatus = "0";
      break;
    case "正常":
      state.form.cusStatus = "1";
      break;
  }

  //请求访问修改接口
  axios({
    method: "get",
    url: "http://localhost:8080/customer/addCust",
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
        url: "http://localhost:8080/customer/getPage",
        params: {
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
    url: "http://localhost:8080/customer/deleteCust",
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
        url: "http://localhost:8080/customer/getPage",
        params: {
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
</script>