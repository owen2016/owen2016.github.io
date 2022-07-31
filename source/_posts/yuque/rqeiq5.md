---
title: 聊聊DevOps制品管理-不止是存储制品这么简单
urlname: rqeiq5
date: '2022-01-14 21:31:42 +0800'
tags: []
categories: []
---

## 什么是制品？

**制品**是指由源码编译打包生成的二进制文件，不同的开发语言对应着不同格式的二进制文件；这些二进制文件通常用于运行在服务器上或者作为编译依赖,“制品的管理”是配置管理的重要组成部分。

通常，这些组件是各种文件的存档，包括：类文件中的 Java 字节码、C 对象文件、文本文件、二进制文件。组件的多种格式，例如：Java JAR，WAR，EAR 格式；普通 ZIP 或.tar.gz 文件；其他软件包格式，例如 NuGet 软件包，Ruby gems，NPM 软件包；可执行文件格式，例如.exe 或.sh 文件，Android APK 文件，各种安装程序格式。

**按照使用场景，制品大致分为三类**

1. 外部引入的第三方组件
1. 产品内部依赖包，公共 SDK
1. 产品交付安装包

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1642823900704-0695efe9-03f9-4062-abf7-af2317b67fc2.png#clientId=u121e30f5-3b13-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=325&id=ue8d0710f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=537&originWidth=1437&originalType=binary∶=1&rotation=0&showTitle=false&size=185047&status=done&style=none&taskId=u1d66f15d-a104-4630-8a08-826682730f3&title=&width=870)
**按照开发语言，制品类型包含以下类型：**

- Generic File 指的是通用文件类型的制品。
- Docker
- Maven
- npm
- PyPI
- Helm
- Composer
- NuGet
- Conan

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645267322133-1627f1ab-7d1c-43d4-9ee7-ef23570e2d4c.png#clientId=ua5ff6c33-2b41-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=158&id=u621d9a5c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=199&originWidth=1072&originalType=binary∶=1&rotation=0&showTitle=false&size=120065&status=done&style=none&taskId=uf5e19b33-af68-4c8c-8278-8d8fcdd0b68&title=&width=849)

## 为什么要制品管理？

1. 外部依赖下载慢

- 影响研发构建速度

2. 版本管理混乱 （svn,ftp）

- 交付包使用 FTP 或者 SVN 进行管理，管理粒度相对较粗；在这种粗放式的制品管理方式下，不同类型包的存储与获取是一件头疼的事情，版本追踪极其混乱，团队协作也是障碍重重。
- 由于受到监管约束，一键部署是不可能任务，跨网段的包交付智能依赖于手工拷贝

3. 安全漏洞风险

- 依赖组件越多，引入漏洞的风险也越高
- 第三方依赖包下载管理混乱，没有准入管控
- 漏洞藏的越深，修复漏洞所花费的时间就越长

4. 制品存储风险

- 团队内部搭建的制品库是单点的，缺乏集群部署

5. 资源浪费

- 因为没有统一的制品库，存在重复建设的问题；维护成本高，或者说目前根本就没有维护

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1642823993983-ad099612-d7b2-4b7b-8c8d-9f9394846ded.png#clientId=u121e30f5-3b13-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=401&id=pMAbI&margin=%5Bobject%20Object%5D&name=image.png&originHeight=481&originWidth=747&originalType=binary∶=1&rotation=0&showTitle=false&size=283692&status=done&style=none&taskId=u50504f7e-da1d-4ea6-94d3-0d4e4898dbf&title=&width=623)

## 制品和 CI/CD 流水线

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645230369369-92f7e8b2-4228-4df0-80a6-e4d2f981b5ed.png#clientId=u67e39b42-944c-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=364&id=fgt5w&margin=%5Bobject%20Object%5D&name=image.png&originHeight=548&originWidth=1110&originalType=binary∶=1&rotation=0&showTitle=false&size=209092&status=done&style=none&taskId=ucc898842-dd0f-4db5-9045-df489ef5ae4&title=&width=737)
对于 CI/CD 流水线而言，制品起到一个**承上启下**的关键作用，它是持续集成 CI 的终点，同时也是持续交付 CD 的起点。

如果缺乏有效的制品管理策略和工具，根本不可能建立高效的流水线；脱离制品管理，每次只能重新从代码开始构建，对于任何企业组织是不可接受的，同时也不符合“一次构建，多次使用”的原则。

在整个研发过程中，制品对于测试人员和运维人员至关重要，他们关注的是怎么拿到需要的版本进行测试和部署，如果缺乏有效的制品管理，整个 DevOps 价值流就会出现衔接上的问题。你可能会碰到这种情况，测试同学会通过各种方式去询问那个版本可以测试，包在哪里等情况。

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1642824037961-c73ebd96-709f-406e-b881-cc24cadaa162.png#clientId=u121e30f5-3b13-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=285&id=bWd6A&margin=%5Bobject%20Object%5D&name=image.png&originHeight=602&originWidth=1507&originalType=binary∶=1&rotation=0&showTitle=false&size=215076&status=done&style=none&taskId=ufb92dac4-f0a1-4986-b809-558ab14b889&title=&width=714)

### 包的元数据

何为包的元数据？别人给你一个包，你怎么知道包里包含了哪些需求缺陷变更，包含了哪些代码提交，还有包的 md5,hash 等信息。这些信息对于测试人员**追踪问题的引入，后续改进，版本回归**至关重要，通俗点说，弄清楚制品的前世今生。

那么这些信息哪里来？当然是持续构建 CI 流水线，需求，代码提交都可以通过 CI 流水线收集。如果你的组织购买过 Jfrog 的产品，会发现这个特点在的它的平台上尤为突出。

### 制品的晋级

在开发实践中，大多数团队会准备 DEV, TEST, UAT, RELEASE 等不同的环境，相应的建设不同的流水线，将制品部署到不同的环境前都会对制品进行不同的测试，所里这里也衍生出来了制品的晋级，就是给制品设置不同的准入门禁。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645256523287-5c6006cd-3a23-4e87-90e9-ccd42a9504b6.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=389&id=ued8e2eda&margin=%5Bobject%20Object%5D&name=image.png&originHeight=771&originWidth=1426&originalType=url∶=1&rotation=0&showTitle=false&size=450246&status=done&style=none&taskId=ua9c9bdc8-b6ee-45db-ae5a-76683021381&title=&width=719)
综上所属，制品和 CI/CD 流水线有着紧密的联系，不可分割，在设计流水线时候要考虑好制品的使用场景。

## 制品管理工具

如上所述，由于制品管理的重要性，所以衍生出来对应的制品解决方案用来统一管理不同格式的软件制品。 除了基本的存储功能，还提供了版本控制、访问控制、安全扫描、依赖分析等重要功能，最终建立“单一可信源”，是一种企业处理软件开发过程中产生的所有包类型的标准化方式。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645233233874-12d53638-566a-478e-8d3a-08493b2c8482.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=344&id=u10120188&margin=%5Bobject%20Object%5D&name=image.png&originHeight=733&originWidth=1342&originalType=binary∶=1&rotation=0&showTitle=false&size=208058&status=done&style=none&taskId=ubcc0a23c-52bf-498b-b69c-5c477dad9c3&title=&width=630)
目前主市场上主流的制品管理工具主要有以下几种：

### Nexus

Nexus 是一套“开箱即用”的系统不需要数据库，它使用文件系统加 Lucene 来组织数据。Nexus 使用 ExtJS 来开发界面，利用 Restlet 来提供完整的 REST APIs，通过 m2eclipse 与 Eclipse 集成使用。Nexus 支持 WebDAV 与 LDAP 安全身份认证。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645233361951-aeac567a-cd45-44ca-a8aa-db28b2660d1f.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=327&id=uff8aff58&margin=%5Bobject%20Object%5D&name=image.png&originHeight=468&originWidth=1136&originalType=url∶=1&rotation=0&showTitle=false&size=84390&status=done&style=none&taskId=u2fcd7445-f5b0-4150-b340-55005b55042&title=&width=794)

Nexus 是少有的支持几乎所有主流制品格式，并且提供免费版的制品管理产品，这也是大多数中小公司的选择，可以满足大部分业务场景，但是，免费版不提供高可用方案。
价格参考： [https://www.sonatype.com/products/pricing?topnav=true](https://www.sonatype.com/products/pricing?topnav=true)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645233543803-24699daf-ea08-4010-8cd1-dc682808f738.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=263&id=XYAs0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=342&originWidth=1098&originalType=url∶=1&rotation=0&showTitle=false&size=46136&status=done&style=none&taskId=u67702115-1cb7-4826-abfb-7822d936c42&title=&width=844)
由于 Nexus 在国内没有代理商，所以大家对它的认知还有限，其实 Nexus 仅仅是[sonatype](https://www.sonatype.com/)产品解决方案的一种，提供对软件研发周期的制品管理方案。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645250966191-b5b66c09-0c2d-4a83-9295-0beaf0116cf3.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=388&id=u35b8f518&margin=%5Bobject%20Object%5D&name=image.png&originHeight=633&originWidth=1225&originalType=url∶=1&rotation=0&showTitle=false&size=74569&status=done&style=none&taskId=u6e6fc659-b162-45a4-8215-fc36de5fd6a&title=&width=751)

### Jfrog Artifactory

Jfrog 是一家以色列公司，专注于制品管理环境，提供商用的解决方案，所以它的产品是要花钱的。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645251112457-2a78691d-229b-4a32-99f8-207cc8265901.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=352&id=ub5811adb&margin=%5Bobject%20Object%5D&name=image.png&originHeight=539&originWidth=1181&originalType=url∶=1&rotation=0&showTitle=false&size=144244&status=done&style=none&taskId=uee218f2f-8c30-437e-97a1-52f9bb89c03&title=&width=772)
下图列出了 Jfrog Artifactory 和 Nexus 的产品特点对比，仅供参考。既然是掏钱买的，肯定比免费的 Nexus 提供的支持和服务更多，包括高可用，组件的漏洞风险分析，多地分发等等。不是说 Nexus 不行，而是我们大家用的大部分都是 Nexus 的免费版，其实它的收费版也提供类似的方案。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645233474360-66441376-234d-4fdc-a0cb-c0f7c303c54a.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=412&id=u0da0eae5&margin=%5Bobject%20Object%5D&name=image.png&originHeight=757&originWidth=1417&originalType=url∶=1&rotation=0&showTitle=false&size=415674&status=done&style=none&taskId=u941b21fe-7565-48e1-a8a9-0a489473d88&title=&width=771)

### Harbor

Harbor 是 VMware 公司**开源**的企业级 Docker Registry 项目，其目标是帮助用户迅速搭建一个企业级的 Docker registry 服务。

基于官方 Registry V2 实现，提供了管理 UI，基于角色的访问控制(Role Based AccessControl)，AD/LDAP 集成、以及审计日志(Auditlogging) 等企业用户需求的功能，通过添加一些企业必需的功能特性，例如安全、标识和管理等，扩展了开源 Docker Distribution。

Harbor 目前已经成为私有 Docker/Helm 管理的主要工具，相比于 Nexus, Harbor 在 docker 镜像的管理方面更有优势，提供镜像同步服务，支持团队项目隔离。在实践过程中，笔者发现 Nexus 在 docker 镜像的团队隔离方面上，存在一些问题。
![Snipaste_2022-02-19_09-39-12.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645250918970-c35307b7-fdd5-4d04-bd5b-0b58f140744d.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=356&id=u68823e5a&margin=%5Bobject%20Object%5D&name=Snipaste_2022-02-19_09-39-12.png&originHeight=653&originWidth=1656&originalType=binary∶=1&rotation=0&showTitle=false&size=59534&status=done&style=none&taskId=u4d41760c-8046-4d62-99e1-4117d219f68&title=&width=902)

### WePack

WePack 是腾讯 Coding 基于之前的 DevOps 拆分出来的单独的制品管理服务，支持私有化部署。也许也是看到单独的制品管理工具，比大而全的 DevOps 平台更好的切入用户场景吧。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645252578364-0735a6c3-8c16-4920-81d4-b5ffb918238d.png#clientId=u32c84d3f-ce40-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=449&id=u1af41741&margin=%5Bobject%20Object%5D&name=image.png&originHeight=603&originWidth=1259&originalType=binary∶=1&rotation=0&showTitle=false&size=185622&status=done&style=none&taskId=ua5fe50e9-18ec-4df5-82bd-4c42ad9ac9e&title=&width=937)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645253918727-2a81f443-d496-46fe-b23d-a490c58666f2.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=422&id=ud985df42&margin=%5Bobject%20Object%5D&name=image.png&originHeight=582&originWidth=825&originalType=binary∶=1&rotation=0&showTitle=false&size=27771&status=done&style=none&taskId=uaac9fe92-3a70-4753-a6f3-a7cf68f518b&title=&width=598)

## 如何管理制品？

为了统一管理不同语言格式的包，以上制品管理工具几乎都按照如下方式管理组织制品。

制品库的层级关系为：仓库 > 包 > 版本，每个层级描述如下：

- 仓库：用于管理不同类型的仓库和仓库下的包资源，可以设置仓库对外的访问权限。
- 包：构建产物对外提供访问的基础单元，用于介绍当前构建产物的用途和使用指引。
- 版本：列出某个包下的所有构建产物，详细记录了每次构建产物的版本迭代更新变化。

### 规范制品库命名

如果团队比较大一，对制品管理的要求不高，按照以上方式基本可以满足需求。但是，如果建设公司级别的需要规范一些命名，如下所示
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645255559771-f899a6fe-88be-4f0d-bb83-00f298e9aada.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=265&id=u6022370a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=347&originWidth=724&originalType=binary∶=1&rotation=0&showTitle=false&size=157657&status=done&style=none&taskId=ue6fb1d84-b1ab-4c5e-aa05-e4cca362c95&title=&width=553)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645255681369-681e076d-25fa-4e50-b05c-83e8c9e6f60b.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=198&id=u7328dc04&margin=%5Bobject%20Object%5D&name=image.png&originHeight=229&originWidth=630&originalType=binary∶=1&rotation=0&showTitle=false&size=101436&status=done&style=none&taskId=u10251052-30bd-4098-b513-a724864e365&title=&width=544)

### 制品版本号规范化

制品的版本号用于标记特定制品，通过规范化命名有助于自动化脚本的编写和流水线的复用。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645256398308-12e40a28-76ee-480d-886d-5c60a79c95cd.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=333&id=uaf87485c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=419&originWidth=855&originalType=binary∶=1&rotation=0&showTitle=false&size=97627&status=done&style=none&taskId=u653f85d6-a94a-4c2e-a182-fe4ab86a77a&title=&width=680)

### 制品库权限规范化

不管是基于开源工具，还是自研工具，基于制品仓库的权限设计也是必要的，做到团队产品的隔离。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645256280495-92d355a2-7097-4d87-9d77-21622d860083.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=394&id=u90b3be92&margin=%5Bobject%20Object%5D&name=image.png&originHeight=544&originWidth=996&originalType=binary∶=1&rotation=0&showTitle=false&size=238690&status=done&style=none&taskId=u8ace3334-18bb-43c2-b4d7-c921ec84e32&title=&width=721)

## 开源制品的安全风险

对于制品的管理，大多人数都停留在仅仅是存储，拉取使用的想法，笔者今年前也是这种思维。2021 年末的 Log4j2 的安全事件，引起了整个 IT 圈的轩然大波，这个开源组件几乎涉及所有的 java 应用，每个公司不得不紧急排查自己产品是否引入该风险。

通过该事件，让我们开始关注开源组件可能存在的风险，这也是目前比较热门的研发过程中的“[供应链安全](https://baijiahao.baidu.com/s?id=1709504114617115003픴=spider&for=pc)”，也是 DevSecOps 其中重要的一个环节。
![](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645257211219-cbb64b0d-6fa9-4661-8e54-83886c911726.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u45e8d483&margin=%5Bobject%20Object%5D&originHeight=361&originWidth=649&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=ue78b02b5-95fe-4164-90fe-5547ebd5a8c&title=)
作为研发过程中的制品管理，引入阶段的审核机制，使用中的安全，越来越成为大家关注的热点。如果所示，组织需要引入组件审核制度，杜绝开发人员随意的拉取互联网的开源制品，并且建立实时的漏洞扫描机制，形成组织级的白名单仓库。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645257563752-00c447fb-24e0-42de-9797-90405fba89dd.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=368&id=u28d20d63&margin=%5Bobject%20Object%5D&name=image.png&originHeight=575&originWidth=1093&originalType=binary∶=1&rotation=0&showTitle=false&size=293917&status=done&style=none&taskId=uaaa48df0-b404-4542-a36c-802b821306c&title=&width=699)

### SBOM-软件物料清单

现代软件主要是使用第三方和开源组件组装而成的，它们以复杂而独特的方式融合在一起，并与原始代码集成以实现所需的功能。除了通过在开源组件引入阶段加入安全审核机制，IT 企业往往也需要关注自己开发或使用的软件产品的组成，像我们在超市购买食品时在食品包装上看到的食品配料清单，标注了所用的所有材料。

为了准确摸清软件所含组件的情况，SBOM（即：Software Bill Of Materials）应运而生，其包括多种关键信息，如：组件名称、版本号、供应商等，这些关键信息在分析软件安全时发挥着关键作用。通过这些信息，可以追溯软件的原始供应链，极大提高开发者对其所用软件安全风险的理解，帮助企业在网络安全风险分析、漏洞管理和应急响应过程中提高效率。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645266294022-3b6dcd06-d151-4c84-a794-d5d865fa1048.png#clientId=u7e7dce47-1975-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=331&id=fXZvu&margin=%5Bobject%20Object%5D&name=image.png&originHeight=527&originWidth=1080&originalType=url∶=1&rotation=0&showTitle=false&size=267804&status=done&style=none&taskId=u9bdfdcb7-2a28-4433-99e7-a4d8e61a16b&title=&width=679)

对软件开发企业而言，SBOM 可有效控制开源组件风险，帮助企业更早识别并消除开源组件安全缺陷和许可风险；对软件采购企业而言，SBOM 可帮助采购决策者轻松了解开发方软件是否存在开源组件风险；对软件开发人员而言，SBOM 可帮助开发人员全面准确掌握其所研发软件的开源组件情况。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1645266403725-755edfe1-f9ff-467d-ab0f-68651c63a718.png#clientId=u5568aa8e-25a6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=378&id=u4c62a775&margin=%5Bobject%20Object%5D&name=image.png&originHeight=465&originWidth=720&originalType=url∶=1&rotation=0&showTitle=false&size=114314&status=done&style=none&taskId=u79ed479b-e1b0-48bd-ae02-fb58fb29966&title=&width=585)

## 总结

- 制品管理是 DevOps 实践过程中的重要环节，起着承上启下，收集过程信息的重要角色；
- 于此同时，制品的引入使用会存在安全风险，组织需要关注这一点，避免类似 Log4j2 安全事件带来的一系列风险；
- 作为实践者，在制品的管理上需要结合组织和流水线需要，指定相应的规范，避免混乱；
- 好的制品管理流程，可减少开发自测和测试人员进行接收测试衔接过程中的低效沟通；

这里仅仅是对制品管理做了全局的梳理，后续会对其中具体的知识点进行详细介绍。
