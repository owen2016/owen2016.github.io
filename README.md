# 关于我的博客

## 主题

最开始是基于[jekyll](https://www.jekyll.com.cn/)构建github pages，[博客搭建详细教程](https://github.com/qiubaiying/qiubaiying.github.io/wiki/%E5%8D%9A%E5%AE%A2%E6%90%AD%E5%BB%BA%E8%AF%A6%E7%BB%86%E6%95%99%E7%A8%8B)。

但是发现Jekyll是基于ruby的，构建配置有点麻烦，需要更多专业前端的知识。后来就看到了目前使用的[hexo-theme-matery](https://github.com/blinkfox/hexo-theme-matery), 这个主题满足我心目中的要求 `清新、简洁、定制化程度高、构建简单`. 如果你的博客准备基于`Hexo`, 可以果断使用这个主题。

最后感谢[闪烁之狐狸](http://blinkfox.com/2018/09/28/qian-duan/hexo-bo-ke-zhu-ti-zhi-hexo-theme-matery-de-jie-shao/) 和 [godweiyang.com](https://github.com/godweiyang/hexo-matery-modified)

## 个性化功能

基于原主题，我增加了一些我特殊的需求

### 1. 支持同步到 gitee/github

``` shell
git remote rm origin

git remote add github git@github.com:owen2016/owen2016.github.io.git
git remote add gitee git@gitee.com:owen2016/owen2016.git

git push gitee master
git push github master

```

### 2. 支持 “生成静态文件” 和 “开发源码” 同一个库不同分支 ph-pages/master

```yml
deploy:
  type: git
  repo: 
    gitee: git@gitee.com:owen2016/owen2016.git,gh-pages
    github: git@github.com:owen2016/owen2016.github.io.git,gh-pages
  message: "commit by hexo-one-command-deployment"
```

以上操作可以使用 hexo-build.sh，更新完后直接一键部署

``` shell
git add -A
git commit -m "$1"
git push gitee master -f
git push github master -f

hexo clean
hexo g
hexo d
```

## 文章示例

``` yml
---
title: typora-vue-theme主题介绍
date: 2018-09-07 09:25:00
---
```

``` yml
---
title: typora-vue-theme主题介绍
date: 2018-09-07 09:25:00
author: 赵奇
img: /source/images/xxx.jpg
top: true
cover: true
coverImg: /images/1.jpg
password: 8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
toc: false
mathjax: false
summary: 这是你自定义的文章摘要内容，如果这个属性有值，文章卡片摘要就显示这段文字，否则程序会自动截取文章的部分内容作为摘要
categories: Markdown
tags:
  - Typora
  - Markdown
---
```