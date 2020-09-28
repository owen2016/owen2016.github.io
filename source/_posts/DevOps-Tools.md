---
title: DevOps 工具
top: false
cover: false
toc: true
mathjax: false
date: 2019-10-2 22:51:05
password:
summary:
tags:  
- DevOps
categories:
- 工具
---

![devops-tools](https://gitee.com/owen2016/pic-hub/raw/master/pics/20200928233152.png)

## 版本控制&协作开发

- 版本控制系统 Git

    Git 是一个开源的分布式版本控制系统，用以有效、高速的处理从很小到非常大的项目版本管理。开源中国 Git 代码托管平台：http://git.oschina.net/

- 代码托管平台 GitLab

    GitLab 是一个利用 Ruby on Rails 开发的开源应用程序，实现一个自托管的Git项目仓库，可通过Web界面进行访问公开的或者私人项目。开源中国代码托管平台 git.oschina.net 就是基于 GitLab 项目搭建。

- 代码评审工具 Gerrit

    Gerrit 是一个免费、开放源代码的代码审查软件，使用网页界面。利用网页浏览器，同一个团队的软件程序员，可以相互审阅彼此修改后的程序代码，决定是否能够提交，退回或者继续修改。它使用 Git 作为底层版本控制系统。

- 版本控制系统 Mercurial

    Mercurial 是一种轻量级分布式版本控制系统，采用 Python 语言实现，易于学习和使用，扩展性强。

- 版本控制系统 Subversion

    Subversion 是一个版本控制系统，相对于的 RCS、CVS，采用了分支管理系统，它的设计目标就是取代CVS。互联网上免费的版本控制服务多基于Subversion。

- 版本控制系统 Bazaar

    Bazaar 是一个分布式的版本控制系统，它发布在 GPL 许可协议之下，并可用于 Windows、GNU/Linux、UNIX 以及 Mac OS 系统。

## 包&产品管理工具

- Chocolatey：Chocolatey是Windows下一款开源的命令行包管理软件 ，简单说这就是Windows的apt-get；

- WiX Toolset：提供一组最强大的工具集来帮助你创建Windows安装包。该工具集从XML源代码构建你的Windows安装程序包，可以无缝集成到构建过程；

## 自动化构建和测试

- Apache Ant
    Apache Ant是一个将软件编译、测试、部署等步骤联系在一起加以自动化的一个工具，大多用于Java环境中的软件开发。

- Maven
    Maven 除了以程序构建能力为特色之外，还提供 Ant 所缺少的高级项目管理工具。由于 Maven 的缺省构建规则有较高的可重用性，所以常常用两三行 Maven 构建脚本就可以构建简单的项目，而使用 Ant 则需要十几行。
    事实上，由于 Maven 的面向项目的方法，许多 Apache Jakarta 项目现在使用 Maven，而且公司项目采用 Maven 的比例在持续增长。开源中国的[Maven 库](http://maven.oschina.net)

- Selenium
Selenium (SeleniumHQ) 是 thoughtworks公司的一个集成测试的强大工具。

- PyUnit
Python单元测试框架（The Python unit testing framework），简称为PyUnit， 是Kent Beck和Erich Gamma这两位聪明的家伙所设计的 JUnit 的Python版本。

- QUnit
QUnit 是 jQuery 的单元测试框架。

- JMeter
JMeter 是 Apache 组织的开放源代码项目，它是功能和性能测试的工具，100% 的用 java 实现。

- Gradle
Gradle 就是可以使用 Groovy 来书写构建脚本的构建系统，支持依赖管理和多项目，类似 Maven，但比之简单轻便。

- PHPUnit
PHPUnit 是一个轻量级的PHP测试框架。它是在PHP5下面对JUnit3系列版本的完整移植，是xUnit测试框架家族的一员(它们都基于模式先锋Kent Beck的设计)。

## 持续集成&交付

- Jenkins
    Jenkins 是一个开源的持续集成工具，使用 Java 编程语言编写的。它有助于实时检测和报告较大代码库中的单一更改。该软件可帮助开发人员快速查找和解决代码库中的问题并自动测试其构建。

- Travis CI
    Travis 是一款流行的 CI 工具，可免费用于开源项目。在托管时，不必依赖任何平台。此 CI 工具为许多构建配置和语言提供支持，如 Node，PHP，Python，Java，Perl 等。

- GoCD
    GoCD 是一个开源的持续集成服务器。它可轻松模拟和可视化复杂的工作流程。此 CI 工具允许持续交付，并为构建 CD Pipeline 提供直观的界面。

- Bamboo
    Bamboo 是一个持续集成的构建服务器，可以自动构建、测试和发布，并可与 JIRA 和 Bitbucket 无缝协作。Bamboo 支持多语言和平台，如 CodeDeply、Ducker、Git，SVN、Mercurial、AWS 及 Amazon S3 bucket

- GitLab CI
    GitLab CI 是 GitLab 的一部分。它是一个提供 API 的 Web 应用程序，可将其状态存储在数据库中。GitLab CI 可以管理项目并提供友好的用户界面，并充分利用 GitLab 所有功能

## 配置管理

- Chef
    Chef 是一个系统集成框架，为整个架构提供配置管理功能。

- Puppet
    Puppet，您可以集中管理每一个重要方面，您的系统使用的是跨平台的规范语言，管理所有的单独的元素通常聚集在不同的文件，如用户， CRON作业，和主机一起显然离散元素，如包装，服务和文件。

- RunDeck
    RunDeck 是用 Java/Grails 写的开源工具，帮助用户在数据中心或者云环境中自动化各种操作和流程。通过命令行或者web界面，用户可以对任意数量的服务器进行操作，大大降低了对服务器自动化的门槛。

- Saltstack
    Saltstack 可以看做是func的增强版+Puppet的弱化版。使用Python编写。非常好用,快速可以基于EPEL部署。Salt 是一个开源的工具用来管理你的基础架构，可轻松管理成千上万台服务器。

- Ansible
    Ansible 提供一种最简单的方式用于发布、管理和编排计算机系统的工具，你可在数分钟内搞定。Ansible 是一个模型驱动的配置管理器，支持多节点发布、远程任务执行。默认使用 SSH 进行远程连接。无需在被管理节点上安装附加软件，可使用各种编程语言进行扩展。

## 日志监控

- Logstash
Logstash 是一个应用程序日志、事件的传输、处理、管理和搜索的平台。你可以用它来统一对应用程序日志进行收集管理，提供 Web 接口用于查询和统计。

- CollectD
Collectd 是一个守护(daemon)进程，用来收集系统性能和提供各种存储方式来存储不同值的机制。比如以RRD 文件形式。

- StatsD
StatsD 是一个简单的网络守护进程，基于 Node.js 平台，通过 UDP 或者 TCP 方式侦听各种统计信息，包括计数器和定时器，并发送聚合信息到后端服务，例如 Graphite。

- Nagios
Nagios 是一个监视系统运行状态和网络信息的监视系统。Nagios能监视所指定的本地或远程主机以及服务，同时提供异常通知功能等。

- Ganglia
Ganglia 是一个跨平台可扩展的，高 性能计算系统下的分布式监控系统，如集群和网格。它是基于分层设计，它使用广泛的技术，如XML数据代表，便携数据传输，RRDtool用于数据存储和可视化。

- Sensu
Sensu 是开源的监控框架。主要特性：高度可组合；提供一个监控代理，一个事件处理器和文档 APIs；为云而设计；Sensu 的现代化架构允许监控大规模的动态基础设施，能够通过复杂的公共网络监控几千个全球分布式的机器和服务；热情的社区。

- Zabbix
Zabbix 是一个基于WEB界面的提供分布式系统监视以及网络监视功能的企业级的开源解决方案。

- ICINGA
ICINGA 项目是 由Michael Luebben、HendrikB?cker和JoergLinge等人发起的，他们都是现有的Nagios项目社区委员会的成员，他们承诺，新的开源项 目将完全兼容以前的Nagios应用程序及扩展功能。

- Graphite
Graphite 是一个用于采集网站实时信息并进行统计的开源项目，可用于采集多种网站服务运行状态信息。Graphite服务平均每分钟有4800次更新操作。

- Kibana
Kibana 是一个为 Logstash 和 ElasticSearch 提供的日志分析的 Web 接口。可使用它对日志进行高效的搜索、可视化、分析等各种操作

## 微服务/容器平台

- OpenShift
OpenShift 是由红帽推出的一款面向开源开发人员开放的平台即服务(PaaS)。 OpenShift通过为开发人员提供在语言、框架和云上的更多的选择，使开发人员可以构建、测试、运行和管理他们的应用。

- Cloud Foundry
Cloud Foundry 是VMware于2011年4月12日推出的业界第一个开源PaaS云平台，它支持多种框架、语言、运行时环境、云平台及应用服务，使开发 人员能够在几秒钟内进行应用程序的部署和扩展，无需担心任何基础架构的问题。

- Kubernetes
Kubernetes 是来自 Google 云平台的开源容器集群管理系统。基于 Docker 构建一个容器的调度服务。该系统可以自动在一个容器集群中选择一个工作容器供使用。其核心概念是 Container Pod。

- Mesosphere
  Apache Mesos 是一个集群管理器，提供了有效的、跨分布式应用或框架的资源隔离和共享，可以运行Hadoop、MPI、Hypertable、Spark。
