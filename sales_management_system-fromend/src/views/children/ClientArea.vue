<template>
  <div class="chart-container">
    <div
      id="chart2"
      style="width: 750px; height: 400px;"
    ></div>
  </div>
</template>

<script setup>
//引入echarts
import * as echarts from 'echarts';
import { ElMessage } from 'element-plus';
import { ref, onMounted } from "vue";
import axios from 'axios'; //请求服务器模块
const chart1 = ref();
const chart2 = ref();

//折线图
const myLinechart = (chartId, xdata, ydata) => {

  // 基于准备好的dom，初始化echarts实例
  const myChart = echarts.init(document.getElementById(chartId));
  // 绘制图表
  const option = {
    title: {
      text: '客户地区统计报表',
      left: 'center',
    },
    tooltip: {},
    legend: {
      data: ['数量'],
      left: 'right',
    },
    xAxis: {
      data: xdata
    },
    yAxis: {},
    series: [
      {
        name: '数量',
        type: 'line',
        areaStyle: {},
        data: ydata
      }
    ]
  };

  myChart.setOption(option);
};
onMounted(() => {
  // console.log("挂载");
  // myEchart();




  //客户地区统计
  axios({
    method: 'get',
    url: "http://localhost:8080/customer/rep2",
  }).then((res) => {
    // console.log(res.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      // ElMessage.error('Oops, this is a error message.')
      ElMessage.error(res.data.msg);
    } else {
      //查询成功
      // console.log();
      myLinechart('chart2', res.data.xdata, res.data.ydata)
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