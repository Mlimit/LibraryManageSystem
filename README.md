<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">图书管理系统</h1>
<h4 align="center">基于SSM+JSP+Layui的图书馆管理系统</h4>

## 1.介绍

此系统是自己的Java Web课程课设，目的是高校的图书馆书籍管理，帮助管理员完成借阅，帮助读者查询当前借阅情况等，功能并不算太完善，还需要根据实际应用场景进行改进

系统角色分为管理员和读者

管理员端功能：借阅管理（借书、还书操作）、图书管理、读者管理、书籍类型管理、公告管理、管理员管理、统计分析（目前只有读者最爱类别的饼图）

用户端功能：图书查询、借阅记录查询、公告查看、个人信息修改

## 2.软件演示

### 2.1管理员端

演示账号：admin 密码：123456

#### 借阅管理

![image-20230517095513863](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/60202f98-c57b-4542-8e6c-cdda30e47826)

借书模块

设想是管理员用扫描枪扫条码，ISBN直接导入到查询框中显示对应信息进行借书

![image-20230517100502429](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/ddf67385-b70a-4f34-8f02-722aff0df9e6)

#### 图书管理

![image-20230517100702272](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/3606a480-bdbe-41ac-bab9-1a2ccf97a3d5)
#### 读者管理

![image-20230517101550895](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/257ce68e-c4d5-422d-ae54-ba12a286fbee)

#### 类型管理

![image-20230517100726157](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/2b62e4ab-5bd5-4fe5-a39b-aa5177f55811)

#### 公告管理

![image-20230517100745169](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/b29c6544-8d47-4fc6-a0d5-6204d72d481e)

#### 管理员管理

![image-20230517100934992](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/97866b03-d4c7-4c9d-b842-9b23dea30a07)

#### 统计分析

![image-20230517100944791](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/b9d05a9c-a79e-4a52-a77b-c370d387cf2a)

### 2.2用户端

演示账号：9210607112 密码：123456

#### 图书查询

![image-20230517101800655](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/efcb71f3-3ed7-40fe-8348-b1fde04e618d)

#### 借阅记录

![image-20230517101822899](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/b220bf59-679e-4e46-88cd-4972a9c673f7)

#### 公告查看

![image-20230517101835900](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/f9ec2c2c-f306-4eb8-b344-be1fad3a1de9)

#### 个人信息修改

![image-20230517101847440](https://github.com/Mlimit/LibraryManageSystem/assets/63535130/0f17689c-f8ec-4529-ba7d-9e4ba3bb3897)

## 3.配置教程 

1.  配置数据库，sql文件就在根目录下，数据库我用的是8.0.26版本，用5.7的自己处理下
2.  在db.properties文件里配置好数据库账号密码
