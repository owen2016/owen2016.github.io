---
title: CI/CD场景价值
urlname: evq8l3
date: '2021-12-06 23:35:33 +0800'
tags: []
categories: []
---

![](https://cdn.nlark.com/yuque/0/2021/jpeg/5374140/1638804962466-a11a63e6-9e0b-494b-b75c-767c548552be.jpeg#clientId=uae7271a2-a0f7-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u3f1503af&margin=%5Bobject%20Object%5D&originHeight=516&originWidth=1080&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u4064d7b1-e338-4e28-8f21-72ded60791b&title=)

简单聊了一下个人接触的 CI/CD 演进过程的技术选型演变，接下来聊聊什么场景下需要 CI/CD ，它到底能带来什么样的变化。

## 工作流程的变化

与持续集成和持续交付关联最紧密的便是研发流程，那么有 CI/CD 和没有 CI/CD 的团队分别是什么样子的呢？

### 没有 CI/CD 的团队

1. 项目创建
1. 功能编写
1. 代码提交
1. 功能自测
1. 代码 Review
1. 合并发布分支
1. 人工构建
1. 人工部署
1. 产品发布
1. 人工观察线上质量
1. 质量修复、持续改进（循环第 3 步开始的内容）

上面是一个常规的单任务场景下的流程，可以看到起码有 10 个步骤：当然有的公司会省略一些步骤，诸如 Code Review；也有许多人只会接触到功能编写和提交代码几个阶段。
实际场景中，会更复杂一些，涉及“并行开发多个需求”、“多个完成的功能等待上线”、“部分代码进行重构，等待兼容测试”等等。
如果你的公司欣欣向荣，业务蓬勃发展，那么整个研发流程会浪费非常多的资源：**聪明能干的工程师总是不停的做着构建、发布、大量非必要的线上人肉观察等本该机器做的事情**。

### 有部分自动化脚本的团队

1. 项目创建
1. 功能编写
1. 代码提交
1. 功能自测
1. 代码 Review [**这里可能使用了一些 lint、coverage、risk scanner 功能分摊了一些 Review 压力**]
1. 合并发布分支 [**这里可能使用了一些脚本进行对非敏感内容进行自动合并**]
1. 人工构建 [**有抽象构建过程为脚本，然后通过手工调用**]
1. 人工部署 [**有抽象部署过程为脚本，然后通过手工调用**]
1. 产品发布 [**有抽象发布过程为脚本，然后通过手工调用**]
1. 人工观察线上质量 [**有编写一些监控程序，然后通过手工调用**]
1. 质量修复、持续改进（循环第 3 步开始的内容）

可以看到在流程没有任何变化的过程中，因为多了一些工具的引入、过程脚本的编写，很多事情可以让机器去做了，这样可以解放一大部分重复简单工作上的资源。
但是，协调每个阶段的事情，多数是由人来做的，因为有人的介入，部分自动化的事情，变的有一些不可控和不可靠，人是情绪化的动物，总会有疲惫、松懈的状态出现，然后可能影响到结果。
人工进行诸如:

- maven build
- npm build
- docker build

然后执行 maven、npm、docker push 真的是有意义的吗？
而这个过程经过统计，其实在软件开发过程中占比并不会很低。（推荐使用时间追溯软件进行统计、也可以参考代码大全）
而且在多数时候，这些定制化的辅助脚本各式各样，后续一旦想批量进行升级更换操作，十分麻烦，**缺乏标准化的技术方案，是应该被摒弃的**。

### 使用 CI/CD 基础设施的团队

1. 项目创建
1. 功能编写
1. 代码提交 [**CI 工具介入**]
1. 功能自测
1. 代码 Review [**CI 工具介入**]
1. 合并发布分支 [**CI 工具介入**]
1. 人工构建 [**CI 工具介入**]
1. 人工部署 [**CD 工具介入**]
1. 产品发布 [**CI/CD 工具介入**]
1. 人工观察线上质量 [**CI 工具介入**]
1. 质量修复、持续改进（循环第 3 步开始的内容）

看起来和上面并没有太大的不同，确实是这样：
如果你的研发流程是正常的，CI/CD 并不改造你的研发流程，只是给你进行标准化的工程流水线改造。
以 GitLab + GitLab CI Runner 环境下的 CI/CD 为例：

- 在代码提交之后，将会根据提交分支进行不同的自动化处理：
  - 代码常规检查
  - 自动化单元测试
  - 依赖漏洞检查
- 在代码 Review 阶段，因为上一阶段已经进行了 Code Style、代码底层实现 Code Lint 等检查，相关 reviewer 只需要对逻辑和实现方案进行 Review。
- 在合并发布分支阶段，可以自动检查是否冲突，如果没有冲突自动进行合并，有则进行通知，等待人工介入，**人工只做必须介入的事情**。
- 在构建过程，CI 可基于标准的容器镜像进行构建，依赖被约束在稳定的镜像二进制包内，唯一的变量就是你有变动的代码，保障构建环境是可准确、可靠、可迁移的。因为使用 dockerfile 进行描述，容器环境的分析和升级也变的透明、可追溯。在构建结束将成功与否的结果告知工程师，但仅仅是告知即可，因为软件已经可以到下一个阶段进行自动化部署了。
- 在部署阶段，CI 可基于上一步构建结果是否正确进行下一步的分发操作，包括交付测试使用的测试环境、给开发自行联调使用的开发环境、给团队成员验收使用的预发或者叫仿真环境、乃至线上正式的生产环境。
- 最后，当部署完成之后，等待人工介入完成产品上线切换，会触发 CI 的线上复查、监控验收。

我们可以看到虽然之前看似简单的过程脚本变成了一大块的持续集成执行阶段，但是带来了容器标准化执行，未来对构建环境的统一维护和升级可以快速被应用。
之前看似简单，但是极其浪费资源的人工执行变成了自动化执行，很多东西在无声无息的进行着，只有必须人去参与决策的时候，才需要人去操作，对于研发团队来说，这里可以节约大量的资源，对于工程师来说，你工作中来自软件研发流程上的等待和打断少了许多。

## CI/CD 价值小结

- 流水线标准化生产和交付
  - 最大化减少人为介入和决策，提高交付效率、节约人力成本在机器可以做的很好的情况下的浪费。
  - 环境标准化，避免硬编码的脚本带来后续升级改造成本或者绑架技术栈。
  - 流程标准化有助于扩展性提升，连接研发流程的设施可以相对轻松的进行升级维护。
- “简化”研发流程
  - 开发人员可以更加专注于产品打磨，而非周边“乱七八糟”的一堆事情上。
- 研发质量辅助提升
  - 原本需要人工执行的代码质量检查的操作，统一由机器去完成。
  - 结合数据工具，可以针对性的自动化产出某个项目上线前后的数据变化，回馈产品、运营团队，辅助后续的产品决策。