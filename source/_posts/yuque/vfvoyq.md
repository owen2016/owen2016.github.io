---
title: SonarQube之采购选型参考
urlname: vfvoyq
date: '2021-08-29 23:40:22 +0800'
tags: []
categories: []
---

SonarQube 是 DevOps 实践中主流的一款质量内建工具，过插件机制，Sonar 可以集成不同的测试工具，代码分析工具，以及持续集成工具，比如 pmd-cpd、checkstyle、findbugs、Jenkins。

通过不同的插件对这些结果进行再加工处理，通过量化的方式度量代码质量的变化，从而可以方便地对不同规模和种类的工程进行代码质量管理。同时 Sonar 还对大量的持续集成工具提供了接口支持，可以很方便地在持续集成中使用 Sonar。**一般情况下，社区版还是可以满足大部分场景的，即便是 C/C++社区也是有其他开源插件的。**

## 工作原理

SonarQube 并不是简单地将各种质量检测工具的结果（例如 FindBugs，PMD 等）直接展现给客户，而是通过不同的插件算法来对这些结果进行再加工，最终以量化的方式来衡量代码质量，从而方便地对不同规模和种类的工程进行相应的代码质量管理。 SonarQube 在进行代码质量管理时，会从图 1 所示的七个纬度来分析项目的质量。

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645361536477-19baed46-ccc0-4de3-a77a-0f3d5699255e.png#clientId=u80f9ac51-abfc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=194&id=u79a0e68d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=194&originWidth=352&originalType=binary∶=1&rotation=0&showTitle=false&size=32778&status=done&style=none&taskId=u5bf2f9a0-a5e1-47f9-8706-2924bc07012&title=&width=352)

SonarQube 可以支持 25+ 种编程语言，针对不同的编程语言其所提供的分析方式也有所不同： 对于所有支持的编程语言，SonarQube 都提供源了代码的静态分析功能； 对于某些特定的编程语言，SonarQube 提供了对编译后代码的静态分析功能，比如 java 中的 class file 和 jar 和 C# 中的 dll file 等； 对于某些特定的编程语言，SonarQube 还可以提供对于代码的动态分析功能，比如 java 和 C# 中的单元测试的执行等。

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645372639172-1f9e2c72-d16f-4708-9df1-41ad65b52f5e.png#clientId=u3f51a294-4347-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=417&id=u2c6b3d18&margin=%5Bobject%20Object%5D&name=image.png&originHeight=534&originWidth=914&originalType=binary∶=1&rotation=0&showTitle=false&size=155283&status=done&style=none&taskId=ud78fe533-ebe3-4475-b14e-b0079a124b6&title=&width=713)
远程客户机可以通过各种不同的分析机制，从而将被分析的项目代码上传到 SonarQube server 并进行代码质量的管理和分析，SonarQube 还会通过 Web API 将分析的结果以可视化、可度量的方式展示给用户

## 软硬件要求

1. 硬件上对磁盘读写性能要求高，服务涉及 elasticsearch 索引，IO 读写和分析的代码量直接影响 sonarqube 性能；实际生产环境建议使用专用高速 I/O 存储
2. SonarQube server 不支持 32 位，但 SonarQube scannner 支持 32 位
3. SonarQube server 仅支持 Java11; SonarQube scanners 同时支持 Java8&11
4. 数据库支持 PostgreSQL, MSSQL Server, Oracle, 不再支持 Mysql

## 版本分类

| **类型** | **全称**            | **说明**                         |
| -------- | ------------------- | -------------------------------- |
| CE       | Community Edition   | 社区版                           |
| DE       | Developer Edition   | 开发版（具有 CE 版所有特性）     |
| EE       | Enterprise Edition  | 企业版（具有 DE 版所有特性）     |
| DCE      | Data Center Edition | 数据中心版（具有 EE 版所有特性） |

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630251859329-d39337e1-a4a6-4a91-aae3-2022f9f3c762.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=509&id=u0f277aeb&margin=%5Bobject%20Object%5D&name=image.png&originHeight=687&originWidth=1181&originalType=binary∶=1&rotation=0&showTitle=false&size=124309&status=done&style=none&taskId=u565fa461-fbb4-46ad-a456-71b1cff4139&title=&width=875)

## 特性费用对比

[https://www.sonarsource.com/plans-and-pricing/community/](https://www.sonarsource.com/plans-and-pricing/community/)
[https://www.sonarsource.com/plans-and-pricing/developer/](https://www.sonarsource.com/plans-and-pricing/developer/)
[https://www.sonarsource.com/plans-and-pricing/enterprise/](https://www.sonarsource.com/plans-and-pricing/enterprise/)
[https://www.sonarsource.com/plans-and-pricing/data-center/](https://www.sonarsource.com/plans-and-pricing/data-center/)

| **类型** | **价格**             | **LOC**                |
| -------- | -------------------- | ---------------------- |
| CE       | 免费                 | -                      |
| DE       | 120 欧元-5 万欧元    | 10 万行代码-20M 行代码 |
| EE       | 1.5 万欧元-18 万欧元 | 1M 行代码-100M 行代码  |
| DCE      | 10 万欧元-上不封顶   | 20M 代码-              |

### CE-社区免费版本

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630252221562-6fdc9b38-c978-4a8e-ab0c-5bf26e48aa1f.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=192&id=u02c0ea3f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=259&originWidth=879&originalType=binary∶=1&rotation=0&showTitle=false&size=75094&status=done&style=none&taskId=u35b95e99-28f4-4b6a-bbe5-7fa94bfaa4a&title=&width=653)
除了支持 15 种编程语言，CE 版还就有如下特性

- 支持 5 种 IDE
- 支持 60+的插件
- 支持 SonarLint
- 支持 Quality Gate
- 快速确认近期修改代码的问题

开源版本不支持一个项目多分支的形式，只能按照特性分支的名称来生成相对应的扫描项目（会产生很多 Sonarqube 项目）。

解决方案：假如这个项目有 F1，F2 等特性分支，在每次对其中特性分支构建扫描时会配置 sonar 扫描参数（projectName）为 “服务名称\_特性分支名称”，这样相当于每个特性分支都对应一个扫描项目。但又间接的带来了一些问题。

- 每个特性分支生成一个项目，假如特性分支被删除呢？或者分支很多呢？
- 对于 SonarQube 管理员来说很难管理，增加了任务负担。

### DE-开发者版本

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630252086655-7dff61e0-2b07-485f-bcfe-983aba176a77.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=340&id=u58d7239c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=572&originWidth=1195&originalType=binary∶=1&rotation=0&showTitle=false&size=75855&status=done&style=none&taskId=uf09d58c4-e927-4b39-9e6d-123badd8248&title=&width=711)
相较于 CE 版，增加了 C/C++、Objective-C、T-SQL、ABAP、PL/SQL 和 Swift 等，详细信息如下所示：

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630252279093-28c8f429-704f-4ce1-afbd-a1743d16340e.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=244&id=ubeb4777e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=300&originWidth=881&originalType=binary∶=1&rotation=0&showTitle=false&size=89933&status=done&style=none&taskId=u6318006f-5806-4b0f-963e-345a6cae8e7&title=&width=716)
DE 版具有 CE 版所有特性，在此基础之上，该版本还有如下特性增强：

- 支持 22 种编程语言
- 支持 Pull Request 的分支代码分析
- 安全性的增强：Security Hotspots & Security Vulnerabilities 的全面支持
- 支持 SonarLint 的智能提示，更好地与 IDE 进行集成

### EE-企业版本

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630252129617-1fbe1c36-5be4-46fc-99f3-e6a2f822cef1.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=322&id=ubabf1e89&margin=%5Bobject%20Object%5D&name=image.png&originHeight=495&originWidth=1166&originalType=binary∶=1&rotation=0&showTitle=false&size=69600&status=done&style=none&taskId=u95c0518c-77ba-4859-88d9-24af3fe38c5&title=&width=759)
相较于 DE 版，增加了 Apex、COBOL、PL/1、RPG 和 VB6 等五种，详细信息如下所示：
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630252295211-23cc2bc4-fb6a-4089-a750-50bbaab82472.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=268&id=ua7ab0b53&margin=%5Bobject%20Object%5D&name=image.png&originHeight=300&originWidth=838&originalType=binary∶=1&rotation=0&showTitle=false&size=97221&status=done&style=none&taskId=u1e2f6eb7-3a8e-432a-a39b-0eb6dd36cfd&title=&width=750)

EE 版具有 DE 版所有特性，在此基础之上，该版本还有如下特性增强：

- 支持 27 种编程语言
- 支持对于 Portfolio 的管理
- 提供 OWASP / SANS 的安全报告
- 提供可配置的 SAST 分析引擎

### DCE-数据中心版本

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630252158949-be1930d4-64c6-411b-9433-890148edee39.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=335&id=u50549072&margin=%5Bobject%20Object%5D&name=image.png&originHeight=471&originWidth=1175&originalType=binary∶=1&rotation=0&showTitle=false&size=65603&status=done&style=none&taskId=ue793064f-9f4a-4ea9-b429-21be21fd559&title=&width=836)
EE 版具有 EE 版所有特性，此版本主要对于高可用性和横向扩展性有更好的支持。

## 如何计算费用？

Sonarqube 是按照扫描的行数进行计费的，以年为单位进行订阅。关于行数如何解读？假如你买 100W 行扫描量，那么这个量是被所有项目共享的，但扫描的行数超过 100W 行，分析服务将会终止。当然如果你删除项目重置，扫描量就会恢复。

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1630252876197-35f04eae-e476-4f6e-8368-64b5b1beaf45.png#clientId=u43a19740-2098-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=313&id=u0e6f78b0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=332&originWidth=1130&originalType=binary∶=1&rotation=0&showTitle=false&size=69511&status=done&style=none&taskId=ucf794015-5c38-4892-93eb-60f6be6112f&title=&width=1064)
