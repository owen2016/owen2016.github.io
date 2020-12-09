---
title: 【读书】进化
top: false
cover: false
toc: true
mathjax: true
date: 2019-11-16 15:09:23
img:
coverImg:
password:
summary: 最近在看这本《进化-运维技术变革与实践探索》，结合自己的一些实践，有些心得体会，并且摘录了我认为重要的或者有同感的内容。
tags:
- SRE
categories:
- 读书
---

## 关于

最近在看这本《进化-运维技术变革与实践探索》，结合自己的一些实践，有些心得体会，并且摘录了我认为重要的或者有同感的内容。

- <https://time.geekbang.org/column/intro/63>

## 前言

持续交付看似一个简单的工具链打通，却需要突破诸多障碍-组织上，工具上，文化上

    - 组织上，必须打破部门墙，否则工具链肯定连不起来
    - 工具平台能力上，涉及多个方面：项目管理，需求管理，环境管理，配置管理，部署管理，测试管理，监控管理，服务治理

**IT及运维的成熟度分为几个阶段:**

    1. 职能阶段: IT和运维作为独立的成本中心存在，其职能在于高效地交付一系列相对有限的核心运维能力
 
    2. 内部赋能阶段：IT 和运维专注于实现流畅的内部流程和操作规范，并持续改进，同时被动响应从业务线来的各种需求。这个阶段的运维团队追求的是以IT为中心的由内到外、自下而上的价值趋向，表现和结果

    3. 贡献阶段：IT 和运维团队在完成自身的营运常态化之后，可以致力于解决业务问题，积极引导IT和运维资源及服务朝着业务目标前进，成为专注于业务的运维团队。这个阶段的运维视角也发生了根本的转变，变成了以业务为导向的由外到内，自上而下的视角

    4. 差异化阶段：IT和运维团队同其他不同领域的业务团队积极合作，相互融合来持续交付新的产品，服务以及差异化的运营，团队能够敏捷完成产品和服务创新。这这个阶段，IT 和运维已经成为业务本身
    
    5. 转型阶段：IT 和运维团队成为持续业务改造的核心，甚至可以被用来重新定义市场和竞争规则。在这个阶段，IT和运维将成为企业的核心竞争优势

运维能力是整体技术架构能力的体现，运维层面爆发的问题或故障一定是因为整体技术架构中存在问题，割裂两者，单纯看技术架构或运维都是毫无意义的

跳出运维看运维，从架构角度看运维，这种运维思路上的转变，远比单纯提升运维技术更有价值。从全局角度来看运维，考虑如何打造和体现整个技术架构的运维能力，而不是"运维"的运维能力

软件架构的目的，是将构建和维护所需的人力资源见到最低    - From 《架构整洁之道》

**运维接触更多的是软件生命周期中的运行维护阶段:**

- 持续交付
  - 持续集成
  - 持续部署
  - 持续发布

- 持续运维
  - 运行数据分析
  - 体验数据分析
  - 预案演练
  - 故障复查

- 持续反馈和改进
  - 效率提升
  - 性能优化
  - 稳定性提升
  - 体验提升
  - 成本控制

- 架构优化
  - 更加高效稳定地支持业务快速发展

## 1. 运维的本质

规划以**应用**为核心的运维体系

    1. 应用业务模型  -从运维角度，属于业务范畴，不用关注太多
    2. 应用管理模型
    - 应用自身属性：应用名，功能信息，责任人，Git地址，部署结构（代码路径，日志路径，以及各类配置文件路径），启停方式，健康检测方式

    3. 应用运行时所依赖的基础设施和组件
    - 资源层面： 物理机，虚拟机，容器，HTTP服务（IP,DNS服务）
    - 基础组件：数据库，缓存，消息队列，存储

1） 建立各个基础设施和组件的数据模型，同时识别出它们的唯一标识  （以缓存为例，namespace，容量，分区）

2） 设别出基础设施及组件可以与应用名AppName建立关联关系的属性

- 场景1： 资源没有生命周期管理，没有建立和应用之间的关系
- 场景2：没有同意应用名，使得各个平台之间形成孤岛

## 2. 运维体系建设

**标准先行！！！**

标准化的过程实际山就是对象的识别和建模过程。形成统一的对象模型之后，各方在统一的认识下展开有效协同，然后针对不同的运维对象，抽取出它们对应的运维场景，接下来才是运维场景的自动化实现。

运维脱离对象，就没有任何意义。同样，没有理清楚对象，运维自然不得章法。

**标准化步骤：**

    1) 识别对象
    2) 识别对象属性
    3) 识别对象关系
    4) 识别对象场景

    a) 基础设施标准化
        1) 识别对象：服务器，网络，IDC，机柜，存储，配件等
        2) 识别对象属性：服务器（SN序列号，IP,厂商）；硬件配置（CPU,内存，硬盘，网卡，PCIE, BIOS）; 网络设备(厂商，型号，参数等)
        3) 识别对象关系：服务器所在机柜； 虚拟机所在宿主机；机柜所在IDC 等。。拓扑结构
        4) 识别对象场景： 服务器为例，日常操作：采购，入库，安装，配置，上线，下线，维修。。可视化/查询/拓扑/动态展示/级联关系/健康状态

    b) 应用层面的标准化
        1) 识别对象：微服务在“设计阶段”被识别和确认
        2) 识别对象属性：一个应用是业务逻辑的抽象
        ○ 业务属性
        ○ 运维属性
            i. 应用元数据属性：应用名，Owner，所属业务，功能说明等
            ii. 应用代码属性：语言，版本，GitLab地址
            iii. 应用的部署模式： 软件包/容器
            iv. 应用的目录信息，日志目录/运维脚本目录/安装目录等
            v. 应用的运行脚本，如启停，监控检测脚本
            vi. 应用运行时的配置参数，如端口，JVM 参数等
        
        3) 识别对象关系
            i. 应用与基础设施
            ii. 应用与应用之间关系 -e.g. API依赖
            iii. 应用与中间件关系
        
        4) 识别应用场景：持续集成，持续发布，扩容，缩容，监控，容量评估，压测，限流降级  

**运维职责：**

    - 基础架构标准化    -->-选型
    
    - 基础架构服务标准化   
        - 基于基础架构工具原生能力进行“封装”，e.g. 创建/申请容量，扩容/缩容，服务发现/访问路由配置，监控指标，主备切换能力

    1. 参与制定基础架构标准并对标准进行强制约束
    2. 基础架构的服务化平台开发
        - 平台自主化，让开发人员依赖平台能力自助完成对基础组件的需求，二不是依赖运维人员
        - 如果不朝着“服务化”方向发展，运维将始终被拖累在基础组件的运维操作上

应用运维体系建设： 从应用的生命周期的视角看

    1. 应用的创建阶段：应用需要用到哪些基础服务，在架构设计和编码阶段就要确定下来
    
    2. 应用的研发阶段：应用的持续集成体系

    3. 应用的上线阶段：申请应用所需服务器资源，发布软件包使其上线

    4. 应用的运行阶段（最核心，最重要）： 各项运行指标 -监控/报警体系
          - 业务需求不断变化，需要不断“迭代更新”线上应用，依然依赖研发阶段的持续集成，并最终与线上发布形成持续交付这样的闭环体系
          - 应用之间的依赖管理和链路追踪的场景
          - 外部业务量的各种异常变化 （双11， 热点事件，服务器/IDC/数据库 故障） -线上稳定性保障

    5. 应用的销毁阶段： 清理资源，取决于最前面应用与基础服务关系模型分析和建设是否到位

## 3. 配置管理数据库（CMDB）

当识别出运维对象之间的关系，并形成了统一的标准之后，就需要通过某个信息管理平台“固化”，这就是CMDB (Configuration Management DataBase).

CMDB源于20世纪80年代末的ITIL，源于传统IT运维阶段，但发扬光大确实新兴的互联网行业。

CMDB 是一个"高度定制化"的体系, 没有统一的标准。

传统运维阶段，更多是以“设备”为核心进行管理；但是到了互联网技术阶段，核心变成了“应用”

    - 应用名---应用配置信息

    - IP--资源信息 

二者通过“应用名-IP”的对应关系联系在一起

CMDB是运维的基石，但是需要把精力放在运维的核心“应用”上来 - CMDB是面向“资源”的管理，应用配置是面向“应用”的管理

CMDB中如何落地应用，以及如何建立应用集群分组
    - 产品线 -业务团队-应用
    - 多环境/多IDC/多服务分组

应用-集群服务分组-资源

## 4. 运维组织架构与模式

    1. 运维基础平台体系建设 -CMDB,DNS管理，资源管理，偏运维自身体系建设
    2. 分布式中间件的服务化建设
    3. 持续交付体系建设 -依赖于上面两个基础体系的建设
    4. 稳定性体系建设 -快速定位/快付故障恢复/评估扩容
    5. 技术运营体系建设 -标准，指标，规则和流程  -意识

跨团队协作 -1. 运维团队主动出击，沟通推进； 2. 上层支持`

Google SRE 运维模式

对SRE职责定义-负责可用性，时延，性能，效率，变更管理，监控，应急响应和容量管理等相关工作。---->"效率" 和“稳定”

CRE/云计算/AI -新的挑战 -应用运维的转型

## 5. 持续交付

配置管理

    - 版本控制
    - 依赖管理
        ○ Mavn/Ant/Gradle  建立本地Maven 源，构建时候优先从本地获取依赖包，本地源没有对应依赖时，从公网下载，同时缓存到本地
    - 软件配置
        ○ 代码配置 -与代码运行时业务逻辑有关
        ○ 应用配置 -与环境有关 （部署环境/不同机房：平台类为主；私有部署到不同客户）
            § 构建配置：编程语言，构建方式。。
            § 部署配置：日志目录，脚本目录。。
            § 运行配置：应用启停，服务上下线，健康监测方式等
            § 应用运行时与基础组件关系：依赖的数据库，缓存，消息队列等。
            
    - 环境配置 -持续交付的重中之重，最复杂的部分

多环境配置管理

    - 开发环境
    - 集成环境
    - 预发环境
    - Beta环境（灰度，金丝雀）
    - 线上环境

环境配置管理主要时针对应用对于基础设施和基础服务依赖关系的配置管理

解决方案

    1. 多个配置文件，构建时替换
        a. 开发环境： dev_config.properties
        b. 预发环境：pre_config.properties
        c. 线上环境：online_cofnig.properties
        这三个配置文件里的“配置项”时相同的，根据不同环境，值时不同的。 构建时，根据选定的环境对配置文件进行替换
 
    - 优点：简单直接，适合配置项变化不大情况
    - 缺点：没多出一个环境，就要加一个配置文件，如果配置项不断变化，管理很麻烦； 不同环境单独构建，多次打包

    2. 占位符（Placeholder）模板模式

    - 配置项的值用“变量”替换
    - 只保留一个config.properties；但是变量的值可能要多份
    - 没有解决只打包一次问题

    3. AutoConfig 方案
    - 阿里巴巴开发的Webx框架中的一个工具包，继承了Maven的配置管理方式，同时可以作为插件直接与Maven配合工作
        ○ 配置校验：对与替换的值做校验，提前发现问题
        ○ 只打包一次
        ○ 需要基于AutroConfig 做二次开发

比较敏感的配置信息（如用户名，Token，密码等）不允许放在配置文件，跟不允许明文方式

多环境建设

    - 1. 线下环境分类建设
        ○ 不必建设多个相同的，尽量最小化
        ○ 开发/测试使用环境冲突，同一应用不同版本/项目团队冲突

    集成测试环境- 最大程度与线上版本同步，也为开发测试环境和项目环境提供部分依赖服务
    
    开发测试环境- 偏向日常的需求开发，联调和功能验证，以最小化原则进行建设
    
    项目环境- 适用于多团队多个项目，遵循最小化原则，项目启动分配资源，结束时回收资源
    
    技术点： 网段规划（每个环境独立网段）；服务化框架的单元化调用；DNS访问策略；自动化管理
    
    - 2. 线上环境建设
        ○ 生产环境- 无法百分之百模拟真实的用户场景
        ○ Beta环境
        ○ 预发环境
        ○ 办公室生产环境

持续交付流水线

    - 持续交付建立在上面多环节以及配置管理的基础上

    1. 项目需求分解- 确定多个应用的联调，测试和最终发布的计划和协同，依赖关系
    2. 代码提交方式 -分支策略选择
    3. 应用的构建  - 静态语言/动态语言
        ○ 配置文件如何打包？构建时，确认部署的环境
        ○ 使用docker作为编译环境

发布策略- 蓝绿发布，灰度发布（金丝雀），滚动发布