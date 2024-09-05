<template>
  <div class="chart-container">
    <div
      id="chart3"
      style="width: 750px; height: 500px;"
    ></div>
  </div>
</template>

<script setup>
//引入echarts
import * as echarts from 'echarts';
import { ElMessage } from 'element-plus';
import { ref, onMounted } from "vue";
import axios from 'axios'; //请求服务器模块

//饼状图
const myPiechart = (chartId, data) => {

  // 基于准备好的dom，初始化echarts实例
  const myChart = echarts.init(document.getElementById(chartId));
  // 绘制图表
  const option = {
    title: {
      text: '客户行业统计报表',
      left: 'center',},
    tooltip: {
      trigger: 'item'},
    legend: {
      top: '5%',
      left: 'center'},
    series: [
      {
        name: 'Access From',
        type: 'pie',
        radius: ['40%', '70%'],
        avoidLabelOverlap: false,
        itemStyle: {
          borderRadius: 10,
          borderColor: '#fff',
          borderWidth: 2},
        label: {
          show: false,
          position: 'center'},
        emphasis: {
          label: {
            show: true,
            fontSize: 40,
            fontWeight: 'bold'}},
        labelLine: {
          show: false},
        data: data}]}
  myChart.setOption(option);
};
onMounted(() => {
  // console.log("挂载");
  // myEchart();

  //客户行业统计
  axios({
    method: 'get',
    url: "http://localhost:8080/customer/rep3",
  }).then((res) => {
    // console.log(res.data.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      // ElMessage.error('Oops, this is a error message.')
      ElMessage.error(res.data.msg);
    } else {
      //查询成功
      // console.log();
      myPiechart('chart3', res.data.data)
    }
  });

});

</script>
<style>
.chart-container {
  display: flex;
  flex-direction: column;
  /* 竖直方向排列图表 */
  justify-content: center;
  /* 水平居中 */
  align-items: center;
  /* 垂直居中 */
}

.chart {
  margin-bottom: 20px;
  /* 图表间距 */
}
</style>