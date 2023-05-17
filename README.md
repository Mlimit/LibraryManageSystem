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

![image-20230517095513863](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517095234763.png?raw=true)

借书模块

设想是管理员用扫描枪扫条码，ISBN直接导入到查询框中显示对应信息进行借书

![image-20230517100502429](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517095513863.png?raw=true)

#### 图书管理

![image-20230517100702272](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517100702272.png?raw=true)
#### 读者管理

![image-20230517101550895](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517101550895.png?raw=true)

#### 类型管理

![image-20230517100726157](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517100726157.png?raw=true)

#### 公告管理

![image-20230517100745169](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517100745169.png?raw=true)

#### 管理员管理

![image-20230517100934992](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517100934992.png?raw=true)

#### 统计分析

![image-20230517100944791](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517100944791.png?raw=true)

### 2.2用户端

演示账号：9210607112 密码：123456

#### 图书查询

![image-20230517101800655](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517101800655.png?raw=true)

#### 借阅记录

![image-20230517101822899](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517101822899.png?raw=true)

#### 公告查看

![image-20230517101835900](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517101835900.png?raw=true)

#### 个人信息修改

![image-20230517101847440](https://github.com/Mlimit/LibraryManageSystem/blob/master/asset/image-20230517101847440.png?raw=true)

## 3.配置教程 

1.  配置数据库，sql文件就在根目录下，数据库我用的是8.0.26版本，用5.7的自己处理下
2.  在db.properties文件里配置好数据库账号密码
