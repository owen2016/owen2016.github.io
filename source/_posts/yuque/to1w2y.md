---
title: UML图-总结
urlname: to1w2y
date: '2021-10-30 20:17:00 +0800'
tags: []
categories: []
---

## 概述

UML 图是软件工程的组成部分，软件工程从宏观的角度保证了软件开发的各个过程的质量。而 UML 作为一种建模语言，更加有效的实现了软件工程的要求

![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635602364455-bc0c252a-e554-4e4c-9422-ba0aa04cf7cc.png#clientId=u67980cd5-ed5c-4&from=paste&height=444&id=ua6fac574&margin=%5Bobject%20Object%5D&originHeight=619&originWidth=694&originalType=url∶=1&status=done&style=none&taskId=u28aa0f44-6b2a-4412-b0ce-37ab913b006&width=498)

**UML 定义了 5 类，9 种模型图**
**1.用例图**：展现了一组用例、参与者（actor）以及它们之间的关系。用例图从用户角度描述系统的静态使用情况，用于建立需求模型
**2.静态图**：包括类图，包图，对象图。

- 类图：展现了一组对象、接口、协作和它们之间的关系。类图描述的是一种静态关系，在系统的整个生命周期都是有效的，是面向对象系统的建模中最常见的图。
- 对象图：展现了一组对象以及它们之间的关系。对象图是类图的实例，几乎使用与类图完全相同的标示。

**3.行为图**：描述系统动态模型和对象组成的交换关系。包括状态图和活动图

- 活动图：一种特殊的状态图，展现了系统内一个活动到另一个活动的流程。活动图有利于识别并行活动。
- 状态图：由状态、转换、事件和活动组成，描述类的对象所有可能的状态以及事件发生时的转移条件。通常状态图是对类图的补充，仅需为那些有多个状态的、行为随外界环境而改变的类画状态图。

**4.交互图：**用于描述对象间的交互关系，由一组对象和它们之间的关系组成，包含它们之间可能传递的消息。交互图又分为序列图和协作图

- 序列图：对象之间的动态合作关系，强调对象发送消息的顺序，同时显示对象之间的交互
- 协作图：强调收发消息的对象的结构组织。

**5.实现图：**

- 部署图：展现了运行处理节点以及其中的组件的配置。部署图给出了系统的体系结构和静态实施视图。它与组件图相关，通常一个节点包含一个或多个构建。
- 组件图: 展现了一组组件的物理结构和组件之间的依赖关系。组件图有助于分析和理解组件之间的相互影响程度。

需要指出的是，UML 并不限定仅使用这 9 种图，开发工具可以采用 UML 来提供其他种类的图，但到目前为止，这 9 种图在实际应用中最常用的。

## 1. 用例图（UseCase Diagrams）

需求分析的第一步是确定系统能够做什么？谁来使用这个系统？

用例图主要用来描述 用户、需求、系统功能单元 之间的关系，主要回答了两个问题：1、是谁用软件。2、软件的功能。描述了作为一个外部的观察者的视角对系统的印象。强调这个系统是什么，而不是这个系统怎么工作。

用例图在三个领域很有作用。

- 决定特征（需求）。当系统已经分析好并且设计成型时，新的用例产生新的需求
- 客户通讯。使用用例图很容易表示开发者与客户之间的联系。
- 产生测试用例。一个用例的情节可能产生这些情节的一批测试用例。

![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635649292093-10d54333-d4f8-45eb-871d-c00c91c7c4b3.png#clientId=u25684858-bed7-4&from=paste&id=ud51baf9c&margin=%5Bobject%20Object%5D&originHeight=579&originWidth=583&originalType=url∶=1&status=done&style=none&taskId=u64f08d5e-a9e9-4b81-b5f8-88ee12ad5c3)

用例图所包含的元素如下：
**1.** **参与者(Actor)**
表示与您的应用程序或系统进行交互的用户、组织或外部系统。用一个小人表示。
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596449899-200d627e-9c58-423a-b796-98ca40e88d47.png#clientId=uef7ac64a-b779-4&from=paste&height=59&id=uf11245f4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=83&originWidth=66&originalType=url∶=1&size=370&status=done&style=none&taskId=ue953e1ad-3113-4dce-af04-b42613ddf46&width=47)
**2.** **用例(Use Case)**
用例就是外部可见的系统功能，对系统提供的服务进行描述。 用椭圆表示
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596449909-da4abef0-75c6-43df-ab60-411f5dbe2813.png#clientId=uef7ac64a-b779-4&from=paste&height=57&id=u0fb92da8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=72&originWidth=112&originalType=url∶=1&size=1171&status=done&style=none&taskId=uf64ef994-c64d-45b0-ba08-dfce69ba7ea&width=88)
**3.** **子系统(Subsystem)**
用来展示系统的一部分功能，这部分功能联系紧密。
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596449920-c1edddd7-6ffb-4926-b3c8-af307f3010f9.png#clientId=uef7ac64a-b779-4&from=paste&height=276&id=u1eb52c65&margin=%5Bobject%20Object%5D&name=image.png&originHeight=310&originWidth=403&originalType=url∶=1&size=4229&status=done&style=none&taskId=u3376dec3-1ba7-4ae6-ab1c-5f0727a7dfe&width=359)
**4.** **关系**
用例图中涉及的关系有：关联、泛化、包含、扩展；
如下表所示：

| 关系类型 | 说明                       | 表示符号                                                                                                                                                                                                                                                                                                                                          |
| -------- | -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 关联     | 参与者与用例间的关系       | ![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596449908-d9a9ed9b-072b-47eb-b3e0-65eb1f826e62.png#clientId=uef7ac64a-b779-4&from=paste&id=u8ff1b7bf&margin=%5Bobject%20Object%5D&name=image.png&originHeight=22&originWidth=111&originalType=url∶=1&size=255&status=done&style=none&taskId=u0ddd4356-7427-45a9-a7a7-a18bf9fbd45) |
| 泛化     | 参与者之间或用例之间的关系 | ![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596449910-206c12f0-27c8-4c7c-90dd-07a758e93c6c.png#clientId=uef7ac64a-b779-4&from=paste&id=u930e8adb&margin=%5Bobject%20Object%5D&name=image.png&originHeight=21&originWidth=110&originalType=url∶=1&size=275&status=done&style=none&taskId=ud5a139fd-3539-4ce2-a28f-8ceb0681cb5) |
| 包含     | 用例之间的关系             | ![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450304-5545266c-597c-4f56-93ee-f5a21d930c33.png#clientId=uef7ac64a-b779-4&from=paste&id=u8401f551&margin=%5Bobject%20Object%5D&name=image.png&originHeight=31&originWidth=108&originalType=url∶=1&size=352&status=done&style=none&taskId=u8c48990a-0945-45d5-93a0-3dbcd48bd32) |
| 扩展     | 用例之间的关系             | ![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450442-2a679dde-2183-4dd6-98af-b165baa892e1.png#clientId=uef7ac64a-b779-4&from=paste&id=u51609593&margin=%5Bobject%20Object%5D&name=image.png&originHeight=34&originWidth=111&originalType=url∶=1&size=347&status=done&style=none&taskId=u756e5c81-368d-4d6d-a659-3081ceb9c2b) |

**a.** **关联(Association)**
表示参与者与用例之间的通信，任何一方都可发送或接受消息。【箭头指向】：指向消息接收方

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450482-c8ecdd09-2953-4f57-b77a-7b2ed23182ce.png#clientId=uef7ac64a-b779-4&from=paste&id=u7696aac1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=83&originWidth=282&originalType=url∶=1&size=1572&status=done&style=none&taskId=ub3db5da2-6878-4daf-b5b1-2552f1d2c2f)
**b.** **泛化(Inheritance)**
就是通常理解的继承关系，子用例和父用例相似，但表现出更特别的行为；子用例将继承父用例的所有结构、行为和关系。子用例可以使用父用例的一段行为，也可以重载它。父用例通常是抽象的。【箭头指向】：指向父用例
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450484-c7d29ccf-1388-4378-acc8-3ad80da4c7bf.png#clientId=uef7ac64a-b779-4&from=paste&id=ue869cde4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=197&originWidth=525&originalType=url∶=1&size=5033&status=done&style=none&taskId=u08aacd2d-695b-4b47-9fe1-59366687126)
**c.** **包含(Include)**
包含关系用来把一个较复杂用例所表示的功能分解成较小的步骤；【箭头指向】：指向分解出来的功能用例
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450671-e41efa81-ec99-4f7b-922e-e12918ac56df.png#clientId=uef7ac64a-b779-4&from=paste&id=u8e1ade31&margin=%5Bobject%20Object%5D&name=image.png&originHeight=175&originWidth=419&originalType=url∶=1&size=3958&status=done&style=none&taskId=ucaad83a2-112b-4ee3-a57d-ba7a299fbf0)
**d.** **扩展(Extend)**
扩展关系是指 用例功能的延伸，相当于为基础用例提供一个附加功能。【箭头指向】：指向基础用例
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450873-9ce004b2-238f-4112-a051-95efb774a6bc.png#clientId=uef7ac64a-b779-4&from=paste&id=ud2449e87&margin=%5Bobject%20Object%5D&name=image.png&originHeight=166&originWidth=280&originalType=url∶=1&size=3655&status=done&style=none&taskId=u30f04773-d8d7-40e5-9a54-be8e46d6fda)

**e.** **依赖(Dependency)**
以上 4 中关系，是 UML 定义的标准关系。 但 VS2010 的用例模型图中，添加了依赖关系，用带箭头的虚线表示
表示源用例依赖于目标用例；【箭头指向】：指向被依赖项
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450882-8320cd32-f4cd-4371-a040-3f7a4fb47514.png#clientId=uef7ac64a-b779-4&from=paste&id=ufc5a4fc6&margin=%5Bobject%20Object%5D&name=image.png&originHeight=83&originWidth=295&originalType=url∶=1&size=1686&status=done&style=none&taskId=u6d74791a-b797-4028-b241-0e9cd180f7f)
**5.** **项目(Artifact)**
用例图虽然是用来帮助人们形象地理解功能需求，但却没多少人能够通看懂它。很多时候跟用户交流甚至用 Excel 都比用例图强，VS2010 中引入了“项目”这样一个元素，以便让开发人员能够在用例图中链接一个普通文档。
用依赖关系把某个用例依赖到项目上
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596450972-fa7c0f2c-6835-4b63-b1f2-ae320de1a695.png#clientId=uef7ac64a-b779-4&from=paste&id=u82af5e66&margin=%5Bobject%20Object%5D&name=image.png&originHeight=72&originWidth=360&originalType=url∶=1&size=2564&status=done&style=none&taskId=u8358112f-5b86-401b-8e8e-c9cefb655e3)
然后把项目-》属性 的 Hyperlink 设置到你的文档上，这样当你在用例图上 双击项目时，就会打开相关联的文档。

**6.** **注释(Comment)**
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596451318-2576669c-8b2c-4270-a461-5bf41c29950d.png#clientId=uef7ac64a-b779-4&from=paste&id=uf1fdcd2c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=87&originWidth=345&originalType=url∶=1&size=2755&status=done&style=none&taskId=u48cb50f6-829c-4a43-add8-abf53d8d3be)

**包含(include)、扩展(extend)、泛化(**Inheritance**) 的区别：**
条件性：泛化中的子用例和 include 中的被包含的用例会无条件发生，而 extend 中的延伸用例的发生是有条件的；
直接性：泛化中的子用例和 extend 中的延伸用例为参与者提供直接服务，而 include 中被包含的用例为参与者提供间接服务。
对 extend 而言，延伸用例并不包含基础用例的内容，基础用例也不包含延伸用例的内容。
对 Inheritance 而言，子用例包含基础用例的所有内容及其和其他用例或参与者之间的关系；

**一个用例图示例：**
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596451423-d29f4ec8-ac77-472d-ba7a-810ba6dd6f58.png#clientId=uef7ac64a-b779-4&from=paste&id=uf2730910&margin=%5Bobject%20Object%5D&name=image.png&originHeight=263&originWidth=558&originalType=url∶=1&size=18519&status=done&style=none&taskId=u92d3dde2-f113-4727-899a-9040f666ceb)

**牢骚：**
感觉用例图还不成熟，并不能很好地表达系统的需求， 没有 UML 背景的用户几乎不知道画的些什么。
其次，包含关系、扩展关系 的箭头符号竟然是同样的箭头，仅靠上方写个文字来加以区别，翻译成其他语言的话，几乎就不知道代表什么意思。 扩展关系的箭头朝向也很难理解，为何要指向基用例，而不指向扩展用例

**用例描述表：**
鉴于用列图并不能清楚地表达功能需求，开发中大家通常用描述表来补充某些不易表达的用例，下图的表给大家提供一个参考：
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635596451565-c33b3fe5-377c-4ce2-81fa-4c8669626d13.png#clientId=uef7ac64a-b779-4&from=paste&height=327&id=u58ac0d0b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=323&originWidth=558&originalType=url∶=1&size=30696&status=done&style=none&taskId=u20ab496f-48f6-487d-a40d-e4e008ffa4f&width=565)

## 2. 类图（Class Diagrams）

用户根据用例图抽象成类，描述类的内部结构和类与类之间的关系，是一种静态结构图。 在 UML 类图中，常见的有以下几种关系: 泛化（Generalization）, 实现（Realization），关联（Association)，聚合（Aggregation），组合(Composition)，依赖(Dependency)。
![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635644673311-7b09f915-0968-4c96-8d95-808c2c19979a.png#clientId=ue01307b8-45f4-4&from=paste&id=u76b7b2ef&margin=%5Bobject%20Object%5D&originHeight=383&originWidth=773&originalType=url∶=1&status=done&style=none&taskId=u21248269-75e0-4ae8-a542-3407b0156c9)
**各种关系的强弱顺序：**
**泛化= 实现> 组合> 聚合> 关联> 依赖**

### 1.泛化(Generalization)

**【泛化关系】：**是一种继承关系,它指定了子类如何特化父类的所有特征和行为例如：老虎是动物的一种.
**【箭头指向】：**带三角箭头的实线，箭头指向父类

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299048-571d1070-1150-41ab-9ea6-2642967688e1.png#clientId=u67980cd5-ed5c-4&from=paste&height=243&id=ubc46ad46&margin=%5Bobject%20Object%5D&name=image.png&originHeight=315&originWidth=202&originalType=url∶=1&size=6084&status=done&style=none&taskId=u8dd73139-e7b8-494a-b1ba-89587fac76e&width=156)

### 2.实现（Realization)

**【实现关系】：**是一种类与接口的关系，表示类是接口所有特征和行为的实现
**【箭头指向】：**带三角箭头的虚线，箭头指向接口

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299050-81797651-8a33-4d67-b30b-fba80a5989ce.png#clientId=u67980cd5-ed5c-4&from=paste&id=u4be2b309&margin=%5Bobject%20Object%5D&name=image.png&originHeight=284&originWidth=204&originalType=url∶=1&size=6222&status=done&style=none&taskId=udbdcc1fd-ab41-4303-bbae-1b5858c380c)

### 3.关联（Association）

**【关联关系】：**是一种拥有的关系,它使一个类知道另一个类的属性和方法；如：老师与学生，丈夫与妻子
关联可以是双向的，也可以是单向的。双向的关联可以有两个箭头或者没有箭头，单向的关联有一个箭头。
**【代码体现】：**成员变量
**【箭头及指向】：**带普通箭头的实心线，指向被拥有者

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299065-09ed2954-3713-43e1-a538-2e180f1f79e0.png#clientId=u67980cd5-ed5c-4&from=paste&id=ub6124ff2&margin=%5Bobject%20Object%5D&name=image.png&originHeight=159&originWidth=558&originalType=url∶=1&size=18584&status=done&style=none&taskId=u5ce725c2-9ef8-4f5c-9494-5b57b08ec8f)

上图中，老师与学生是双向关联，老师有多名学生，学生也可能有多名老师。但学生与某课程间的关系为单向关联，一名学生可能要上多门课程，课程是个抽象的东西他不拥有学生。

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299067-f58562ef-689e-40dc-89f7-dfe5afe1b6a9.png#clientId=u67980cd5-ed5c-4&from=paste&id=u4c2ee1cb&margin=%5Bobject%20Object%5D&name=image.png&originHeight=180&originWidth=233&originalType=url∶=1&size=4824&status=done&style=none&taskId=u4c44cefa-18a7-477d-9d19-04270f9e611)

**上图为自身关联：**

### 4. 聚合（Aggregation）

**【聚合关系】：**是整体与部分的关系.如车和轮胎是整体和部分的关系.
聚合关系是关联关系的一种，是强的关联关系；关联和聚合在语法上无法区分，必须考察具体的逻辑关系。
是一种“弱”的拥有关系，体现的是 A 对象可以包含 B 对象，但是 B 对象不是 A 对象的一部分
**【代码体现】：**成员变量
**【箭头及指向】：**带空心菱形的实心线，菱形指向整体

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299067-e3d0c44b-ea71-4557-8d9f-58642140a2cd.png#clientId=u67980cd5-ed5c-4&from=paste&id=u75c1b608&margin=%5Bobject%20Object%5D&name=image.png&originHeight=319&originWidth=389&originalType=url∶=1&size=7814&status=done&style=none&taskId=u91ca8b35-31c7-4bc2-ac80-3eecfd65e3c)

### 5. 组合(Composition)

**【组合关系】：**是整体与部分的关系.,没有公司就不存在部门 组合关系是关联关系的一种，是比聚合关系还要强的关系，它要求普通的聚合关系中代表整体的对象负责代表部分的对象的生命周期
是一种“强”的拥有关系，体现了严格的部分与整体的关系，部分与整体的生命周期一样
**【代码体现】：**成员变量
**【箭头及指向】：**带实心菱形的实线，菱形指向整体

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299823-17113a68-7a8f-49a5-b22c-638c11e1e561.png#clientId=u67980cd5-ed5c-4&from=paste&id=ud91c71c3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=299&originWidth=218&originalType=url∶=1&size=6519&status=done&style=none&taskId=u27c7dbe3-fd27-4808-ac6c-24fcf2fe580)

### 6. 依赖(Dependency)

**【依赖关系】：**是一种使用的关系,所以要尽量不使用双向的互相依赖
**【代码表现】：**局部变量、方法的参数或者对静态方法的调用
**【箭头及指向】：**带箭头的虚线，指向被使用者

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299887-b0969b0e-ff2f-487a-80da-55b1fa2f05f3.png#clientId=u67980cd5-ed5c-4&from=paste&id=u4fba445f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=265&originWidth=196&originalType=url∶=1&size=6246&status=done&style=none&taskId=u62908373-68a9-44d7-8c11-38dfc5b356e)

**下面这张 UML 图，比较形象地展示了各种类图关系：**

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635601299900-70f37f22-c88c-4239-b17b-8d9ab7ca728a.png#clientId=u67980cd5-ed5c-4&from=paste&id=ue0efb15f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=645&originWidth=794&originalType=url∶=1&size=26271&status=done&style=none&taskId=u50fb9579-05ba-4ab7-80c9-65df6eead4b)

## 3. 对象图（Object Diagrams）

描述的是参与**交互的各个对象在交互过程中某一时刻的状态**。对象图可以被看作是类图在某一时刻的实例。

## 4. 状态图（Statechart Diagrams）

显示一个对象从生成到删除的生命周期中相应事件所经历的状态序列以及它们对哪些事件的相应。 分析人员和开发人员通过状态图更好的了解类的动态行为，使编码前能讨论和建立复杂逻辑。

## 5. 活动图（Activity Diagrams）

交互图强调的是对象到对象的控制流，而活动图则强调的是从活动到活动的控制流。

活动图 activity diagram 是一个很特别的流程图。活动图和状态图之间是有关系的。状态图把焦点集中在过程中的对象身上，而活动图则集中在一个单独过程动作流程。活动图告诉了我们活动之间的依赖关系。

我们的例子来说，我们使用如下的过程。
“通过 ATM 来取钱。”
这个活动有三个类 Customer, ATM 和 Bank。整个过程从黑色圆圈开始到黑白的同心圆结束。活动用圆角矩形表示。

活动图可以被分解成许多对象泳道 swimlanes ，可以决定哪些对象负责那些活动。每个活动都有一个单独的转移 transition 连接这其他的活动。
转移可能分支 branch 成两个以上的互斥的转移。保护表达式（在[]中）表示转移是从一个分支中引出的。分支以及分支结束时的合并 merge 在图中用菱形表示。
转移也可以分解 fork 成两个以上的并行活动。分解以及分解结束时的线程结合 join 在图中用粗黑线表示
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635645194033-a0a42f93-ca74-470c-a975-d25e8c71e9ee.png#clientId=ue01307b8-45f4-4&from=paste&height=426&id=u87b8158a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=783&originWidth=830&originalType=binary∶=1&size=90480&status=done&style=none&taskId=u0c90178b-e15d-4ec4-b418-00c07b775cf&width=452)

![](https://cdn.nlark.com/yuque/0/2021/jpeg/5374140/1635601637657-ee3fc793-ec2a-4919-8723-897293228d00.jpeg#clientId=u67980cd5-ed5c-4&from=paste&id=uff6327b5&margin=%5Bobject%20Object%5D&originHeight=329&originWidth=435&originalType=url∶=1&status=done&style=none&taskId=ude524ab6-2d22-47de-bbaf-ff9e62a5f6e)

## 6. 时序图（Sequence Diagrams）

时序图（Sequence Diagram），亦称为序列图、循序图或顺序图，是一种 UML 交互图。它通过描述对象之间发送消息的时间顺序显示多个对象之间的动态协作。时序图是一个二维图，横轴表示对象，纵轴表示时间，消息在各对象之间横向传递，依照时间顺序纵向排列。

### 1) 时序图的作用是什么？

1、展示对象之间交互的顺序。将交互行为建模为消息传递，通过描述消息是如何在对象间发送和接收的来动态展示对象之间的交互；
2、相对于其他 UML 图，时序图更强调交互的时间顺序；
3、可以直观的描述并发进程。

### 2) 组成元素有哪些？

**1. 角色（Actor）**
系统角色，可以是人、机器、其他系统、子系统；

**2. 对象（Object）**

（1）对象的三种命名方式

- 第一种方式包括对象名和类名，例如：直播课时:课时，在时序图中，**用“对象：类”表示**；
- 第二种方式只显示类名，即表示它是一个匿名对象，例如： :课程；在时序图中，**用“：类”表示**；
- 第三种方式只显示对象名不显示类名，例如：讲师；在时序图中，用“对象”表示。

（2）命名方式的选择
三种命名方式均可，哪种最容易让阅读该时序图的人理解，就选择哪种。

（3）对象的排列顺序
对象的左右顺序并不重要，但是为了作图清晰整洁，通常应遵循以下两个原则：**1.把交互频繁的对象尽可能的靠拢；2.把初始化整个交互活动的对象放置在最左端。**

**3. 生命线（Lifeline）**
在时序图中表示为从对象图标向下延伸的一条虚线，表示对象存在的时间。

**4. 控制焦点（Focus of Control）**
又称为激活期，表示时间段的符号，在这个时间段内对象将执行相应的操作。它可以被理解成 C 语言语义中一对花括号{ }中的内容；用小矩形表示。

**5. 消息（Message）**
**消息一般分为同步消息（Synchronous Message），异步消息（Asynchronous Message）和返回消息（Return Message）。**

- 消息的发送者把控制传递给消息的接收者，然后停止活动，等待消息的接收者放弃或者返回控制。用来表示同步的意义；
- 消息发送者通过消息把信号传递给消息的接收者，然后继续自己的活动，不等待接受者返回消息或者控制。异步消息的接收者和发送者是并发工作的。
- 返回消息表示从过程调用返回。

**6. 自关联消息**
表示方法的自身调用或者一个对象内的一个方法调用另外一个方法。
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635748362525-4eee8273-6f15-4ea5-a6a7-8f806eac3bc7.png#clientId=u69d38362-af57-4&from=paste&height=499&id=u414a1ed5&margin=%5Bobject%20Object%5D&name=image.png&originHeight=756&originWidth=904&originalType=url∶=1&size=224902&status=done&style=none&taskId=ue0b215b5-501f-4d6a-ae0b-f1a5380807b&width=597)

**7. 组合片段**
组合片段用来解决交互执行的条件和方式，它允许在序列图中直接表示逻辑组件，用于通过指定条件或子进程的应用区域，为任何生命线的任何部分定义特殊条件和子进程。组合片段共有 13 种，名称及含义如下：
![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635746227453-31ea1912-8839-43ea-92ab-e3d62ae44b0b.png#clientId=u69d38362-af57-4&from=paste&id=uc46f13f1&margin=%5Bobject%20Object%5D&originHeight=567&originWidth=665&originalType=url∶=1&status=done&style=none&taskId=u00d7e2a7-8d69-41d5-aebc-09001a792ed)

**常用组合片段举例：**用来指明在两个或更多的消息序列之间的互斥的选择，相当于经典的 if..else..
**（1）抉择（Alt）**
抉择在任何场合下只发生一个序列。 可以在每个片段中设置一个临界来指示该片段可以运行的条件。else 的临界指示其他任何临界都不为 True 时应运行的片段。如果所有临界都为 False 并且没有 else，则不执行任何片段。
![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635746382745-83814503-abca-4939-b2bf-ea2486a60ef7.png#clientId=u69d38362-af57-4&from=paste&id=ub244113d&margin=%5Bobject%20Object%5D&originHeight=402&originWidth=558&originalType=url∶=1&status=done&style=none&taskId=u46686680-12a1-4834-b16f-bf08498f9e1)
（2）选项（Opt）
包含一个可能发生或不发生的序列；
![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635746382746-c4c62ff4-07aa-44eb-bd34-df232af4e696.png#clientId=u69d38362-af57-4&from=paste&id=u373fd358&margin=%5Bobject%20Object%5D&originHeight=312&originWidth=558&originalType=url∶=1&status=done&style=none&taskId=ud8eb08fa-ede9-4a8e-a12a-1ad96461e61)
（3）循环（Loop）
片段重复一定次数，可以在临界中指示片段重复的条件。
![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635746382982-cd8c20ac-1e1d-4f93-ae90-b80892774d0b.png#clientId=u69d38362-af57-4&from=paste&id=u3d02f0a7&margin=%5Bobject%20Object%5D&originHeight=263&originWidth=369&originalType=url∶=1&status=done&style=none&taskId=u149b458c-e682-470c-8ff4-207858909d3)
（4）并行（Par）
![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635746383666-22ebfbf7-b2d7-44c6-a6e2-333168052f92.png#clientId=u69d38362-af57-4&from=paste&height=413&id=uae41eeef&margin=%5Bobject%20Object%5D&originHeight=497&originWidth=384&originalType=url∶=1&status=done&style=none&taskId=u4de1ed26-ada9-4ad3-b570-52c5ffffe52&width=319)

### 3）时序图的画法及实例

时序图的绘制步骤可简单总结如下：

- 划清边界，识别交互的语境；
- 将所要绘制的交互场景中的角色以及对象梳理出来；
- 从触发整个交互的某个消息开始，在生命线之间从上到下依次画出所有消息，并注明每个消息的特性（如参数等）。

接下来，我们按照上面所讲的时序图的绘制步骤，以学生在教务系统中查询其课程的成绩为例，来讲解时序图的绘制方法。

**1、划清边界，识别交互的语境**
所谓划清边界，就是要界定好自己所要画的时序图的范围，“学生在教务系统中查询其课程的成绩”就是所要绘制的时序图的交互内容，不用往上延伸到用户登录，也不要往下延伸到下载成绩单。
识别交互的语境，即是读懂所要画的时序图的前提和背景。比如本例中，既然学生可以查询成绩，那么该学生肯定已经注册并认证过其身份，并可选择其所考试的课程查询相应成绩。

**2、梳理角色和对象**
在本例中，角色有学生，对象有教务系统、课程、成绩。
对象的梳理是一个相对主观的过程，比如本例中，课程以及成绩分别作为了对象存在，也可以合并为数据库这一个对象。

请注意：角色以及对象，都为名词，动词不可作为角色和对象，如“成绩查询”不可作为对象。

![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635746641312-1d064301-2161-432f-9276-85c614a9a9aa.png#clientId=u69d38362-af57-4&from=paste&height=425&id=u511a1d4b&margin=%5Bobject%20Object%5D&originHeight=611&originWidth=713&originalType=url∶=1&status=done&style=none&taskId=ue0994e6f-d14e-4134-9980-4f4a0cadcd1&width=496)
**3、添加消息**
学生的登录验证作为本时序图的前置行为，可直接引用到本时序图中，也可忽略不画；学生进入成绩查询页面后，页面会加载本学生的成绩查询课程列表，并显示出课程对应的成绩；
![](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635746433447-bda9cfdf-3a8f-4418-99e9-99412acbc172.png#clientId=u69d38362-af57-4&from=paste&height=357&id=u8e0f9b4a&margin=%5Bobject%20Object%5D&originHeight=611&originWidth=713&originalType=url∶=1&status=done&style=none&taskId=uf9d2d186-1b19-4cac-adee-eed1e1f2c4e&width=417)

## 7. 协作图（Collaboration Diagrams）

交互图的一种，描述了收发消息的对象的组织关系，**强调对象之间的合作关系**。时序图按照时间顺序布图，而协作图按照空间结构布图，不关心什么时候消息被传递，只关心对象的角色
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635644973796-1b2d09b7-cda1-4d7d-8798-e8b06b941055.png#clientId=ue01307b8-45f4-4&from=paste&height=251&id=ue9f4978d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=430&originWidth=832&originalType=binary∶=1&size=61105&status=done&style=none&taskId=ud5f5d373-bfc6-4f1c-ba25-fe2bb281d1c&width=485)
对象角色矩形上标有类或对象名（或者都有）。类名前面有个冒号（：）。
协作图的每个消息都有一个序列号。顶层消息的数字是 1。同一个等级的消息（也就是同一个调用中的消息）有同样的数字前缀，再根据他们出现的顺序增加一个后缀 1，2 等等。

## 8. 组件图 （Component Diagrams）

表示一组组件之间的组织和依赖关系 编译和部署系统的人员需要使用组件图。显示了类与实现组件之间的映射，组件按什么顺序编译，编译时生成哪些运行组件 构件图对于通过正向工程和逆向工程构造可执行系统是重要的

## ![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635645288727-dfaf24de-554c-47ac-87e0-370f365cdaa5.png#clientId=ue01307b8-45f4-4&from=paste&height=350&id=u67a2214e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=460&originWidth=891&originalType=binary∶=1&size=54362&status=done&style=none&taskId=u4cd0a0be-2f09-4eef-861d-92f89d45dbd&width=677.5)

## 9. 部署图 （Deployment Diagrams）：

建模系统的实际部署 项目管理员，用户，分析员和部署人员通过实施图了解，显示网络的实际布局和网络节点上组件的配置
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1635602054833-afec0cac-205e-4eb9-aa67-4ecc788a2920.png#clientId=u67980cd5-ed5c-4&from=paste&height=315&id=u3732ab79&margin=%5Bobject%20Object%5D&name=image.png&originHeight=441&originWidth=567&originalType=url∶=1&size=40984&status=done&style=none&taskId=u3da962c1-ded3-48d9-bb71-180edab7d58&width=405)

## 图的差异比较

### 1.序列图(时序图)VS 协作图

序列图和协作图都是交互图。二者在语义上等价，可以相互转化。但是侧重点不同：序列图侧重时间顺序，协作图侧重对象间的关系。

- 共同点：时序图与协作图均显示了对象间的交互。
- 不同点：时序图强调交互的时间次序。协作图强调交互的空间结构。

### 2.状态图 VS 活动图

状态图和活动图都是行为图。状态图侧重从行为的结果来描述，活动图侧重从行为的动作来描述。状态图描述了一个具体对象的可能状态以及他们之间的转换。在实际的项目中，活动图并不是必须的，需要满足以下条件：

- 1、出现并行过程&行为；
- 2、描述算法；
- 3、跨越多个用例的活动图。

### 3.活动图 VS 交互图

二者都涉及到对象和他们之间传递的关系。区别在于交互图观察的是传送消息的对象，而活动图观察的是对象之间传递的消息。看似语义相同，但是他们是从不同的角度来观察整个系统的。
