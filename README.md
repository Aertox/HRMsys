## 基于SpringMVC+Mybatis框架
该项目包含了用户管理、部门管理、职位管理、员工管理、公告管理、下载中心等多个模块,页面使用JQuery框架完成动态功能,用户管理、部门管理等模块包含了项目开发中常用的增删改查动作,可以支持人脸识别登陆,下载中心包含了 Spring MVC的文件上传、下载等功能

## 系统功能介绍
用户管理的功能包括：添加用户，用户可以为管理员或者普通用户;查询用户，可以查询所有用户或根据用户名和用户状态进行模糊查询，删除用户，修改用户。

部门管理的功能包括：添加部门，查询部门，可以查询所有部门或根据部门名称进行模糊查询，删除部门，修改部门

职位管理的功能包括：添加职位，查询职位，可以查询所有职位或根据职位名称进行模糊查询，删除职位，修改职位

员工管理的功能包括：添加员工，查询员工，可以查询所有员工或根据员工姓名，身份证号，手机号，性别，职位，部门进行模查询，删除员工，修改员工。

公告管理的功能包括：添加公告，查询公告，可以查询所有公告或根据公告名称，公告内容进行模糊查询，删除公告，修改公告。

下载中心的功能包括：上传文件，查询文件，可以查询所有文件或根据文件标题进行模糊查询，预览文件内容：删除文件，下载文件。

使用了echarts 对项目内的数据进行了可视化的展示 （由于没有过多的数据 前台所展示的数据均为假数据）

## 项目部署
对数据库进行配置 将红框内改成自己的信息
<img width="1035" alt="image" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/1896fec0-b2cb-484e-9178-0c327a8d5bb7">
对百度人脸识别的api进行配置 将红框内改成自己的百度云的sk
<img width="1082" alt="image" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/759a18e5-ad4c-4921-9d35-35d63979f2dd">
管理员账号 admin 123（由于密码并没有加密，所以在数据库中是明文显示，可以自己根据数据库内容尝试进入系统）

## 项目预览
<img width="415" alt="image" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/745cf0e6-eb4b-4d6a-8a84-e10b3cb95f0d">
<img width="415" alt="image" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/066b289b-9101-4dac-9f42-fb1cfd487f3a">
<img width="1440" alt="login" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/ae73ae28-dede-4aef-94db-71abd8028ddc">
<img width="1440" alt="notice" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/0c50e850-6b64-4ca6-a77c-bfe581f7dd19">
<img width="1440" alt="adduser" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/1785d509-9852-47b0-bf87-8ec5f62e8091">
<img width="1440" alt="addnotice" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/3cc02ca1-ae65-43da-8996-b81d9f2dbf30">
<img width="1440" alt="addjob" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/99362910-dec6-4063-aa7d-62c4a6807929">
<img width="1440" alt="addemployee" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/c3c3f8d7-8093-458e-a6d1-2ed649b52ba8">
<img width="1440" alt="adddept" src="https://github.com/Aertox/hrmsys2.0/assets/99350661/896a55f5-1f01-48b2-9508-0ef79aae713d">

## Tips
本项目同样是基于github中的一个项目修改而来（要是找到原项目会放出链接），本人对于其中的业务关系并没有做太大的完善，仍然存在一些业务逻辑的不完整，但是把项目配置好是可以跑起来的，应付课程设计基本没问题，部署有问题可以尝试联系我 (2063617362@qq.com)

