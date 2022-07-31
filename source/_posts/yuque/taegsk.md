---
title: 敏捷实践思考
urlname: taegsk
date: '2021-05-18 23:11:42 +0800'
tags: []
categories: []
---

## 用户故事

用户故事通常使用下面的格式编写：
“作为……
我希望……
以便……”
这促使我们从用户的角度出发编写用户故事（虽然不一定是最终用户）。
但是，这些年来，我发现，使用这种格式编写操作故事并未真正带来同等的改善效果。这可能是因为“用户角度”没有影响解决方案的技术实现方式。不管怎样，如果你是自己实现解决方案，那么写上“作为一名系统管理员”或者“作为一名开发人员”就感觉有点多余。

在编写待办事项列表中的“技术待办事项”时，不使用“作为……我希望……以便……”这种格式的情况并不少见，类似地，我不推荐使用这种格式编写操作特性。取而代之，我更喜欢**使用“什么和为什么”格式，只是简单地列出需要做什么以及为什么做（提供上线文）。**

## 冲刺

感觉为期两周的冲刺正好可以开发新特性、测试&部署，然后向相关人员展示。再长一点就很难保持注意力，而反馈循环的数量会增长到一个让人稍微有点不适的数量。再短一点，比如一个周，那么临时会议和其他仪式在实际冲刺时间中的占比就会过高，就是说，你可以完成的工作就会很少。因此，对许多人来说，两个周刚好。这么长一段时间刚好可以让你铺下身子，专心完成你承诺的工作。

如果你在开发一款新产品，这很好，但如果你是在进行一些改进迭代或者开发产品的下一个版本呢？谁将负责生产平台上不断出现的所有问题？
如果你相当频繁地被这类事情打断（或者遭遇不同程度的此类干扰），那么你就会知道，这会严重地妨碍你兑现冲刺承诺。从帮助人们专注于现实目标来看，为期两周的冲刺似乎带来了很大的价值，但在一个不可预测的环境里，很难准确地确定你可以在多大程度上完成待办事项列列表上的内容。很难，但并不是不可能。

如果可以度量出待办事项列表上的工作我们平均能够完成多少，以及生产平台的问题平均打断我们多少次，那么我们大致上可以推导出两个速度。**待办事项速度是指我们可以以什么样的速度完成产品/服务待办事项列表上“计划好”的工作，而“计划外”速度是冲刺期间意外产生的工作量。跟踪这两个速度，我们可以做出有效的计划。**
当然，看板也是一种选择，可以兼顾计划好的和计划外的工作，不太清楚一周后要做什么的团队通常会选择这个框架。该框架还可以非常高效地交付周期较长的项目/版本，但需要很强的纪律性来确保可以动态、恰当地调整待办事项的优先级。

## 冲刺计划

如果你在做冲刺，就需要做冲刺计划。将 DevOps 引入冲刺计划，需要做以下工作：

- 邀请运维/基础设施/支持人员参加计划会议
- 不仅要讨论产品功能，还要讨论操作特性
- 把它们加入接下来的冲刺
- 把“打断”可能占用的时间&精力考虑进来——就是来自产品平台的计划外工作，如 Bug 修复、升级等（这个值就是“计划外速度”，它会显著降低待办事项速度。计划外速度越高，待办事项速度就越低）

## DevOps 反模式

DevOps 的重点是消除 Dev 和 Ops 之间的鸿沟，减少让人痛苦的工作交接，加强合作，以便类似“可部署性”、可扩展性、监控和技术支持这样的工作不会被简单地视为计划外的东西。
不过，我们已经开始看到 DevOps 场景中出现了强大的反模式，比如，Dev 团队和 DevOps 团队的隔离，导致另一个筒仓的产生，而没有做多少工作来加强合作。

问题是，从实践角度讲，关于如何将这种新的 DevOps 方法融入敏捷开发团队的信息极少。
我们需要采用什么做法？我们需要停止什么做法？我们如何开始？我们的团队应该配备什么角色？在很大程度上，这些问题仍然悬而未决。因此，团队只是“追加”了 DevOps，而没有将其完全整合到他们的软件开发流程。
![0.jpeg](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1655655039583-ff959bfd-08d5-4caa-94d7-edf6bb3ea805.jpeg#clientId=uc3fd37a0-f464-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=227&id=u2afec391&margin=%5Bobject%20Object%5D&name=0.jpeg&originHeight=254&originWidth=451&originalType=binary∶=1&rotation=0&showTitle=false&size=19440&status=done&style=none&taskId=ub58d6bd0-9ed5-403b-af45-4c3bcb00525&title=&width=403)![0.jpeg](https://cdn.nlark.com/yuque/0/2022/jpeg/5374140/1655655105654-57918e07-953f-4615-82c2-cbffe4a12658.jpeg#clientId=uc3fd37a0-f464-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=187&id=u17b3c61b&margin=%5Bobject%20Object%5D&name=0.jpeg&originHeight=137&originWidth=451&originalType=binary∶=1&rotation=0&showTitle=false&size=8114&status=done&style=none&taskId=ue72280ec-a815-4c2d-bc58-8889ea1c4f4&title=&width=615)
在这个典型的 DevOps 反模式中，我们完成了所有的敏捷仪式以及许多常规的 DevOps 实践，但是，最终的结果没有比以前更好——可操作性仍然是后期问题，产品针对开发优化，而不是交付和运维。这都是因为他们只是“追加”了关键的 DevOps 实践，而没有从一开始就合并进来。
不用说，解决方案就是从一开始就将这些好的 DevOps 实践合并进来，把它们吸收到我们日常的敏捷流程和实践中

## 团队建设

我们共事过的大部分敏捷团队都不包含 Ops、技术支持或基础设施专家。你可能会反驳说，并不是每个敏捷团队都有配备此类专家的强烈需求，你可能是对的，但不要忘了，对于测试人员、架构师、数据库工程师、UX 等，人们的说法也是完全一样的。
如果那种交付、支持、升级、扩展和维护产品的方式是重要的，你的团队就需要这些技能。
这意味着你要打破杰夫·贝索斯“两个披萨团队”的原则吗？也许吧。但是，如果你的那份披萨对你特别重要，那么就不断提高自己的技能吧！（那实际上没有听上去那么难——我们越趋向 X 即服务的世界，我们所需要的核心系统管理知识就越少。取而代之，我们都需要对云函数及相关服务有一个很好的了解。）

## 待办事项列表

如果我们有跨职能团队，那么我们就会需要跨职能的待办事项列表。
忘掉传统的产品待办事项列表——是时候采用一种包括服务操作性方面的全新方法了。我们有意使用了“服务”一词，因为现如今我们倾向于构建的实际上是服务，而不是用收缩塑料薄膜包装的产品。服务是需要部署、扩展、维护、监控和支持的产品，而我们的待办事项列表需要反映出来。

我们看到的大多数 Scrum 产品待办事项列表，90%的内容是传统特性，这些特性可以描述为一个最终用户期望特性的集合。剩下的 10%往往是与性能相关的东西，或者是与准备工作相关的东西（配置开发环境、准备数据库等）。很明显，这样的列表侧重于最终用户功能/产品特性。我不能确定，这是 Scrum 框架本身造成的，还是产品经理对最终用户存在偏见导致的（或者完全是另外一回事）。

因此，新式的服务待办事项列表（除了用户功能外）应该描述如下内容：

- 产品/服务的可扩展性（向上、向下、向内、向外——以及何时）
- 可部署性（需要在线部署而不停机吗？）
- 服务监控（哪些方面需要监控？每次变更后如何升级监控？）
- 日志（日志应该记录什么信息？采用什么格式？）
- 报警（谁？何时？如何？为什么？）
- 服务的可测试性
- 安全和法规遵从性方面，如加密模型、数据保护、PCI 法规遵从性、数据法规，等等
- 操作性能

Skelton 说：“为了避免在开始时‘使用旧的构建方式’，我们需要将相当一部分产品预算（和团队时间）用在运维方面。我发现，一般来说，将大约 30%的产品预算用在运维方面就会产生不错的结果，我们由此就可以获得可维护、可部署、可诊断、多年以后仍然可以有效运行的系统。”

需要注意的是，这些操作性和安全方面的需求会不断地变化，会随产品/服务演化，因此，我们不能只是在发布初期把所有那些工作完成，然后就转向传统的产品特性。例如，在系统取得商业成功之前实现系统自动扩展方案可能并不划算。又或者，为了符合新的安全规范，你需要修改加密模型。同样地，当在新的地方上线时，你可能需要修改那个部署模型。此外，当应用程序的功能发生任何大的变更时，监控通常都需要升级。

##