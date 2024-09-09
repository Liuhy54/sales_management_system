# 销售机会管理平台

> 作者：Liuhy

## 项目简介

### 1 项目介绍

#### 1.1 系统概述

本次项目开发的客户关系管理系统（CRM）采用了 Vue 3 + JavaScript + Element-plus + Echarts + Spring Boot + MySQL + MyBatis 等技术，确保了系统的稳定性和高效性。该系统包含以下四大模块：

销售机会管理模块：该模块旨在帮助企业跟踪和管理销售机会，通过信息录入、分配、修改、删除与查询等功能，提高客户开发计划的成功几率。

登录注册模块：此模块确保了系统的安全性和用户管理的便捷性。通过用户名和密码的验证，系统能够准确判断用户身份，并提供相应的权限管理。

客户联系人模块：该模块集中管理客户信息，包括联系人的添加、修改、查询和删除等功能。通过这一模块，企业可以方便地查询和更新客户信息，避免了信息孤岛的问题。同时，企业还可以利用CRM应用进行客户分类和分析，制定个性化的营销策略。

可视化图表模块：该模块通过图表的形式展示客户数据、销售趋势等信息，帮助企业更好地了解市场动态和客户需求。系统支持多种图表类型（如折线图、柱状图、饼图等）。

### 1.2 系统特点

前后端分离设计：采用前后端分离的设计模式，使得系统的更新和扩展更加灵活和便捷。前端主要负责展示和交互，后端则负责数据处理和逻辑运算，两者通过API进行通信，降低了系统耦合度。

高性能：系统采用了高效的数据库技术和缓存策略，确保了数据的快速读写和系统的稳定运行。同时，系统还支持多用户并发访问，能够满足企业大规模使用的需求。

易用性：系统界面简洁明了，操作流程清晰易懂。用户可以通过简单的操作完成复杂的功能需求，提高了工作效率和用户体验。

可扩展性：系统采用模块化设计，支持模块的快速添加和删除。企业可以根据自身需求定制开发新的功能模块，满足个性化需求。

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

#### 4.3 客户管理模块
客户管理模块，分为客户信息管理和管理客户联系人（客户信息管理子模块）两大模块。

#### 4.3.1  客户信息管理
（1）业务描述：包括客户新增，修改，删除功能。

（2）使用者：客户经理

（3）处理流程

①新增客户。弹出新增窗口,按要求输入相关信息,点击保存按钮,插入数据库。

②修改客户。首先显示客户列表，选择一个客户，点击编辑按钮，弹出窗口显示客户信息,按需要修改相关信息,点击保存按钮,修改数据库中对应客户编号的信息。

③ 删除客户。首先显示客户列表，选择需要删除的客户，可多选，然后点击然后弹出确认提示,点击确认则删除数据库对应编号的客户,点击取消放弃删除。

（5）输出要素客户信息保存到客户表

展示页面：
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17057.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17059.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17061.png)

核心代码：
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17077.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17079.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17081.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17083.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture16695.png)

#### 4.3.2 管理客户联系人
（1）业务描述：每个客户可以有多个联系人

（2）使用者：客户经理

（3）处理流程：选择一个客户，显示其所有联系人的列表.从中选择要编辑和删除操作,还可以给该客户添加联系人。

（4）输出要素客户联系人信息。

展示页面：
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17202.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17204.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17207.png)


核心代码：
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17223.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17225.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17228.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17231.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17234.png)


#### 4.4 报表模块
(1) 客户等级报表：根据客户的优先程度进行划分，利用图表的形式可视化客户的等级分布。

(2) 客户地区报表：根基客户所在地区进行展示，利用图表的形式可视化客户的地区分布。

(3) 客户行业报表：根基客户所在行业进行展示，利用图表的形式可视化客户的行业分布。

展示页面：
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17385.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17386.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17387.png)

核心代码：
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17399.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17401.png)
![](https://raw.githubusercontent.com/Liuhy54/sales_management_system/sys-picture/sys-picture17402.png)
