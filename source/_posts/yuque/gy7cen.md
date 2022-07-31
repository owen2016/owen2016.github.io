---
title: 数据流图
urlname: gy7cen
date: '2022-07-15 11:58:36 +0800'
tags: []
categories: []
---

# 一、数据流图概念

**数据流图**（Data Flow Diagram，DFD）是从数据传递和加工的角度，以图形的方式来描述逻辑输入经过系统加工处理后转化为逻辑输出的结构化系统分析工具
**重点理解**：系统的输入和输出分别是什么、数据从何处来又去向何方、数据存储在何处

数据流图描述的是系统的逻辑模型，图中没有任何具体的物理元素，只是描绘信息在系统中流动和处理的情况。因为数据流图是逻辑系统的图形表示，即使不是专业的计算机技术人员也能容易理解。不要将数据流图（DFD）与系统流程图、程序流程图相混淆。

# 二、 数据流图元素

- **数据流**：一组固定成分的数据组成，表示数据的流向。除了流向数据存储和流出数据存储的数据流不需命名外，其余数据流都要命名
- **加工**：输入数据流到输出数据流之间的转换。每个加工都有编号(看出是哪个加工分解出的子加工)和名字
- **数据存储**：每个数据存储都有一个名字
- **数据源**：数据的发源地、归属地

# 三、数据流图步骤

- 确定系统的输入输出：扩大范围，把可能有的内容全部包括进去
- 由外向内构建系统的顶层数据流图：系统从外界接收了什么数据、系统向外界发送了什么数据
- 自顶向下逐层分解，绘制分层数据流图

# 四、数据流图注意

- 加工的输出数据流不应与输入数据流同名，即是成分相同；
- 允许一个加工有多条数据流流向另一个加工，也允许一个加工有两条相同的输出数据流向不同的加工；
- 数据存储首次出现且只与一个加工有关，那么这个数据存储作为加工的内部文件可不必画出；
- 数据守恒：每个加工必须既有输入数据流，又有输出数据流，反映此加工数据的来源与加工结果；
- 数据存储必须既有读的数据流，又有写的数据流。子图中可能存在只读不写或只写不读；

# 五、数据流图案例

1. 某高校学生选课系统有如下功能：学生根据开课情况和培养方案填写选课单，选课系统对每个学生的选课单进行处理。选课系统根据教学计划检查学生学分情况，计算上课时间如果不发生冲突，或冲突时间小于 20%，则可以选修。根据选课优先级，最后产生每个学生的个人课表和每门课程的选课名单。请分层画出该系统的顶层和 1 层的数据流图。
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857525078-ea8f06b2-c5d5-477c-8a3e-57502949cab6.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=152&id=uf0ff4163&margin=%5Bobject%20Object%5D&originHeight=179&originWidth=812&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u05f51a1c-fea2-4e51-9a03-680138dbc95&title=&width=689)
   选课系统顶层数据流图
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857525001-ca0e49c8-d2b8-4130-a9ff-c5e3086b23db.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=326&id=uaa777b09&margin=%5Bobject%20Object%5D&originHeight=453&originWidth=1022&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ua231b06f-dc79-49dc-9178-caeb65b6953&title=&width=736)
   选课系统 1 层数据流程
2. 目前住院病人主要由护士护理，这样做不仅需要大量护士，而且由于不能随时观察危重病人的病情变化，还会延误抢救时机。某医院打算开发一个以计算机为中心的患者监护系统，请画出数据流图医院对患者监护系统的基本要求是随时接收每个病人的生理信号（脉搏、体温、血压、心电图等），定时记录病人情况以形成患者日志，当某个病人的生理信号超出医生规定的安全范围时向值班护士发出警告信息，此外，护士在需要时还可以要求系统输出某个指定病人的病情报告。
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857524943-93e0c1e9-413b-4eef-bd1b-cae95722ca26.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=304&id=ufa890aaf&margin=%5Bobject%20Object%5D&originHeight=357&originWidth=890&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=uc1a6a972-0fb0-490f-9b94-0a21c6e767d&title=&width=758)
   患者监护系统顶层数据流程
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857524927-1b60f7d0-0034-45ba-aa29-6706fe862a6a.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u45e7e00b&margin=%5Bobject%20Object%5D&originHeight=396&originWidth=1062&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ue102f81d-49b9-45a0-b6a0-4675c53a235&title=)
   患者监护系统 1 层数据流程
3. 假设一家工厂的采购部每天需要一张订货报表，报表按零件编号排序，表中列出所有需要再次订货的零件。对于每个需要再次订货的零件应该列出下述数据：零件编号，零件名称，订货数量，目前价格，主要供应者，次要供应者。零件入库或出库称为事务，通过放在仓库中的 CRT 终端把事务报告给订货系统。当某种零件的库存数量少于库存量临界值时就应该再次订货。要求：画出系统的顶层模型、第一层模型和第二层模型。
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857524954-b0c31c7c-2607-454d-9ed7-8a0271c5c6ae.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=193&id=ub6dc2ae4&margin=%5Bobject%20Object%5D&originHeight=264&originWidth=1228&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ufa6d6369-91e8-4b98-8db2-9121f272d62&title=&width=897.2000732421875)
   订货系统顶层数据流程
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857525592-30e39d35-cec6-4744-8a1e-6dca15179fcd.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u3af5618a&margin=%5Bobject%20Object%5D&originHeight=358&originWidth=852&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u2b08ae4e-fbdb-442b-a905-5e2cf4ccc9f&title=)
   订货系统 1 层数据流图
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857525800-574ca4a1-15c0-4772-886b-5374626658e0.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=237&id=u113feeaa&margin=%5Bobject%20Object%5D&originHeight=307&originWidth=1084&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u6a43ecd1-dff5-44fb-9251-99dd7a57e36&title=&width=836)
   订货系统 2 层数据流图
4. 银行计算机储蓄系统的工作过程大致如下：储户填写的存款单或取款单由业务员键入系统，如果是存款则系统记录存款人姓名、住址（或电话号码）、身份证号码、存款类型、存款日期、到期日期、利率及密码（可选）等信息，并打印出存款存单给储户；如果是取款而且存款时留有密码，则系统首先核对储户密码，若密码正确或存款时未留密码，则系统计算利息并打印利息清单给储户。请用数据流图描绘本系统的功能。
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857525802-473fcd31-1d28-4282-b099-077e6a0f92e1.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u114af756&margin=%5Bobject%20Object%5D&originHeight=236&originWidth=656&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ued4f1fb6-1f9c-4665-9227-834b04ab416&title=)
   银行计算机储蓄系统顶层数据流程
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857525732-718c1fa4-c362-4597-bd52-b5216ee1a19b.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=245&id=u7ff5936f&margin=%5Bobject%20Object%5D&originHeight=308&originWidth=812&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ude6df673-cb24-4719-968e-5d154114ac8&title=&width=646)
   银行计算机储蓄系统 1 层数据流图
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857525739-1aaec6b0-215c-440b-b6e0-046e9f208d58.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=310&id=u8a278695&margin=%5Bobject%20Object%5D&originHeight=376&originWidth=1067&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=uff9d483a-380c-42b1-9eee-22c386c072b&title=&width=879)
   银行计算机储蓄系统 2 层数据流图
5. 为方便旅客，某航空公司拟开发一个机票预定系统。旅行社把预定机票的旅客信息（姓名、性别、工作单位、身份证号码、旅行时间、旅行目的地等）输入进入该系统，系统为旅客安排航班，印出取票通知和账单，旅客在飞机起飞的前一天凭取票通知和账单交款取票，系统校对无误即印出机票给旅客。画出系统的顶层及 1 层数据流图。
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857526156-904eab6f-7b73-49b4-b0fe-b21689c59ea4.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=233&id=u792d72bc&margin=%5Bobject%20Object%5D&originHeight=338&originWidth=1208&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ud0826888-a126-42a9-9cdd-27eef731d5b&title=&width=833.2000732421875)
   机票预订系统数据流图
   ![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1657857526400-76ed0479-57e3-4a78-9136-0dda7eecfe7d.jpeg#clientId=u67871e10-1272-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=299&id=u81ec6c9e&margin=%5Bobject%20Object%5D&originHeight=410&originWidth=1036&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=udecbce3c-75b8-418f-9309-0719b8d6ffc&title=&width=756)
   机票预订系统 1 层数据流图

[https://blog.csdn.net/qq_38230811/article/details/80798538](https://blog.csdn.net/qq_38230811/article/details/80798538)
