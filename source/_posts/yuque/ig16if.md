---
title: MarkdownLint错误问题解释
urlname: ig16if
date: '2022-07-30 19:19:22 +0800'
tags: []
categories: []
---

使用 VSCode 编写 Markdown 文件时，建议安装插件`markdownlint`，它可以帮助自己更加规范的写文章.

下面是所有的 markdown 语法错误信息以便纠错。

## MD001 - Heading levels should only increment by one level at a time

标题级数只能每次扩大一个，也就是说不能隔级创建标题，必须 h1-h2-h3...这样

## MD002 - First heading should be a top level heading

文档的第一个标题必须是最高级的标题（标题等级 1 级到 6 级逐渐降低）

参数： `"level"：指定最高级标题的级数，默认是1`

## MD003 - Heading style

整篇文档要采用一致的标题格式

```latex
参数：
"style"：字符串，指定文档标题的格式，有("consistent", "atx", "atx_closed", "setext", "setext_with_atx", "setext_with_atx_closed")五种，默认是"consistent"，也就是整篇文档一致

标题格式必须统一，一般不能混用，但"setext_with_atx", "setext_with_atx_closed"格式可以在"setext"格式二级标题后接着使用"atx"或"atx_closed"格式的标题
```

## MD004 - Unordered list style

整篇文档的无序列表的格式要一致

```latex
参数：
"style"：字符串，指定无序列表的定义格式，有("consistent", "asterisk", "plus", "dash", "sublist")五种，分别表示“定义时符号前后一致”，“用星号定义”，“用加号定义”，“用减号定义”，“定义多重列表时用不同的符号定义”，默认是"consistent"
```

## MD005 - Inconsistent indentation for list items at the same level

同一个等级的列表的缩进要一致;在有序列表中，前面的数字序号可以左对齐，也可以右对齐

## MD006 - Consider starting bulleted lists at the beginning of the line

一级标题不能够缩进

## MD007 - Unordered list indentation

无序列表嵌套的时候默认采取两个空格的缩进方式

```latex
参数：
"ident"：指定无序列表嵌套时缩进的空格数，默认是2
```

## MD008 - 无

## MD009 - Trailing spaces

行尾最多可以添加两个空格，超出之后会有警告，最好每次都是两个空格因为两个空格刚好可以用来换行

```latex
参数：
"br_spaces"：指定在行尾可以添加的空格数目，空格数目建议大于等于2，如果小于2，会默认为0，也就是不允许任何行尾的空格
"list_item_empty_lines"：字符串，指定在列表中是否(true or false)用默认的空格数缩进空行，有的解释器会要求列表中的空行要缩进
```

## MD010 - Hard tabs

不能使用 tab 来进行缩进，要使用空格

```latex
参数：
"code_blocks"：指定本条规则在代码块里是否(true or false)生效
```

## MD011 - Reversed link syntax

内联形式的链接和创建方式是否错误，中括号和圆括号是否使用正确

## MD012 - Multiple consecutive blank lines

文档中不能有连续的空行（文档末可以有一个空行），在代码块中这个规则不会生效

```latex
参数：
"maximum"：指定文档中可以连续的最多空行数，默认值是1
```

## MD013 - Line length

默认行的最大长度是 80，此规则对代码块、表格、标题也生效

```latex
参数：
"line_length"：指定行的最大长度，默认是80
"heading_line_length"：指定标题行的最大长度，默认是80
"code_blocks"：指定规则是否(true or false)对代码块生效，默认true
"tables"：指定规则是否(true or false)对表格生效，默认true
"hesdings"：指定规则是否(true or false)对标题生效，默认true
```

## MD014 - Dollar signs used before commands without showing output

在代码块中，终端命令前不需要有美元符号(![](https://g.yuque.com/gr/latex?)%0A%E5%A6%82%E6%9E%9C%E4%BB%A3%E7%A0%81%E5%9D%97%E4%B8%AD%E6%97%A2%E6%9C%89%E7%BB%88%E7%AB%AF%E5%91%BD%E4%BB%A4%EF%BC%8C%E4%B9%9F%E6%9C%89%E5%91%BD%E4%BB%A4%E7%9A%84%E8%BE%93%E5%87%BA%EF%BC%8C%E5%88%99%E7%BB%88%E7%AB%AF%E5%91%BD%E4%BB%A4%E5%89%8D%E5%8F%AF%E4%BB%A5%E6%9C%89%E7%BE%8E%E5%85%83%E7%AC%A6%E5%8F%B7(#card=math&code=%29%0A%E5%A6%82%E6%9E%9C%E4%BB%A3%E7%A0%81%E5%9D%97%E4%B8%AD%E6%97%A2%E6%9C%89%E7%BB%88%E7%AB%AF%E5%91%BD%E4%BB%A4%EF%BC%8C%E4%B9%9F%E6%9C%89%E5%91%BD%E4%BB%A4%E7%9A%84%E8%BE%93%E5%87%BA%EF%BC%8C%E5%88%99%E7%BB%88%E7%AB%AF%E5%91%BD%E4%BB%A4%E5%89%8D%E5%8F%AF%E4%BB%A5%E6%9C%89%E7%BE%8E%E5%85%83%E7%AC%A6%E5%8F%B7%28&id=FHhPp))，如：

```shell
$ ls
foo bar
$ cat foo
hello world
```

## MD018 - No space after hash on atx style heading

标题格式如果是"atx"的话，#号和文字之间需要一个空格隔开

## MD019 - Multiple spaces after hash on atx style heading

标题格式如果是"atx"的话，#号和文字之间只需要一个空格隔开，不需要多个

## MD020 - No space inside hashes on closed atx style heading

在 closed_atx 格式的标题中，文字和前后的#号之间都需要一个空格隔开

## MD021 - Multiple spaces inside hashes on closed atx style heading

在 closed_atx 格式的标题中，文字和前后的#号之间只需要一个空格隔开，不能有多余的

## MD022 - Headings should be surrounded by blank lines

标题的上下行必须都是空格

```latex
参数：
"lines_above"：指定标题行上方的空行数，默认为1，可以设为更大或0
"lines_below"：指定标题行下方的空行数，默认为1，可以设为更大或0

注意当此处的空行设为比1大的数时，规则MD012的设置也要改
```

## MD023 - Headings must start at the beginning of the line

标题行不能缩进

## MD024 - Multiple headings with the same content

在文档中不能有重复性的标题

```latex
参数：
"siblings_only"：默认为false，设为true时，不同标题下的子标题内容可以重复
```

## MD025 - Multiple top level headings in the same document

同一个文档中，只能有一个最高级的标题，默认也只能有一个一级标题

```latex
参数：
"level"：指定文档最高级的标题，默认是1
"front_matter_title"：字符串，指定在文档开头处的front matter中的标题，这个标题将作为整篇文档的最高级标题，如果文档中再次出现最高级标题，将会给出警告，另外，如果不想在front matter中指定标题，就把本参数的值设置为""
```

## MD026 - Trailing punctuation in heading

标题的末尾不能有". , ; : ! ? "这些符号

```latex
参数：
"punctuation"：字符串，指定标题行尾不能有的标点符号，默认是".,;:!?"
```

此规则默认的是英文的标点符号，中文标点符号不在规则之内

## MD027 - Multiple spaces after blockquote symbol

创建引用区块时，右尖括号 ( > ) 和文字之间有且只能有一个空格

## MD028 - Blank line inside blockquote

两个引用区块间不能仅用一个空行隔开或者同一引用区块中不能有空行，如果一行中没有内容，则这一行要用>开头

## MD029 - Ordered list item prefix

有序列表的前缀序号格式必须只用 1 或者从 1 开始的加 1 递增数字("one_or_ordered")

```latex
参数：
"style"：字符串，指定前缀序号的格式，("one","ordered","one_or_ordered","zero")，分别表示只用1做前缀，用从1开始的加1递增数字做前缀，只用1或者从1开始的加1递增数字做前缀，只用0做前缀，默认值是"one_or_ordered"

本条规则支持在前缀序号中补0，以实现对齐，如：
...
08.  one
09.  two
10.  three
...
```

## MD030 - Spaces after list markers

列表（有序、无序）的前缀符号和文字之间用 1 个空格隔开，在列表嵌套或者同一列表项中有多个段落时，无序列表缩进两个空格，有序列表缩进 3 个空格

```latex
参数：
"ul_single","ol_single","ul_multi","ol_multi"：分别规定无序列表单个段落，有序列表单个段落，无序列表多个段落，有序列表多个段落的前缀符号和文字之间的空格数，默认是1
```

## MD031 - Fenced code blocks should be surrounded by blank lines

单独的代码块前后需要用空行隔开（除非是在文档开头或末尾），否则有些解释器不会解释为代码块

## MD032 - Lists should be surrounded by blank lines

列表（有序、无序）前后需要用空行隔开，否则有些解释器不会解释为列表，列表的缩进必须一致，否则会警告

## MD033 - Inline HTML

文档中不允许使用 html 语句

```latex
参数：
"allowed_elements"：自定义允许的元素，是一个字符串数组，默认是空(empty)
```

## MD034 - Bare URL used

单纯的链接地址需要用尖括号 (<>) 包裹，否则有些解释器不会解释为链接

## MD035 - Horizontal rule style

创建水平线时整篇文档要统一，要和文档中第一次创建水平线使用的符号一致

```latex
参数：
"style"：字符串，指定创建水平线的方式，值有：("consistent","***","---","___")，默认是"consistent"
```

## MD036 - Emphasis used instead of a heading

不能用强调来代替标题

```latex
参数：
"punctuation"：字符串，指定用于结尾的标点符号，以此符号结尾的强调不会被视为以强调代替标题，默认值是".,;:!?"

此规则会检查只包含强调的单行段落，如果这种段落不是以指定的标点符号结尾，则会被视为以强调代替标题，会给出警告
```

## MD037 - Spaces inside emphasis markers

用于创建强调的符号和强调的的文字之间不能有空格

## MD038 - Spaces inside code span elements

当用单反引号创建代码段的时候，单反引号和它们之间的代码不能有空格，如果要把单反引号嵌入到代码段的首尾，创建代码段的单反引号和嵌入的单反引号间要有一个空格隔开

## MD039 - Spaces inside link text

链接名和包围它的中括号之间不能有空格，但链接名中间可以有空格

## MD040 - Fenced code blocks should have a language specified

单独的代码块（此处是指上下用三个反引号包围的代码块）应该指定代码块的编程语言，这一点有助于解释器对代码进行代码高亮

## MD041 - First line in file should be a top level heading

文档的第一个非空行应该是文档最高级的标题，默认是 1 级标题

```latex
参数：
"level"：指定文档最高级的标题，默认是1
"front_matter_title"：字符串，指定在文档开头处的front matter中的标题，这个标题将作为整篇文档的最高级标题，另外，如果不想在front matter中指定标题，就把本参数的值设置为""
```

## MD042 - No empty links

链接的地址不能为空

## MD043 - Required heading structure

要求标题遵循一定的结构，默认是没有规定的结构

```latex
参数：
"headings"：字符串数组，指定标题需要遵循的结构，默认是"null"，可以自行指定结构，如；
[
    "# head",
    "## item",
    "## detail",
    "*"
]

星号(*)表示对应的标题是可选的，没有强制要求，本条具体可以参照MD043
```

## MD044 - Proper names should have the correct capitalization

指定一些名称，会检查它是否有正确的大写

```latex
参数：
"names"：字符串数组，指定要检查需要大写的名称，默认是空("null")
"code_blocks"：指定本规则是否(true or false)对代码块生效，默认是true
一些经常使用的名称可以使用本规则防止其拼写错误，比如JavaScript中字母J和S需要大写，就可以写到参数"names"中，防止写错
```

## MD045 - Images should have alternate text (alt text)

图片链接必须包含描述文本 all 文本

## MD046 - Code block style

整篇文档采用一致的代码格式

```latex
参数：
"style": 字符串，指定代码块定义格式，有（"consistent","fenced","indented"）三种，分别代表：文档上下文一致，使用三个反引号隔开，使用缩进，默认是上下文一致
```

## MD047 - Files should end with a single newline character

文档末尾需要一个空行结尾
