---
title:  Markdown 教程
top: false
cover: false
toc: true
mathjax: false
date: 2019-07-2 22:51:05
img:
coverImg:
password:
summary:
tags:  
- Markdown
categories:
- 工具
---

---
> Markdown 是一种简单的、轻量级的标记语法。用户可以使用诸如 * # 等简单的标记符号以最小的输入代价生成极富表现力的文档。
>
> Markdown具有很多优点：
>
> - 写作中添加简单符号即完成排版，所见即所得。让你专注于文字而不是排版。
> - 格式转换方便，Markdown 的文本你可以轻松转换为 html、pdf等。
> - 可以保存成纯文本

## 1. 标题

标题能显示出文章的结构。行首插入1-6个# ，每增加一个#表示更深入层次的内容，对应到标题的深度由 1-6 阶。

注：标准语法一般在#后跟个空格再写文字

**示例：**

```text
Atx风格

# 这是一级标题
## 这是二级标题
### 这是三级标题
#### 这是四级标题
##### 这是五级标题
###### 这是六级标题
```

除此之外，Markdown还支持另外一种标题展示形式，使用下划线进行文本大小的控制

```text
SetText风格

这是一级标题
===
这是二级标题
---
```

使用这种方式处理标题仅有两种表现形式，即一级标题和二级标题

## 2. 字体

### 2.1 基本样式

要加粗的文字左右分别用两个*号包起来
 \*\*加粗\*\*

要倾斜的文字左右分别用一个*号包起来
\*斜体\*

要倾斜和加粗的文字左右分别用三个*号包起来
\*\*\*斜体加粗\*\*\*

要加删除线的文字左右分别用两个~~号包起来
\~\~删除线\~\~

要加删除线的文字左右分别用两个==号包起来
\=\=高亮\=\=

**示例：**  
**这是加粗的文字**  
*这是倾斜的文字*`  
***这是斜体加粗的文字***  
~~这是加删除线的文字~~  
==这是加粗的文字==  

### 2.2 常用转义字符

MarkDown利用了很多特殊符号标识语法，但在需要输入这些符号就需要利用转义字符来控制，避免MarkDown语法解析。

```text
\\ 反斜杠
\` 反引号
\* 星号
\_ 下划线
\{\} 大括号
\[\] 中括号
\(\) 小括号
\# 井号
\+ 加号
\- 减号
\. 英文句号
\! 感叹号
```

### 2.3 添加空格

跟word等其他编辑器不同，Markdown只能识别一个空格（在半角输入状态下）, 有下面两个解决方案。

- 手动输入空格 （&nbsp；）。**注意！**此时的分号为英文分号，但是不推荐使用此方法，太麻烦！

- 使用全角空格。即：在全角输入状态下直接使用空格键就ok了

### 2.4 字体颜色

使用Markdown的同学最郁闷的地方恐怕就是不能给文字添加颜色了。事实上，Markdown的最初目标就是为纯写作而生的。因此，它并没有考虑文字颜色这一点。所以，单纯使用Markdown设置文字颜色已经做不到了。但你可以这样做：

**示例：**
<font color='#ff0000'>字体颜色</font>

## 3. 代码

**语法：**

**单行代码**：代码之间分别用一个反引号包起来
    \`代码内容\`

**代码块**：代码之间分别用三个反引号包起来，且两边的反引号单独占一行
\`\`\`
  代码...
  代码...
  代码...
\`\`\`

**示例：**

单行代码
`create database hero;`

代码块

``` shell
    function fun(){
         echo "这是一句非常牛逼的代码";
    }
    fun();
```

```python
@requires_authorization
class SomeClass:
    pass

if __name__ == '__main__':
    # A comment
    print 'hello world'
```

## 4. 段落&引用

## 4.1 段落

- 换行是在行尾加两个空格 [空格 + 空格 + 回车]

## 4.2 引用

Markdown提供了一个特殊符号>用于段首进行强调，被强调的文字部分将会高亮显示

在引用的文字前加>即可。引用也可以嵌套，如加两个>>，三个>>>，n个...

**示例：**

> 这是引用的内容
>> 这是引用的内容
>>>> 这是引用的内容

### 4.3 分割线

三个或者三个以上的 - 或者 * 都可以。

## 5.  插入图片&链接

### 5.1 插入图片

**语法：**

**Inline** (titles are optional):

`![alt text](/path/img.jpg "Title")`

**Reference-style:**

`![alt text][id]`

[id]: /url/to/img.jpg "Title"

- alt- 就是显示在图片下面的文字，相当于对图片内容的解释。
- title- 是图片的标题，当鼠标移到图片上时显示的内容。title可加可不加

**示例：**
![blockchain](https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=702257389,1274025419&fm=27&gp=0.jpg "区块链")

![cmd-markdown-logo](https://www.zybuluo.com/static/img/logo.png)

![](https://gitee.com/owen2016/pic-hub/raw/master/pics/20200928231653.JPG)

**注： 引用图片和链接的唯一区别就是在最前方添加一个感叹号。**

### 5.2 插入链接

**Inline:**
`An [example](http://url.com/ "Title")`

[点击跳转至百度](http://www.baidu.com )

#### [点击跳转至必应](http://www.bing.com "必应")

**Reference-style labels** (titles are optional):

`An [example][id]. Then, anywhere
else in the doc, define the link:
[id]: http://example.com/  "Title"`

I get 10 times more traffic from [Google][1] than from [Yahoo][2] or [MSN][3].

**Email:**
<>包括的URL或邮箱地址会被自动转换成为超链接

`An email <example@example.com> link.`

<xxxxxx@126.com>

## 6. 列表

## 6.1 无序列表

**语法:**
无序列表用 - + * 任何一种都可以

- 整理知识，学习笔记

- 发布日记，杂文，所见所想

  - 撰写发布技术文稿（无序列表内嵌列表空二个空格）
  - 撰写发布学术论文

注意：- + *跟内容之间都要有一个空格;**整篇文档无序列表符号必须一致**

### 6.2 有序列表

**语法：**
数字加点

1. 整理知识，学习笔记
2. 发布日记，杂文，所见所想
3. 撰写发布技术文稿（代码支持）
4. 撰写发布学术论文（LaTeX 公式支持）

注意：序号跟内容之间要有空格

### 6.3 列表嵌套

上一级和下一级之间敲三个空格即可

1. Fruit
   1. Apple
   2. Orange
   3. Peach
   4. Banana
2. Vegetable

### 6.4 列表+引用

> - 整理知识，学习笔记
> - 发布日记，杂文，所见所想
> - 撰写发布技术文稿（代码支持）
> - 撰写发布学术论文（LaTeX 公式支持）

- [ ] 支持以 PDF 格式导出文稿
- [ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率
- [x] 新增 Todo 列表功能
- [x] 修复 LaTex 公式渲染问题
- [x] 新增 LaTex 公式编号功能

- 段落一
    > This module implements a number of iterator building blocks inspired by constructs from APL, Haskell, and SML. Each has been recast in a form suitable for Python.
- 段落二
    > 区块标记二

## 7. 表格

**语法：**

``` text
表头|表头|表头
---|:--:|---:
内容|内容|内容
内容|内容|内容
```

注：三个短横杠左右的冒号用于控制对齐方式，只放置左边冒号表示文字居左，只放置右边冒号表示文字居右，如果两边都放置冒号表示文字居中。

示例：

```text
姓名|技能|排行
:--|:--|:--
刘备|哭|大哥
关羽|打|二哥
张飞|骂|三弟
```

```text
| 项目        | 价格   |  数量  |
| --------   | -----:  | :----:  |
| 计算机     | \$1600 |   5     |
| 手机        |   \$12   |   12   |
| 管线        |    \$1    |  234  |
```

