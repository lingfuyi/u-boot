u-boot-2016.05
修改功能：

    在uboot-2016.05文件夹下vim脚本build.sh,用于编译uboot和分析

      make distclean
      make mini2440_defconfig
      make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
      echo "是否生成dis反汇编文件"
      read input
      if [$input == "yes"]
      then
      arm-none-linux-gnueabi-objdump -D -m arm u-boot > u-boot.dis
      fi
      ```
    - 复制和生成必要文件
    
    以为我们是基于smdk2410移植而来，所以第一步先查找当前目录下所有与2410相关文件
    
    `find ./ -name "*2410*"` 
![QQ图片20170727195702]
      
      `cp board/samsung/smdk2410 board/samsung/mini2440`
      
      `cp configs/smdk2410.h configs/mini2440.h`
      
      `cp configs/smdk2410_defconfig configs/mini2440_defconfig`
      
      修改mini2440文件夹底下Kconfig makefile等为mini2440关键词
- 第二部分

[QQ图片20170727195702]: images/QQ-20170727195702.png "QQ图片20170727195702" { width:auto; max-width:90% }



