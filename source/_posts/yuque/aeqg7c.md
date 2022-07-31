---
title: 最详尽教程完整介绍-Windows 的 Linux 子系统-WSL1&WSL2
urlname: aeqg7c
date: '2022-03-17 22:14:29 +0800'
tags: []
categories: []
---

## 安装 WSL

### 1. 开启 WSL

必须启用“适用于 Linux 的 Windows 子系统”可选功能并重启，然后才能在 Windows 上运行 Linux 发行版。

以管理员运行 Powershell（开启 WSL，如已开启可跳过）
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform --启用“虚拟机平台”可选组件
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647529996839-81ae83f6-9e0f-4ccb-82e6-c84f859898d9.png#clientId=u55907c36-f633-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=302&id=u9c5fc070&margin=%5Bobject%20Object%5D&name=image.png&originHeight=302&originWidth=362&originalType=binary∶=1&rotation=0&showTitle=false&size=18666&status=done&style=none&taskId=uf0cfaa3f-8717-427a-82a6-6872236ef20&title=&width=362)

### 2. 安装 WSL Linux 发行版本

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647529645130-53f28a96-1707-463d-b93b-50b32ceded25.png#clientId=u55907c36-f633-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=503&id=ucd1bea0f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=521&originWidth=812&originalType=url∶=1&rotation=0&showTitle=false&size=41717&status=done&style=none&taskId=u6b677060-0ea0-4f4f-9375-4addf7b0f47&title=&width=784)

## 比较 WSL 1 和 WSL 2

WSL 1 和 WSL 2 之间的主要区别在于，在托管 VM 内使用实际的 Linux 内核、支持完整的系统调用兼容性以及跨 Linux 和 Windows 操作系统的性能。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647529681660-86e8e026-27aa-4448-a294-8760783cefa3.png#clientId=u55907c36-f633-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=374&id=u1d46ce81&margin=%5Bobject%20Object%5D&name=image.png&originHeight=399&originWidth=648&originalType=url∶=1&rotation=0&showTitle=false&size=19272&status=done&style=none&taskId=u5a473192-25aa-46cf-af01-8139782167d&title=&width=607)

WSL2 相比 WSL1 来说可以完美支持 Docker。与 WSL1 的模拟 Linux API 不同的是，WSL2 采用在 Hyper-V 虚拟机中运行的方案。可以说 WSL2 和原汁原味的 Linux 已经十分接近

- WSL1 没有 Linux 内核，不支持 docker；WSL2 是有 Linux 内核的轻量化虚拟机，支持 docker。
- 目前 docker 已经针对 WSL2 做了适配，安装时检测到 WSL2 就会启用 WSL2 后端，不仅能同时在 Windows 和 WSL 下操作 docker 服务器，还比以前的 docker on Windows 启动更快、占用资源更少。

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647530278119-6fa66970-364c-45d9-a44d-8270b9e6d642.png#clientId=u55907c36-f633-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=203&id=u0df7cf05&margin=%5Bobject%20Object%5D&name=image.png&originHeight=203&originWidth=960&originalType=binary∶=1&rotation=0&showTitle=false&size=33171&status=done&style=none&taskId=ubbf05da7-64c3-47a5-8c65-3f80d1e4469&title=&width=960)

### WSL1

不支持 Docker 的守护进程，但您可以使用[Docker CLI](https://nickjanetakis.com/blog/get-to-know-dockers-ecosystem#docker-cli)连接到通过[Docker for Windows](https://nickjanetakis.com/blog/should-you-use-the-docker-toolbox-or-docker-for-mac-windows)或您创建的任何其他 VM 运行的远程 Docker 守护进程

不能完全兼容 systemctl, systemd 等等，IO 速度相对原生 Linux 也是大打折扣，在编译和解压方面可以很深体会到。毕竟不是真正的 Linux，而是挂在 Windows NT 内核之上的仿 Linux 系统
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647533841852-102dae5e-fe63-4b38-a3af-3f19c667cb82.png#clientId=uaa6e97b1-f84b-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=464&id=ue727b28e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=464&originWidth=870&originalType=binary∶=1&rotation=0&showTitle=false&size=334227&status=done&style=none&taskId=u039006c7-43b5-4d8d-ab71-f198b0842bf&title=&width=870)

#### WSL1 与 Docker 集成

由于 WSL 还不是原生的 Linux，所以需要借助**Docker for Windows**来实现 Docker（Docker for Windows 是基于 Hyper-V 技术）
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647616126156-5387dd7a-bd51-4963-a6a0-5bb5305bc700.png#clientId=u28df5a07-27f3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=333&id=u31873250&margin=%5Bobject%20Object%5D&name=image.png&originHeight=333&originWidth=515&originalType=binary∶=1&rotation=0&showTitle=false&size=33307&status=done&style=none&taskId=u70c242e1-b9fc-4821-a79d-5768836e12e&title=&width=515)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647616081225-3327d150-8261-4238-8967-53efc10feb01.png#clientId=u28df5a07-27f3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=396&id=u586aaa98&margin=%5Bobject%20Object%5D&name=image.png&originHeight=499&originWidth=936&originalType=binary∶=1&rotation=0&showTitle=false&size=62026&status=done&style=none&taskId=ud8cba253-3a84-4e60-9f99-808195c821e&title=&width=743)

另外一种方式是，在 WSL1 中安装 docker 客户端，连接 docker server, 来解决在 WSL1 上使用 docker 的问题。（PS: Win10 的 Linux 子系统是装不了 docker （服务端）的，但是可以安装客户端）

sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL [https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg](https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg) | sudo apt-key add -
sudo apt remove gpg
sudo apt install gnupg1
sudo apt install software-properties-common
sudo add-apt-repository "deb [arch=amd64] [https://mirrors.aliyun.com/docker-ce/linux/ubuntu](https://mirrors.aliyun.com/docker-ce/linux/ubuntu) $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647616722592-6ac604ac-c5c6-46fe-8f2b-0a550f9e2518.png#clientId=u28df5a07-27f3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=172&id=uc4a8fc78&margin=%5Bobject%20Object%5D&name=image.png&originHeight=172&originWidth=761&originalType=binary∶=1&rotation=0&showTitle=false&size=16568&status=done&style=none&taskId=u7e69bcf6-6297-4b0c-8ad3-cc566a22bfb&title=&width=761)

**参考**

- Running Docker containers on Bash on Windows 来自 <[https://blog.jayway.com/2017/04/19/running-docker-on-bash-on-windows/](https://blog.jayway.com/2017/04/19/running-docker-on-bash-on-windows/)>
- Setting Up Docker for Windows and WSL to Work Flawlessly 来自 <[https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)>

### WSL2

WSL2 是第二代 WSL，包含在 2020 年 5 月正式发布 Windows 10 v2004 版中。相比第一代，新的 WSL2 重新设计了架构，使用真正的 Linux 内核，几乎具有 Linux 的所有完整功能。启用 WSL2 的 Linux 系统启动时间非常快，内存占用很少，并且，WSL 2 还可以直接原生运行 Docker，VS Code 编辑器还有 Remote-WSL 插件，相对于完整的 linux 虚拟机只是不支持 systemctl、systemd，不能直接运行图形桌面。Windows 也越来越向虚拟平台靠拢，Windows NT 内核和 Linux 内核都是运行在虚拟平台之上的，是平级的
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647616950907-526c1f16-0ef6-4528-bf9c-c05ad353ad23.png#clientId=u28df5a07-27f3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=333&id=udf317e50&margin=%5Bobject%20Object%5D&name=image.png&originHeight=424&originWidth=700&originalType=url∶=1&rotation=0&showTitle=false&size=161175&status=done&style=none&taskId=u34a1417d-a3db-434d-a330-5bcb98aebab&title=&width=549)

> We will replace the Hyper-V VM we currently use by a WSL 2 integration package. This package will provide the same features as the current Docker Desktop VM: Kubernetes 1-click setup, automatic updates, transparent HTTP proxy configuration, access to the daemon from Windows, transparent bind mounts of Windows files, and more.

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647619834250-3722735b-210f-4122-8477-4d995f108138.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=574&id=UBGi4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=622&originWidth=1110&originalType=url∶=1&rotation=0&showTitle=false&size=317756&status=done&style=none&taskId=uf878cd46-b291-49f8-9a0b-74e7aeb633d&title=&width=1024)

#### 升级到 WSL2

如果发现 VERSION 为 1，说明 Ubuntu 运行在 WSL1 下，可以升级到 WSL2。同样，WSL2 也可以降级到 WSL1。
wsl -l -v #查看已安装 Linux 版本和名称，完整命令格式：wsl --list --verbose
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647616963376-c6e9a539-a9a5-4c50-abf6-e6f9ae876e2e.png#clientId=u28df5a07-27f3-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=ub80c7cd3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=109&originWidth=453&originalType=url∶=1&rotation=0&showTitle=false&size=6138&status=done&style=none&taskId=u07270dbe-1c37-41d4-9504-d3451b31c2d&title=)
**WSL2 需要 Windows build 18917 更新, **WSL 不需要. 但是最好首先将操作系统更新到需要的版本, 而不是先安装 WSL 再更新
WSL 2 需要更新其内核组件。有关信息，请访问
[https://aka.ms/wsl2kernel](https://link.zhihu.com/?target=https%3A//aka.ms/wsl2kernel)

**具体步骤参考 ：** [https://docs.microsoft.com/zh-cn/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package](https://docs.microsoft.com/zh-cn/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package)

安装 WSL 2 之前，必须启用“虚拟机平台”可选功能
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647617434043-68363fa6-e74a-4283-89fb-d16fe8221f6a.png#clientId=ue97c3a5d-fad2-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=241&id=u65f1cc33&margin=%5Bobject%20Object%5D&name=image.png&originHeight=241&originWidth=780&originalType=binary∶=1&rotation=0&showTitle=false&size=9529&status=done&style=none&taskId=u50de9bcb-7236-4b89-9e8d-08c57abdd9b&title=&width=780)
wsl --set-version Ubuntu 2 #升级到 WSL2，其中 Ubuntu 是已经安装的 Linux 名称，命令格式：wsl --set-version <Distro> <Version>
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647617953943-e6163a14-614d-44fc-8281-c81eb38c43ae.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=302&id=u350b9ea1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=302&originWidth=571&originalType=binary∶=1&rotation=0&showTitle=false&size=32341&status=done&style=none&taskId=u4f963d55-e5c6-4b21-a9be-69bea82a2ba&title=&width=571)

启用 WSL 后，通过 \\wsl$ 可以访问 WSL 文件
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647618355710-9d079dcd-3727-4609-8aba-6d917d86b611.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=121&id=mVv0w&margin=%5Bobject%20Object%5D&name=image.png&originHeight=121&originWidth=555&originalType=binary∶=1&rotation=0&showTitle=false&size=4995&status=done&style=none&taskId=u423ce7dd-5202-4a2e-a61c-7b61c8aac2b&title=&width=555)

#### WSL2 与 docker 集成

最初的 WSL 是在 Windows 之上模拟 Linux 内核，但是 Windows 和 Linux 之间存在如此基本的差异，以至于某些事情不可能以与本机 Linux 相同的行为实现，这意味着不可能直接在 WSL 中运行[Docker Engine](https://www.docker.com/products/container-runtime)和 Kubernetes
在 WSL1 中，Docker Desktop 通过 Hyper-V 虚拟机去运行 docker 环境的
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647618906482-1ce2161d-012d-48ec-b487-600ccf945eb6.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=418&id=u75be4e9d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=481&originWidth=1127&originalType=url∶=1&rotation=0&showTitle=false&size=48195&status=done&style=none&taskId=u1628185b-5aef-482a-895a-ff1d96a6523&title=&width=979)

升级到 WSL2 之后， Docker Desktop 可以直接用 WSL2，直接运行在 Linux 内核上了
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647618842640-e61a1930-1d25-4900-8689-4153f8d54276.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=296&id=u5ed60b91&margin=%5Bobject%20Object%5D&name=image.png&originHeight=316&originWidth=550&originalType=binary∶=1&rotation=0&showTitle=false&size=75614&status=done&style=none&taskId=u1dd5d3c4-9729-4fbb-9d46-0f083d04fb1&title=&width=516)
通过如下设置，Docker Desktop 就和 WSL2 分发版本进行了集成，无需在 WSL 中安装 docker; 当然，也可以选择不与 Docker Desktop 集成，直接在 WSL 中运行 docker 容器。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647618808924-559ee531-d44e-4877-8dd0-dc2690b4fda7.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=262&id=u1d167c66&margin=%5Bobject%20Object%5D&name=image.png&originHeight=288&originWidth=813&originalType=url∶=1&rotation=0&showTitle=false&size=31377&status=done&style=none&taskId=u2fb22b61-3ced-45a8-abcb-961e4e9cd28&title=&width=740)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647619069350-62cf0d62-6dda-40a1-be1b-e6f82362b58d.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=277&id=uc6d43112&margin=%5Bobject%20Object%5D&name=image.png&originHeight=277&originWidth=742&originalType=binary∶=1&rotation=0&showTitle=false&size=24409&status=done&style=none&taskId=u313a8091-4213-4b90-b84a-06c993ba48d&title=&width=742)
启用 WSL 后，docker 运行数据都在 WSL 发行版中，文件位置都只能由 WSL 管理

安装 docker 后，docker 会自动创建 2 个发行版：

- docker-desktop
- docker-desktop-data

![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647619110994-00cd41be-1a83-4304-b451-0ee7e1326626.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=121&id=mivs6&margin=%5Bobject%20Object%5D&name=image.png&originHeight=121&originWidth=483&originalType=binary∶=1&rotation=0&showTitle=false&size=11593&status=done&style=none&taskId=u8d6ad613-c09b-4b87-8b2f-249173389f8&title=&width=483)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647619089784-c4b415b0-f466-493d-b9b6-17b873e28259.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=171&id=u519fbe52&margin=%5Bobject%20Object%5D&name=image.png&originHeight=171&originWidth=779&originalType=binary∶=1&rotation=0&showTitle=false&size=10412&status=done&style=none&taskId=u6756944a-05dc-48d7-9390-e886d67d4f5&title=&width=779)
WSL 发行版默认都是安装在 C 盘，在%LOCALAPPDATA%/Docker/wsl 目录
docker 的运行数据、镜像文件都存在%LOCALAPPDATA%/Docker/wsl/data/ext4.vhdx 中

通过 WSL 2 集成，您仍然可以体验到与 Windows 的无缝集成，但在 WSL 中运行的 Linux 程序也可以执行相同的操作。这对于从事面向 Linux 环境的项目或为 Linux 量身定制的构建过程的开发人员产生了巨大影响。不再需要维护 Linux 和 Windows 构建脚本！例如，Docker 的开发人员现在可以在 Windows 上的 Linux Docker 守护程序上工作，使用与 Linux 计算机上的开发人员相同的工具和脚本集：
![](https://cdn.nlark.com/yuque/0/2022/gif/5374140/1647620311643-f99812b7-f6c2-4594-a564-587eb487b996.gif#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u83c87f14&margin=%5Bobject%20Object%5D&originHeight=563&originWidth=1000&originalType=url∶=1&rotation=0&showTitle=false&status=done&style=none&taskId=u89614f24-5cc9-4d9c-b6e0-e994e186d4f&title=)

注：WSL2 Docker 最爽的地方是和宿主机 Win10 共享 network，我们在宿主机 Win10 使用 localhost 加端口号就可以访问 Docker 中对应 container 中的服务，十分方便
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647622786592-610e435f-4e22-4d54-8a4d-a41f7c69f524.png#clientId=u3e440c5d-9b01-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=288&id=u808edd32&margin=%5Bobject%20Object%5D&name=image.png&originHeight=345&originWidth=1218&originalType=binary∶=1&rotation=0&showTitle=false&size=48052&status=done&style=none&taskId=u5d33b5c5-a941-4325-a209-9df3d3f591c&title=&width=1018)

## WSL 使用

wsl #启动
wsl --shutdown #关闭所有正在运行的 Linux 和 WSL 2

启动 WSL2 之后，会在任务管理器中发现多了一个 虚拟机工作线程
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647620476353-e781c988-b01d-4236-8ead-2a8ab68e48aa.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u2bb541df&margin=%5Bobject%20Object%5D&name=image.png&originHeight=59&originWidth=602&originalType=url∶=1&rotation=0&showTitle=false&size=23165&status=done&style=none&taskId=u444d5e68-0b19-43ae-96fe-74c0aa65b59&title=)

**访问 wsl 文件**
![image.png](https://cdn.nlark.com/yuque/0/2022/png/5374140/1647620476354-618523e3-db05-4a76-9ee2-247a70183e7b.png#clientId=ub4b3da5e-c2f5-4&crop=0&crop=0&crop=1&crop=1&from=paste&id=u7f0c1378&margin=%5Bobject%20Object%5D&name=image.png&originHeight=287&originWidth=598&originalType=url∶=1&rotation=0&showTitle=false&size=21869&status=done&style=none&taskId=u3520d4f7-df82-4068-a6bf-94348981365&title=)

**卸载发行版**
有时候某个 Linux 发行版不再使用，或者是环境被搞坏需要重装，这时候我们可以卸载掉这个 Linux 发行版。方法如下。

- 首先使用：wslconfig /l 命令查看系统内安装的 Linux 发行版。
- 然后使用：wslconfig /u <发行版名称>卸载掉指定的发行版 Linux。
