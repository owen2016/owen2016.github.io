---
title: 系统设计之架构图
urlname: ikzr14
date: '2022-06-20 23:37:34 +0800'
tags: []
categories: []
---

软件领域发展到今天，延伸出了企业架构、业务架构、应用架构、数据架构、产品架构、技术架构等一堆的名词。是不是有点晕了，这些架构都是用来干什么，它们之间有什么区别？不搞清楚它们之间的关系，产品架构从何谈起。

## 架构图的定义

往往系统是非常复杂的，无法一下子全部表达清楚，架构要涵盖的内容和决策太多了，超过了人脑"一蹴而就"的能力范围，因此采用"分而治之"的办法从不同视角分别设计。
也就是说架构图是对系统从某种维度视角的表达，**每一种架构图，都是一种视角。**它的作用有两个：划分目标系统边界; 将目标系统的结构可视化.
**一个架构视图，是对系统从某一个视角或某一点上看到的，所做的简化的描述，涵盖了系统的某一个特定方面，忽略了此方面无关的实体。**
架构图，是可视化的，是给人看的。所以，归根结底是为了交流理解。

1. 对上，经常需要汇报，争取领导层的认同支持。
1. 对己，借助多种视图来厘清思路。
1. 对下，用不同视角来表达自己的想法，沟通交流。

对于架构设计师来说，架构图，是一种非常“硬核”的必要能力。

## 架构图的分类

- **业务架构**：需求初期业务的结果和过程描述一般比较模糊，可能来自于某个老板、运营或用户的反馈。_客户说海尔洗衣机洗土豆会堵，海尔立马设计专门的土豆洗衣机_ 业务方向往往是定方向和结果的叫战略，主要包括业务规划、业务模块和流程以及问题域的列表等。
- **应用架构：**服务复用、跨组协同，简单、灵活、整合是应用架构必须考虑的点，就像你要上线一个聊天功能，那么聊天内容的输入法、文字识别、舆情监控以及视频服务、支付服务等，它们都是在应用架构分层下沉淀到平台的产物，在供各个方使用。
- **产品架构：**业务提需求，产品定方案，**相对于业务的粗放流程，产品架构会更加细腻以及考虑各个模块的分层和边界**。
- **数据架构**：数据的获取、数据的存放和数据的使用是数据架构要解决的三个问题，数据库存放、大数据汇总、数据分析等。
- **技术架构：**是离程序员最近的架构设计，它不仅是系统搭建的架构图设计，还包括了结构、功能、流程、逻辑等内容。它的具体描述就是整个系统如何落地的具体实现方案

![](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655742643463-3fb32fc7-c073-4cd2-a06f-761b3b46faea.png#clientId=u1bcd7285-1704-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=IltPE&margin=%5Bobject%20Object%5D&originHeight=384&originWidth=574&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u97b42e61-6659-46a7-b7a4-80c916b8610&title=)
现在很多人在推崇“**RUP+1**”方法，或者**C4 模型**方法来画架构图，这种架构图表达方式，更适合上面说的对己、对下来交流。
但是实际工作场景中，尤其是对上汇报中，经常需要的是如下几种架构图。
![](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655775097771-9a7b88ef-7992-42f0-82ac-bd8fae017149.png#clientId=ubffeeb89-afc0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=364&id=u4af81e8c&margin=%5Bobject%20Object%5D&originHeight=375&originWidth=602&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u8128f4da-f8ec-4921-9403-d8b0c473875&title=&width=584)

### 1） 业务架构图

业务架构：使用一套方法论/逻辑对产品（项目）所涉及到的业务进行边界划分。所以熟悉业务是关键。**简单来说，是从业务、产品视角，描述整个平台、或某个产品的实现。**
比如做一个团购网站，你需要把商品类目、商品、订单、订单服务、支付、退款等进行清晰划分，**而业务架构不需要考虑诸如我用什么技术开发、我的并发大怎么办、我选择什么样的硬件等等。**
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655740659456-1b3b30b3-4e36-4bcc-ba44-45e881de26d2.png#clientId=ueae83a84-81c4-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=udb0a8857&margin=%5Bobject%20Object%5D&name=image.png&originHeight=472&originWidth=720&originalType=url∶=1&rotation=0&showTitle=false&size=353414&status=done&style=none&taskId=u528fecdb-baba-48f3-8a16-49a628f6408&title=)
业务架构是指企业通过分析自身所处的外界环境，自身面临的机遇和挑战，同时剖析自身的结构特点和资源情况，明确自身优劣势，从而选择和制定企业发展目标，制定具体的实施方案和计划。
核心要素主要包括业务目标、资源能力、业务流程和组织结构；放在企业层面是企业业务目标，放在部门层面是部门业务目标。
对业务架构我们要思考一下的问题：

- 达成的目标是什么；
- 做什么业务；
- 资源和能力在哪里；
- 什么样方式在什么样的组织里做；

举例来说：企业采购业务的业务架构

- 业务目标：合理、合规、高效、节约的方式为集团各部门提供寻源、合同签订、订单执行等服务，保障和保本各运营业务线的运行。
- 资源能力：品类丰富、规模优势、采购模式多样，具备一定的市场话语权。
- 业务流程：以集团统管的方式，实现供应商交付，需求部门验收的上下游流程一体化的格局。
- 组织结构：建立集采、分采等采购团队，集中管控+授权自购的组织体系。

### 2） 应用架构图

应用架构（Application Architecture）是描述了 IT 系统功能和技术实现的内容。应用架构分为以下两个不同的层次：

- **企业级的应用架构：**企业层面的应用架构起到了统一规划、承上启下的作用，向上承接了企业战略发展方向和业务模式，向下规划和指导企业各个 IT 系统的定位和功能。在企业架构中，应用架构是最重要和工作量最大的部分，他包括了企业的应用架构蓝图、架构标准/原则、系统的边界和定义、系统间的关联关系等方面的内容。
- **单个系统的应用架构：**在开发或设计单一 IT 系统时，设计系统的主要模块和功能点，系统技术实现是从前端展示到业务处理逻辑，到后台数据是如何架构的。这方面的工作一般属于项目组，而不是企业架构的范畴，不过各个系统的架构设计需要遵循企业总体应用架构原则。

简而言之，应用架构图分为两类，

- **一类为多系统应用架构，用来分层次说明不同系统间的业务逻辑关系、信息流、系统边界等等。**
- **一类为单系统应用架构，用来分层次说明系统主要组成模块和功能点之间的业务逻辑关系。**

应用架构是描述一个企业各个相互独立的应用系统的部署以及核心业务流程之间的关系，目的是建立业务架构与数据架构和其他架构之间的关联；它能连接业务架构的流程，功能，人员，也能够连接数据架构中的数据管理和使用，还能提出对技术架构的要求。
主要分为表现层、应用层和数据层来表示
![](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655743107543-788f792f-222b-40d6-bd76-d9db4d9258a3.png#clientId=uf015c360-51e4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=241&id=u1533e78a&margin=%5Bobject%20Object%5D&originHeight=285&originWidth=593&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u0b4948df-a40e-4494-bd09-34ea93fe88a&title=&width=501)

**产品架构是产品的结构，是对某一块具体业务的进行抽象**，并用可视化的方式呈现出来，它划分了功能模块、数据流向，包括现有的，以及未来规划的。其目的不仅是为了架构设计的简洁性，更是为了整个业务的完整性，把离散的业务过程场景化。
**产品架构和应用架构的关系？**
产品架构是应用架构的一部分，当应用架构只有一个产品时，也就是产品架构。多个产品组合一起形成了企业应用架构全景图。

#### 多系统业务架构图

![](https://cdn.nlark.com/yuque/0/2022/webp/5374140/1655784024817-4dd02d62-7b50-4b99-9f0c-69b9569d9a66.webp#clientId=ubcde7e11-5334-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=546&id=uf711cd56&margin=%5Bobject%20Object%5D&originHeight=603&originWidth=648&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u31176248-9516-4b9a-a42b-eae3bff3175&title=&width=587)
业务架构图按照层次结构可以分为经典的三层结构：展现层、业务逻辑层和数据层，而上图作者在该基础上又分别对展现层和业务逻辑层做了细分。在上图的基础上其实还可以加上一层运维层来说明系统所需要的硬件条件。对于单个系统的架构图而言尤其重要。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655784610896-5dc495ab-70ad-4f1c-9743-a47e13e272c6.png#clientId=ubcde7e11-5334-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=358&id=u6c3462a0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=486&originWidth=845&originalType=binary∶=1&rotation=0&showTitle=false&size=60717&status=done&style=none&taskId=u324c7bb7-ef6b-44e6-901b-ce886ef6cc1&title=&width=623)
**使用多系统应用架构图还有一个好处在于，每当有新增的子系统时，可以提前预判是否需要共用哪些单元或者业务逻辑。例如是否用同一套账户体系，这对产品前期开发至关重要。**

#### 单系统业务架构图

对于一个从 0 到 1 的项目而言，产品经理除了要了解这个项目在整个企业应用架构中的定位，还要对整个系统的模块和功能有着清晰的分层次设计和了解。所以产品经理就不仅需要多系统业务架构图，也需要单系统业务架构图。
\*\*![](https://cdn.nlark.com/yuque/0/2022/webp/5374140/1655784071612-8f9fdee4-5665-46b9-9bbd-e86530bfa32f.webp#clientId=ubcde7e11-5334-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=399&id=u118125a9&margin=%5Bobject%20Object%5D&originHeight=464&originWidth=595&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u099b3225-3f15-44f6-a30a-286c8a6d83b&title=&width=512)

### 3） 数据架构图

数据架构：是一套对存储数据的架构逻辑，它会根据各个系统应用场景、不同时间段的应用场景 ，对数据进行诸如数据异构、读写分离、缓存使用、分布式数据策略等划分。
数据架构主要解决三个问题：第一，系统需要什么样的数据；第二，如何存储这些数据；第三，如何进行数据架构设计。

数据架构是基于数据管理领域知识经验的总结，提炼指导未来数据管理的过程。
主要包括数据治理和数据管理，数据治理包括数据管理政策，原则，规范和标准等；数据管理包括数据总体视图和数据结构，数据库设计等。
![](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655742888857-1661ffa7-d21c-4115-9895-870288aef576.png#clientId=uf015c360-51e4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=457&id=u8d62f280&margin=%5Bobject%20Object%5D&originHeight=363&originWidth=654&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u2befe2ce-7faa-49a5-a6a3-bb94657e861&title=&width=824)![](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1655775306548-e4ecd4a5-b33b-4b6c-a0ba-2e708a48c895.jpeg#clientId=ubffeeb89-afc0-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=uccb9fd6e&margin=%5Bobject%20Object%5D&originHeight=470&originWidth=641&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u3e49664b-76dc-4eb5-b4b0-c097f8dfce4&title=)

### 4） 技术架构图

应用架构本身只关心需要哪些应用系统，哪些平台来满足业务目标的需求，而不会关心在整个构建过程中你需要使用哪些技术。技术架构则是应接应用架构的技术需求，并根据识别的技术需求，进行技术选型，把各个关键技术和技术之间的关系描述清楚。
![](https://cdn.nlark.com/yuque/0/2022/webp/5374140/1655783877222-7efd76f7-c015-4476-a4cd-0f42ab505d75.webp#clientId=ubcde7e11-5334-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=460&id=u27cbd549&margin=%5Bobject%20Object%5D&originHeight=601&originWidth=587&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u2226a321-0f5f-404b-9b3c-f7b9971ae5b&title=&width=449)
技术架构是将数据架构和应用架构落实下去，通过技术的手段实现出来。主要包括架构规划和技术选型等事项。架构规划包括网络、平台、语言、中台、微服务等概念规划；技术选型主要是具体到某个产品时技术方案的选型，包括开源框架、语言、架构风格、数据库、中间件等。
**技术架构解决的问题包括：纯技术层面的分层、开发框架的选择、开发语言的选择、涉及非功能性需求的技术选择**
![](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655743063771-cb287b7e-9c92-42d2-90e3-24b75a7b19ac.png#clientId=uf015c360-51e4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=421&id=u5f9791b3&margin=%5Bobject%20Object%5D&originHeight=615&originWidth=1080&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u9c9d20d2-bce8-4db2-bd86-2e2760bf4a6&title=&width=740)
一般要求从技术层面描述系统。技术架构就是对在业务架构中提出的功能（或服务）进行技术方案的实现，包括软件系统实现、操作系统选择和运行时设计。
**一般分为单个系统和分布式系统**
**单个系统**
主要体现分层模型，例如持久层、数据层、逻辑层、应用层、表现层等，然后每层使用什么技术框架、组件，例如 Spring、hibernate、ioc、[MVC](https://link.zhihu.com/?target=https%3A//www.baidu.com/s%3Fwd%3DMVC%26tn%3DSE_PcZhidaonwhc_ngpagmjz%26rsv_dl%3Dgh_pc_zhidao)、成熟的类库、中间件、WebService 等，分别说明，要求这些技术能够将整个系统的主要实现概括。注意：千万不要把技术架构图画的花里胡哨的，颜色配色不要太多。
技术架构图的要求是：精准、明确、简练。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655741939413-3842e8f6-157d-4a79-af11-61f66fe3b26b.png#clientId=ueae83a84-81c4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=564&id=ub0e68f3a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=688&originWidth=720&originalType=url∶=1&rotation=0&showTitle=false&size=343914&status=done&style=none&taskId=u37c198e5-0427-4b9c-a6fe-cb442544644&title=&width=590)
还有一种是框架类的，例如 struts 的技术架构图：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655741986129-2ea2ce55-098a-4362-bcc5-72b1736c02cd.png#clientId=ueae83a84-81c4-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u1094b7c8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=401&originWidth=537&originalType=url∶=1&rotation=0&showTitle=false&size=257655&status=done&style=none&taskId=u5d12d9d6-e761-468c-bbb9-d053f5f105c&title=)

**分布式系统**
但是，现在更多的情况，是多个系统模块，组成一个大的分布式系统，或者现存多个系统的情况下，需要进行集成开发一个产品。
这样的话，技术架构，就是高层级的技术架构了，不仅仅体现的是技术组件了，而是更高层级的一些模块，甚至规范。
例如蚂蚁金服的分布式金融核心套件中，就从较为高的角度给出了一整套的技术架构、方案，甚至还体现了规范标准。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655742029755-ff844687-2041-4a3e-8a81-7cc231c3fa44.png#clientId=ueae83a84-81c4-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=ub31e1ad3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=421&originWidth=720&originalType=url∶=1&rotation=0&showTitle=false&size=393591&status=done&style=none&taskId=u230b5cfd-e7eb-4177-8986-553d3d8cdfe&title=)

### 5）部署架构图

物理部署图，重要性稍次，但是如果公司中的运维是单独的团队的话，就非常有必要了。
物理部署图主要体现如下几点：

1. 体现机房
   很多是两地三中心这种异地容灾配置，需要体现出来部署的数据中心机房的不同。
1. 体现物理服务器个数、配置
   如果是物理服务器的话，数量少的话，有几台就画几个图，并且明确下来配置。例如 8C32G160G。
   如果是容器化云配置，可以后面写一个类似 X4 这样的处理。
1. 体现网络分区关系
   一般机房，可能划分外联区、后台区；之间的网络是隔离的，需要开通网络关系。
   一些网络前置之类，需要部署在哪个区域也要标明。
1. 体现数据库、高可用
   数据库的类型，高可用方式要简单体现出来，起码也要写上 HA 字样。
1. 体现负载均衡
   例如使用了多少 F5，或者 Nginx。
1. 必要的时候可以写上分配的 IP，以及部署的应用英文缩写等信息
   这个完全是为了提供全量信息，方便后续运维等人员查看。

![](https://cdn.nlark.com/yuque/0/2022/png/5374140/1655776387724-f49cdfc8-c1c4-4ca8-8f44-1de96a00c654.png#clientId=ufa09a3f4-63f8-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=518&id=u2c89e5f6&margin=%5Bobject%20Object%5D&originHeight=664&originWidth=513&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ua379ae86-c6b5-4cb0-8099-6a977662572&title=&width=400)

## 画架构图分四步走

第一，搞清楚要画的架构图的类型；
第二，确认架构图中的关键要素（比如产品、技术、服务）；
第三，梳理关键要素之间的关联：包含、支撑、同级并列等；
第四，输出关联关系清晰的架构图。

## 架构图点线规范

矩形，一般用于表达逻辑或者模块、系统等实体，独立的边界。
矩形里面是圆角矩形，可以有各个层次的具体内容、模块。
虚线，用来做逻辑上的归类。

## 参考
