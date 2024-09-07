# 销售机会管理平台

> 作者：iuhy

## 项目简介

### 1 项目介绍

深入业务场景的实战项目，基于 Vue 3 + JavaScript + Element-plus + Echarts + Spring Boot + MySQL + MyBatis 的 **机会管理平台。**

提升企业客户关系管理效率：通过开发客户关系管理系统，企业可以实现客户信息的集中化和规范化管理，减少重复工作和人为错误，提高工作效率。

优化销售策略：客户关系管理系统可以帮助企业跟踪销售机会，分析客户需求和购买行为，从而制定更加精准的销售策略。

### 2 业务功能
#### 系统总体用例图
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture8452.png)

#### 1) 销售机会管理
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture8474.png)

#### 2) 客户信息管理
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture9965.png)

### 3 系统设级
#### 1) 系统总体功能结构设计
在本系统中，用户主要分客户经理和销售主管两类，用户可以通过选择不同的角色注册来登录到系统中。在角色为销售主管进入系统后，在大厅页面可以对已经登记在数据库中的记录进行指派操作，以及对已指派的记录状态进行操作。同时，雇员通过“添加”、“删除”和“修改”按钮可以对现有的销售机会记录进行修改或是增加新的销售机会。当角色为客户经理进入系统后，可以查看已经存在于数据库中的客户信息记录，并通过“修改”、“删除”按钮对这些记录进行处理，通过“添加”按钮增加新的客户信息，还可以通过点击“查看联系人”按钮显示选中客户的联系人列表，并且在联系人页面也可以进行增加、删除和修改功能。

通过总体的功能设计，客户管理系统实现了对销售机会的增删改查，同时也完成了客户经理和销售主管之间的交互。同时经过总体功能设计后，把页面分为三个不同页面的设计，把每个页面操作都尽可能的进行简化，提升用户的操作便利性让用户称心满意。其功能设计图如图所示。

![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture12763.png)