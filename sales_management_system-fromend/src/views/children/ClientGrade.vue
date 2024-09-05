<template>
  <div class="chart-container">
    <div
      id="chart1"
      style="width: 750px;height: 400px;"
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
//柱状图
const myBarchart = (chartId, xdata, ydata) => {

  // 基于准备好的dom，初始化echarts实例
  const myChart = echarts.init(document.getElementById(chartId));
  // 绘制图表
  const option = {
    title: {
      text: '客户等级统计报表',
      left: 'center',
    },
    tooltip: {},
    legend: {
      data: ['等级'],
      left: 'left',
    },
    xAxis: {
      // data: ['衬衫', '羊毛衫', '雪纺衫', '裤子', '高跟鞋', '袜子']//动态修改---x轴---分类
      data: xdata
    },
    yAxis: {
      // data: ['衬衫', '羊毛衫', '雪纺衫', '裤子', '高跟鞋', '袜子']
    },
    series: [
      {
        name: '销量',
        type: 'bar',
        // data: [5, 20, 36, 10, 10, 20]//动态修改---y轴---具体数值
        data: ydata
      }
    ]
  };

  myChart.setOption(option);
};

onMounted(() => {
  // console.log("挂载");
  // myEchart();


  //客户等级统计
  axios({
    method: 'get',
    url: "http://localhost:8080/customer/rep1",
  }).then((res) => {
    // console.log(res.data);//获取请求后端服务器返回到的值
    if (res.data.code != 0) {
      // ElMessage.error('Oops, this is a error message.')
      ElMessage.error(res.data.msg);
    } else {
      //查询成功
      // console.log();
      myBarchart('chart1', res.data.xdata, res.data.ydata)
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