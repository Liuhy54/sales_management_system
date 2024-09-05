<template>
  <el-container
    class="layout-container-demo"
    style="height: 650px"
  >
    <el-aside width="200px">
      <el-scrollbar>
        <el-menu
          :default-openeds="['1', '3']"
          background-color="#C6E2FF"
          router="true"
        >
          <el-sub-menu index="1">
            <template #title>
              <el-icon>
                <message />
              </el-icon>营销管理
            </template>
            <el-menu-item-group>
              <template #title>Group 1</template>
              <el-menu-item index="saleChance">销售机会管理</el-menu-item>

            </el-menu-item-group>

          </el-sub-menu>
          <el-sub-menu index="2">
            <template #title>
              <el-icon><icon-menu /></el-icon>客户管理
            </template>
            <el-menu-item-group>
              <template #title>Group 1</template>
              <el-menu-item index="customer">客户信息管理</el-menu-item>

            </el-menu-item-group>

          </el-sub-menu>
          <el-sub-menu index="3">
            <template #title>
              <el-icon>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 1024 1024"
                >
                  <path
                    fill="currentColor"
                    d="M416 896V128h192v768zm-288 0V448h192v448zm576 0V320h192v576z"
                  ></path>
                </svg>
              </el-icon>报表
            </template>
            <el-menu-item-group>
              <template #title>客户</template>
              <el-menu-item index="ClientGrade">客户等级</el-menu-item>
              <el-menu-item index="ClientArea">客户地区</el-menu-item>
              <el-menu-item index="ClientIndustry">客户行业</el-menu-item>
            </el-menu-item-group>

          </el-sub-menu>
        </el-menu>
      </el-scrollbar>
    </el-aside>

    <el-container>
      <el-header style="text-align: right; font-size: 12px">
        <div class="toolbar">
          <el-dropdown @command="handleCommand">
            <el-icon style="margin-right: 8px; margin-top: 1px">
              <setting />
            </el-icon>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command="login">切换用户</el-dropdown-item>
                <el-dropdown-item command="register">注册</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
          <span>{{ item.userName }}</span>
        </div>
      </el-header>

      <el-main>
        <!-- <el-scrollbar>
          <el-table :data="tableData">
            <el-table-column prop="date" label="Date" width="140" />
            <el-table-column prop="name" label="Name" width="120" />
            <el-table-column prop="address" label="Address" />
          </el-table>
        </el-scrollbar> -->

        <RouterView />
      </el-main>

    </el-container>
  </el-container>
</template>

<script setup>
import router from '@/router';
import { ref } from 'vue'
import { useRoute } from 'vue-router';
import { Menu as IconMenu, Message, Setting } from '@element-plus/icons-vue'

// 获取当前路由对象
const route = useRoute();
const item = {
  date: '2016-05-02',
  name: 'Tom',
  address: 'No. 189, Grove St, Los Angeles',
  userName: route.query.name || null,// 从查询参数中获取 name，并赋值给 userName,
}
const tableData = ref(Array.from({ length: 20 }).fill(item))

// 处理下拉菜单命令
const handleCommand = (command) => {
  if (command === 'login') {
    router.push({ path: '/' })
  } else if (command === 'register') {
    router.push({ path: '/Register' })
  }
}
</script>

<style scoped>
.layout-container-demo .el-header {
  position: relative;
  background-color: var(--el-color-primary-light-7);
  color: var(--el-text-color-primary);
}

.layout-container-demo .el-aside {
  color: var(--el-text-color-primary);
  background: var(--el-color-primary-light-8);
}

.layout-container-demo .el-menu {
  border-right: none;
}

.layout-container-demo .el-main {
  padding: 0;
}

.layout-container-demo .toolbar {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  right: 20px;
}
</style>