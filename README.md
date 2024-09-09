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

#### 2.1 销售机会管理
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture8474.png)

#### 2.2 客户信息管理
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture9965.png)

### 3 系统设级
#### 3.1 系统总体功能结构设计
在本系统中，用户主要分客户经理和销售主管两类，用户可以通过选择不同的角色注册来登录到系统中。在角色为销售主管进入系统后，在大厅页面可以对已经登记在数据库中的记录进行指派操作，以及对已指派的记录状态进行操作。同时，雇员通过“添加”、“删除”和“修改”按钮可以对现有的销售机会记录进行修改或是增加新的销售机会。当角色为客户经理进入系统后，可以查看已经存在于数据库中的客户信息记录，并通过“修改”、“删除”按钮对这些记录进行处理，通过“添加”按钮增加新的客户信息，还可以通过点击“查看联系人”按钮显示选中客户的联系人列表，并且在联系人页面也可以进行增加、删除和修改功能。

通过总体的功能设计，客户管理系统实现了对销售机会的增删改查，同时也完成了客户经理和销售主管之间的交互。同时经过总体功能设计后，把页面分为三个不同页面的设计，把每个页面操作都尽可能的进行简化，提升用户的操作便利性让用户称心满意。其功能设计图如图所示。

![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture12763.png)

#### 3.2 子功能模块设计
##### 3.2.1 销售机会管理
在该功能中，用户可以进行注册以及登录操作。首先用户进行用户类型选择及注册，注册成功后进行登录操作，在此操作成功后进入到本系统中。当用户选择销售主管进入系统后可以进行新增、修改和删除销售机会等活动，经过这一系列操作后可以退出系统该活动结束。

![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture12957.png)

##### 3.2.2 客户信息管理
在客户经理的功能中，客户信息管理主要对现有客户的信息进行管理，可以进行客户信息的及时更新。在该功能中，用户可以对客户的个人信息进行修改以及查看操作。首先客户经理在登录到系统后，打开客户信息管理页面，在此页面中可以修改客户资料、查看客户的联系人资料操作，在完成操作后可以退出系统该活动结束。
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture13145.png)

### 3.3 系统E-R图
本系统实体主要有用户实体、投标实体、任务分类实体、公告实体、常见问题实体、任务实体、管理员实体七类实体。雇员类用户实体与投标信息实体存在多对多的关系；雇主类用户与任务实体存在1对多的关系；雇主类用户与任务分类实体存在多对多的关系；雇员和雇主类用户与常见问题实体、公告实体都存在多对多的关系；管理员与公告实体、常见问题实、用户实体、用户分类实体、任务实体都有1对多的关系。

![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture13749.png)

### 4项目展示
##### 4.1 用户注册登录模块
###### 4.1.1 注册界面：

使用者点击注册。在提交信息以后就会进行相应的信息确认，弹出注册成功信息，用户提交的信息就会被存入数据库中。如果内容填写有误，系统会提示出错，使用者可重新修改，再次提交。
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture15947.png)
核心代码
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture15986.png)

###### 4.1.2 登录界面：
当用户进入网站，打开登录页面，用户需要登录成功后才能进入首页，系统验证输入的用户名和密码，与库中数据是否一致，若一致，则登陆成功，即可进入首页，否则弹出错误“用户不存才”或密码错误。
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16124.png)
核心代码
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16137.png)

##### 4.2 营销管理模块

（1）业务描述

该模块包含销售机会的新增，修改，删除和指派功能

（2）使用者

销售主管、客户经理

（3）输入要素

字段名：编号，客户名称，机会来源，联系人，联系方式，成功几率(%)，机会信息,机会描述,创建人,创建时间,指派给,指派时间,状态机会来源：促销、广告、搜索引擎、线上咨询、电话咨询、邮件咨询、客户介绍销售机会的状态为:未分配、已分配、开发成功、开发失败

（4） 处理流程

① 新增销售机会。在新增页面中输入信息，其中创建人和创建时间不需要在新增时输入,创建人根据登录用户自动获取,创建时间自动获取系统时间。点击保存后把信息存入数据库。

②修改销售机会。在销售机会列表中选择要修改的销售机会，点击修改按钮,弹出修改界面,修改需要修改的信息,然后点击保存按钮,修改数据保存到数据库。注意，只有未指派的销售机会才可以修改。

③删除销售机会。状态为：“未指派”的销售机会可以删除，删除的时候盂要判断当前登录用户为该销售机会的创建人,否则是不可以删除的。

④(修改)指派销售机会。销售主管对销售机会进行分派,每一个销售机会分派给一个客户经理，指派成功后，销售机会状态为“已指派”。

（5）输出要素在 sale_chance 表保存数据

展示页面：
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16693.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16695.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16697.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16699.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16701.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16703.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16705.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16707.png)

核心代码
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16726.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16728.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16730.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16732.png)

#### 4.1.2 客户管理模块
客户管理模块，分为客户信息管理和管理客户联系人（客户信息管理子模块）两大模块。

#### 4.1.2.1  客户信息管理
