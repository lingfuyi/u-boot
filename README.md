# u-boot-2016.05在mini2440上的移植(spl启动)
---
基于对uboot的基本了解，完成下面基本功能

参考：
[uboot2015在2440移植](http://blog.csdn.net/doccode/article/details/47211515)
> * *spl启动，即uboot分成两部分分开启动*
> * *nandflash启动*
> * *uboot logo制作*
---
## *spl*基本知识
*什么是SPL:*
>* 参考/doc/README.spl，为了统一所有现有实现第二段的程序加载程序(SPL)

*为什么用SPL*
>* 并允许简单地添加新的实现这个，一个*通用SPL框架*已创建。用这个框架板的几乎所有的源文件可以重用。没有代码重复或符号链接是必要的了,方便以后学习
>* [u-boot SPL框架](http://izobs.github.io/%E5%AD%A6%E4%B9%A0/uboot-spl-framework
k)


## 基本启动流程
 如果选择从NandFlash启动，s3c2440芯片上电后其内部的nandflash控制器会自动把nandflash中前4k的内容拷贝到垫脚石中，然后从垫脚石中运行第一条指令。但是s3c2440的垫脚石只有4k大，所以在这4k中需要对芯片做初始化，对外部器件nandflash和SDRAM初始化，然后把nandflash中全部的uboot代码拷贝到SDRAM中，接着跳转到SDRAM中运行。

如果选择从NorFlash启动，s3c2440会直接在NorFlash上运行指令，在NorFlash中的代码需要初始化芯片、初始化SDRAM，然后把全部uboot代码拷贝到SDRAM中并跳转到SDRAM中运行

### *基本流程 u-boot-spl.bin ----> u-boot.bin*

*整个uboot启动流程*
![](uboot启动流程.png)
> * u-boot-spl.bin启动

u-boot-spl.bin文件需要完成初始化cpu、初始化NandFlash、SDRAM并把NandFlash中的uboot代码拷贝到内存中去。

> * u-boot.bin启动

u-boot.bin主要实现board_f board_r 和relecolate代码





