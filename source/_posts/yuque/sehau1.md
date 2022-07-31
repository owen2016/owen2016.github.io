---
title: '“if __name__==''__main__'':”'
urlname: sehau1
date: '2021-03-19 22:34:38 +0800'
tags: []
categories: []
---

已剪辑自:[https://www.cnblogs.com/chenhuabin/p/10118199.html](https://www.cnblogs.com/chenhuabin/p/10118199.html)

# 1 引言

在 Python 当中，如果代码写得规范一些，通常会写上一句“if **name**==’**main**:”作为程序的入口，但似乎没有这么一句代码，程序也能正常运行。这句代码多余吗？原理又在哪里？本篇博文对此进行总结说明。

# 2 程序入口

学过 Java、C、C++的程序员应该都知道，每次开启一个程序，都必须写一个主函数作为程序的入口，也就是我们常说的 main 函数。如下所示， main()就是 Java 中的一个 main 函数。
`public class HelloWorld { public static void main(String[] args) { System.out.println("HelloWorld"); } }`

与 Java、C、C++等几种语言不同的是，Python 是一种解释型脚本语言，在执行之前不同要将所有代码先编译成中间代码，Python 程序运行时是从模块顶行开始，逐行进行翻译执行，所以，最顶层（没有被缩进）的代码都会被执行，所以 Python 中并不需要一个统一的 main()作为程序的入口。

在某种意义上讲，“if **name**==’**main**:”也像是一个标志，象征着 Java 等语言中的程序主入口，告诉其他程序员，代码入口在此——这是“if **name**==’**main**:”这条代码的意义之一。

# 3 模块导入

我们知道，当我们把模块 A 中的代码在模块 B 中进行 import A 时，只要 B 模块代码运行到该 import 语句，模块 A 的代码会被执行。
` # ``模块``B ``from package01 import A b = 200 print('``你好，我是模块``B……') print(b)  `
` 运行模块B时，输出结果如下：`
` 你好，我是模块A……`
` 100`
` 你好，我是模块B……`
` 200`

如果在模块 A 中，我们有部分的代码不想在被导入到 B 时直接被运行，但在直接运行 A 时可直接运行，那该怎么做呢？那就可以用到“if **name**==’**main**:”这行代码了，我们队上面用到的 A 模块代码进行修改：

A 模块代码修改为：
` # ``模块``A a = 100 print('``你好，我是模块``A……') if __name__=='__main__': `
` print(a) `

` B模块不做修改，直接执行B模块，输出结果如下：`
` 你好，我是模块A……`
` 你好，我是模块B……`
` 200`
看到了吗，A 模块中的 a 的值就没有再被输出了。所以，当你要导入某个模块，但又不想改模块的部分代码被直接执行，那就可以这一部分代码放在“if **name**=='**main**':”内部。

#

# 4 “**name**”与“**main**”

看到现在也许心中还是疑惑，为什么会这样，那么现在我们来说一说“if **name**=='**main**':”的原理。
** \*\***“\***\***name**\*\***”\***\*是\*\***Python\***\*的内置变量，用于指代当前模块**。我们修改上面用到的 A 模块和 B 模块，在模块中分别输出模块的名称：

` # ``模块``A print('``你好，我是模块``A……') print('``模块``A``中``__name__``的值：``{}'.format(__name__)) print('-------------------------')  `

` # ``模块``B from package01 import A print('``你好，我是模块``B……') print('``模块``B``中``__name__``的值：``{}'.format(__name__))  `

` 执行``A``模块时，输出结果： `
` 你好，我是模块``A……`
` 模块``A``中``__name__``的值：``__main__`
` ``-------------------------`
` 执行``B``模块时，输出结果：`
` 你好，我是模块``A……`
` 模块``A``中``__name__``的值：``package01.A`
` ``-------------------------`
` 你好，我是模块``B……`
` 模块``B``中``__name__``的值：``__main__`

发现神奇之处了吗？当哪个模块被直接执行时，该模块“**name**”的值就是“**main**”，当被导入另一模块时，“**name**”的值就是模块的真实名称。

用一个类比来解释一下：记得小时候要轮流打算教室，轮到自己的时候（模块被直接执行的时候），我们会说今天是“我”（**main**）值日，称呼其他人时，我们就会直接喊他们的名字。所以，“**main**”就相当于当事人，或者说第一人称的“我”。

所以，当运行“if **name**=='**main**':”语句时，如果当前模块时被直接执行，**name**的值就是**main**，条件判断的结果为 True，“if **name**=='**main**':”下面的代码块就会被执行。

#

# 5 总结

“if **name**=='**main**':”语句的用处与原理大概也讲清楚了，如果没说明白，或者是我没理解到位，请给我留言。另外多说一句，“if **name**=='**main**':”很多时候看似无用，但是，出于代码的规范性，还是有必要的。

‘**main**’ is the name of the scope in which top-level code executes. A module’s **name** is set equal to ‘**main**’ when read from standard input, a script, or from an interactive prompt.
A module can discover whether or not it is running in the main scope by checking its own **name**, which allows a common idiom for conditionally executing code in a module when it is run as a script or with python -m but not when it is imported:

**main**就是最顶级代码的名字，而**name**是代码本身的名字。
**通过判断二者是否相等，可以判断该代码是被 imported 还是直接执行的。**


