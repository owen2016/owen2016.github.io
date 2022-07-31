---
title: Git 在团队中的最佳实践
urlname: vn8en5
date: '2021-05-03 20:46:46 +0800'
tags: []
categories: []
---

现代软件开发过程中要实现高效的团队协作，需要使用代码分支管理工具实现代码的共享、追溯、回滚及维护等功能。目前流行的代码管理工具，包括 CVS，SVN，Git，Mercurial 等。

相比 CVS 和 SVN 的集中管理，Git 具有非常明显的优势，**例如：去中心化的代码管理方式减少了开发者对中心服务器的依赖，每个成员在本地都有一个完整的代码库，在不联网的情况下也能提交代码；不同于 SVN 中的每个分支具有独立的代码，Git 中的每一个分支只是指向当前版本的一个指针，Git 的分支策略使创建和合并分支变得快捷灵活**。

根据开源社区网站 OpenHub 的统计，使用 Git 管理代码的项目逐年快速增加，如今 Git 在代码管理领域已经占据主导地位。
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1620048579072-f2416483-61a4-4d39-b1bb-f60fd4a7bef8.png#clientId=u26d01617-abe4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=462&id=u9fb555b3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=525&originWidth=720&originalType=binary∶=1&rotation=0&showTitle=false&size=42133&status=done&style=none&taskId=u5a960790-1542-4db9-910e-93859feb3a5&title=&width=634)
从百度指数，也可以看到 Git 的优势被越来越多的人所认可。
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1620048686121-0fe5f3c1-d5ca-4956-8a27-75b4ebd86397.png#clientId=u26d01617-abe4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=315&id=uc0e4a818&margin=%5Bobject%20Object%5D&name=image.png&originHeight=476&originWidth=1235&originalType=binary∶=1&rotation=0&showTitle=false&size=91375&status=done&style=none&taskId=u8717a9cd-6909-4bda-b1fa-a441b8e0fba&title=&width=818)

## Git 的优势

- Git 可以在本地进行提交以支持离线工作；
- Git 可以在本地创建分支并且没有命名空间冲突的问题；
- Git 可以让提交通过 Pull Request 的方式进行，不需要所有的开发者都有主仓库的写权限；
- Git 在优化性能时选择了合并分支作为主要的性能衡量指标，将合并分支变成了成本非常低的操作以鼓励分支的使用；
- Git 通过 SHA-1 哈希来保证仓库中数据的可靠性，通过 SHA-1 就可以对数据进行校验，抵御了来自攻击者的恶意篡改；

Git 作为分布式的代码管理工具，越来越多的团队开始使用它并逐步替代集中式的 SVN 或 TFVC，同时也面临新的挑战。这里我将从以下几个方面总结分享一些最佳实践。

## 版本管理的挑战

大家工作在同一个仓库上，那么彼此的代码协作必然带来很多问题和挑战，如下：

1. **如何开始一个 Feature 的开发，而不影响别的 Feature？**
1. **由于很容易创建新分支，分支多了如何管理，时间久了，如何知道每个分支是干什么的？**
1. **哪些分支已经合并回了主干？**
1. **如何进行 Release 的管理？开始一个 Release 的时候如何冻结 Feature, 如何在 Prepare Release 的时候，开发人员可以继续开发新的功能？**
1. **线上代码出 Bug 了，如何快速修复？而且修复的代码要包含到开发人员的分支以及下一个 Release?**

大部分开发人员现在使用 Git 就只是用三个甚至两个分支，一个是 Master, 一个是 Develop, 还有一个是基于 Develop 打得各种分支。这个在小项目规模的时候还勉强可以支撑，因为很多人做项目就只有一个 Release, 但是人员一多，而且项目周期一长就会出现各种问题。

## Git 代码分支模型

在使用 Git 管理代码以及多人协作的开发模式下，一个团队甚至一个公司对 Git 的使用有统一规范的工作流程尤为重要
开发团队遵循统一的规则执行功能开发，问题修复，分支合并，版本迭代及发布等操作，可以使团队合作变得平滑顺畅，项目有序向前推进，
我们把组织内这样的工作流程（workflow）称为 Git 代码分支管理模型

**主流的 git 代码分支管理模型：**

- Git flow
- GitHub flow
- GitLab flow
- TBD flow

### 1. Git flow

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1620049024903-7c5d1c7a-7c57-4c25-a3c4-63378f34661c.png#clientId=u26d01617-abe4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=456&id=ud3a95db8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=503&originWidth=763&originalType=binary∶=1&rotation=0&showTitle=false&size=49143&status=done&style=none&taskId=u328f578c-02c8-4516-8ab3-59f32b81158&title=&width=691)
**Git flow 存在两个长期的独立分支：主分支 master 和开发分支 develop，**

- 主分支: 用于版本发布，主分支的每个版本都是质量稳定和功能齐全的发布版。
- 开发分支: 用于日常开发工作，存放最新的开发版代码。当开发分支的代码达到稳定状态并可以发布版本时，代码需要被合并到 master 分支，然后标记上对应的版本标签（tag）。

如果需要开发新的功能或者解决代码中的问题，则创建辅助分支来解决问题，辅助分支常用于：

- **功能开发（Feature），**
- **版本发布（Release），**
- **问题修复（Hotfix），**

在辅助分支上的工作完成后，辅助分支将被删除。

**## Feature 分支**
目的是开发新模块或新功能以满足客户需求，从 develop 分支创建，开发结束后只需要合并回 develop 分支，并不需要合并回 master 主分支。

**## Release 分支**
是用于准备发布的版本分支，从 develop 分支创建，创建时已经包含了发布所需要的所有功能，所以在这个分支上不再开发新功能，仅对这个预发布版本进行修复问题，创建文档及其他与发布相关的工作，
一切就绪后将 Release 分支合并回 master 主分支并打上相应的版本号标签（Tag），同时也合并回 develop 分支。
创建单独的 Release 分支可以避免在不同发布版本上的工作互相受影响，例如团队 A 准备发布版本 1.0 的同时，团队 B 正在进行版本 1.1 的功能开发，二者相互独立，不会互相影响。

**## Hotfix 分支**
通常用于紧急修复当前发布的版本中出现的严重问题，从发布版本的标签或 master 主分支创建，问题修复后合并回 master 主分支并打上新的版本号标签（Tag），同时也合并回 develop 分支或者正在进行中的 Release 分支。
创建单独的 Hotfix 分支可以避免打断正在进行中的各项开发工作，客户也不需要等到下一个发布周期才能拿到修复。

Git flow 需要同时维护两个甚至更多分支，Hotfix 分支从 master 创建，Release 和 Feature 分支从 develop 创建，工作完成后又需要将代码合并回 develop 和 master。

在实际应用中，很多开发者会忘记合并回 develop 或者 master，并且各辅助分支之间互相独立，
如果从 master 上 pull 代码不够及时，一方面可能造成某个分支长期使用已经过时或者错误的代码，另一方面如果与 master 相隔较远，合并分支时可能会有大量代码冲突，往往需要花费很多时间来消除代码冲突，并且非常容易出错，影响项目的持续集成。

Git flow 的优点在于流程清晰，分支管理严格，适用于发布周期比较长的“版本发布”，发布周期可能是几周，几个月，甚至更长时间。
由于保持两个长期分支同步的开销较大，所以 Git flow 并不适用于快速的“持续发布”，ThoughtWorks 还专门将 Git flow 列为不被推荐的技术，建议彻底停止使用。

### 2. GitHub flow

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1620049318132-dbcdd62e-ce07-441a-b04a-ba0873a3684b.png#clientId=ud14d936f-bd46-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=257&id=uc88b0054&margin=%5Bobject%20Object%5D&name=image.png&originHeight=257&originWidth=763&originalType=binary∶=1&rotation=0&showTitle=false&size=30849&status=done&style=none&taskId=ue178d511-6cd5-493d-afb6-9586219bf40&title=&width=763)

GitHub flow 是由 Scott Chacon 于 2011 年提出的代码分支管理模型，这是 GitHub 官方推荐的开发流程，以快速部署为目标，目前大部分开源项目都遵循这一流程。

Github flow 最大的特点是只有一个长期分支，即主分支 master，且主分支始终保持可发布状态。
从 master 上创建新分支进行功能开发、问题修复等，这些分支通过 pull request 将代码合并到 master。
为了保证主分支的代码质量，master 的权限只开放给一部分人。
Pull request 是请求别人 pull 你的代码库（repository），也就是把开发分支的代码经过代码评审并通过测试后，让有权限的管理员合并回 master。

不过在实际情况中，代码评审不可能检查出提交的代码中的所有问题，所以对于每次提交的代码进行自动化测试，
主分支代码的自动化部署尤其重要，自动化测试能在产品部署前及时发现一部分问题，如果产品部署之后发现严重问题，自动化部署可以在最短时间内把产品回滚到上一个版本。

#### 优点&缺点

Github flow 的优点在于流程简单灵活，不需要考虑及管理太多的分支，适用于需要快速集成及“持续发布”的项目，这类项目可能需要每天发布一个版本，甚至一天发布多个版本。
但是对于应用场景比较复杂的情况，例如：多个环境下的产品部署，多个版本的发布或问题修复，只有一个 master 便会显得力不从心。

### 3. Gitlab flow

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1620051820245-282bff01-1b2d-456b-bfb4-ee5a6c9db9bb.png#clientId=ud14d936f-bd46-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=517&id=u979528ba&margin=%5Bobject%20Object%5D&name=image.png&originHeight=517&originWidth=802&originalType=binary∶=1&rotation=0&showTitle=false&size=51727&status=done&style=none&taskId=uccec4fd8-61ab-4dae-9eef-238ce464b42&title=&width=802)

GitLab flow 是由 GitLab 的 CEO Sytse Sijbrandij 于 2014 年正式发布的代码分支管理模型，属于 GitHub flow 的演进版本。

与 GitHub 相同之处是也存在一个长期主分支 mater，从 master 上创建新分支进行功能开发、问题修复等，结束后合并回 master。
与 GitHub 不同之处是 GitLab flow 又考虑多环境部署等现实因素，增加 production 产品分支用于在不同的环境下部署产品，或者从 master 的稳定版本创建 release 发布分支用于发布软件。

如果在产品分支或者发布分支发现问题，就从对应版本分支创建修复分支，修复完成之后，GitLab flow 遵循 “上游优先” 的合并策略，也就是将代码先合并到 master，再合并到下游的 production 或 release 分支。

和 Github flow 类似，master 的修改权限只开放给部分人，开发分支的工作完成后，代码通过 merge request（类似于 GitHub flow 中的 pull request）请求有权限的管理员把代码合并（merge）回主分支

### 4. TBD flow

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1620051873878-946defd2-9fbe-4c95-a37c-e8241d71c156.png#clientId=ud14d936f-bd46-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=339&id=u623e853b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=339&originWidth=842&originalType=binary∶=1&rotation=0&showTitle=false&size=37470&status=done&style=none&taskId=uc1e4e96a-5dfa-4a14-8735-f2eb7fb1c87&title=&width=842)

TBD (Trunk-based Development) flow 是由 Paul Hammant 于 2013 年提出的模型。

TBD flow 最大的特点是所有开发都基于主干 trunk，不再有长期的开发分支，要求所有的提交尽快回到主干，这样可以共享最新的代码，并且能尽可能地减少合并冲突。
如果需要发布版本，可以基于 trunk 直接生成新的分支用于发布。

TBD flow 没有 pull 或者 push request，要求开发人员尽快把代码提交到主干分支，
但是 TBD flow 缺乏严格的流程来保证每一份提交代码的质量，如果一些项目开发人员众多且水平不一，同时工作在主分支上可能会在产品发布时才发现不可预知的问题，

所以 TBD flow 更适用于需要快速迭代的产品，如果在主干分支上发现问题，可以快速进行修复再合并回主干分支。

### 5. TBD++ flow

## ![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1620052063951-d3f3cb4b-54b9-4338-a47a-1f29be6ab50f.png#clientId=ud14d936f-bd46-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=466&id=u80bb996e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=466&originWidth=802&originalType=binary∶=1&rotation=0&showTitle=false&size=63993&status=done&style=none&taskId=ub1e0c551-f173-429d-8de5-da858740a64&title=&width=802)

TBD++ flow 是 Arrus 公司软件研发部门从 2015 年开始一直沿用的 Git 分支管理模型，
产品项目的客户主要是电信级服务运营商，每个国家或地区的需求在主要功能上一致，
但在客户定制化方面又存在不少差异，同时项目开发周期较长，整个周期一般在 3 个月到 2 年之间，软件产品在项目前期需要有快速的迭代，在项目后期需要有稳定的发布版本。

TBD++ flow 以敏捷开发为核心，同时吸收了以上几个主流模型的优点，主要特点如下

#### 1. 基于功能的主分支

只存在一个长期的独立分支，即主分支 master，主分支上功能齐全，通过自动测试保证基本功能运行正常，因为自动测试覆盖不全面或者手动测试不及时，所以无法保证主分支的每个版本都是质量稳定的发布版，但是可以根据功能的完成程度直接从主分支上创建迭代版本用于针对不同客户或者不同时期的功能演示。基于 master 开发功能或者修复问题需要用到以下两个辅助分支：

- Feature 分支：为了开发新模块或新功能以满足客户需求，从主分支上创建 Feature 分支，但是并不要求 Feature 分支上所有的提交尽快回到主分支，开发完成并且通过代码评审及功能测试后才能合并回 master 主分支。为了共用主分支上的最新代码以及避免合并代码时解决代码冲突引起的额外开销，在功能开发过程中 Feature 分支需要始终与 master 保持同步。
- Bugfix 分支：基于主分支创建 Bugfix 分支修复主分支上发现的问题，修复完成并且通过代码评审后代码合并回 master 主分支。

基于主分支的 Feature 分支和 Bugfix 分支完成后，开发者直接将代码合并回主分支 master，不需要像 GitLab 或 GitHub 那样依赖于少数几个有权限的管理员，这是因为如果一个项目中开发人员比较多的话，管理员没办法做到对每部分代码都熟悉或掌握，所以代码质量交由代码评审和功能测试来掌控，合并代码回主分支的操作由开发者自己完成。

主分支上的新代码有时候可能因为评审或测试不全面而带来新问题，例如破坏其他功能模块，甚至影响整体功能。为了能尽早发现问题，主分支上的每次提交都会触发系统级自动化测试，并且周期性地对主分支进行人工测试。一旦发现问题，主分支的专职配置管理员（Software Configuration Manager，SCM）将根据问题的严重性和紧迫性决定是否需要直接回退引起问题的提交，或者基于 master 创建 bugfix 分支进行问题修复。

####

#### 2. 基于发布的 Release 分支

Release 分支负责对外发布软件产品，每个 Release 分支也会配备专职版本配置管理员 SCM，SCM 具有对 Release 分支的最高管理权限。当 master 上已经包含了某个发布所需要的所有功能，并且没有已知的严重问题，此时由 SCM 从主分支上创建 Release 分支准备系统集成测试，和 Git flow 相同，在此分支上不再进行新功能的开发，仅在这个分支上进行修复问题，创建文档，客户参数配置及其他与发布相关的工作，这些代码同时也需要合并回 master 以确保主分支功能的完整性。
在每个 Release 分支正式发布前可能还需要将主分支上的一部分关键问题的修复选择性地同步（Cherry-pick）到 Release 分支，这个操作也是由 SCM 完成。

Release 分支上的工作一切就绪并通过系统集成测试后，SCM 在 Release 分支上打上相应的版本号标签（Tag）进行发布，这点和 Git flow 在主分支上进行发布不同。

软件产品发布之后，如果发现紧急或者严重的问题，此时需要基于版本发布时的 Release 分支标签创建 Hotfix 分支来修复此类问题，问题修复后合并回该 Release 分支以及其他同样需要此修复的 Release 分支，并打上新的版本号标签（Tag）用于发布，同时代码也需要合并回 master 以确保主分支的健壮性。

## 选择合适的分支模型

Git 代码分支管理模型各具特点，流程只是一个辅助工具，没有最好，只有最合适。
例如，

- **如果开发团队规模较小又比较分散，产品发布周期较短(例如:初创公司，或者开发的是一个网站或 Web 应用程序，在一天内可能需要发布多个版本)，可以选择 GitHub flow 或者 GitLab flow；**
- **如果开发团队规模较大，产品发布周期较长(例如:团队超过 20 人，采用了月度或季度发布周期，并且由一个团队负责并行开发多个项目)，可以选择 Git flow，发布周期较短可以选择 TBD flow；**
- **如果开发团队规模大，产品发布周期长，同时对敏捷的要求比较高，可以考虑 TBD++ flow。每个组织根据产品、项目、人员的特点找到最合适的模型才是共同的目标。**

## 最佳实践

## 参考

- 无需分支基于主干的开发是团队健康的重要标志[https://www.infoq.cn/article/tFwoy4gko3vJqp5oYYEO](https://www.infoq.cn/article/tFwoy4gko3vJqp5oYYEO)
- 别再推荐 Git Flow 了：[https://www.infoq.cn/article/i7m3UdTFLu1Lv2ai6abv](https://www.infoq.cn/article/i7m3UdTFLu1Lv2ai6abv)
- 一个成功的 Git 分支模型(译文)：[https://segmentfault.com/a/1190000018087325](https://segmentfault.com/a/1190000018087325)
