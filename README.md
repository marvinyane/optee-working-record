### imx6ul移植记录
#### 下载代码
- imx-optee-client
- imx-optee-os
- imx-optee-test
- linux-imx
- uboot-imx
- 切换所有仓库到 

### 编译 u-boot
- make ARCH=arm  CROSS_COMPILE=arm-poky-linux-gnueabi- mx6ul_14x14_evk_optee_defconfig
- make ARCH=arm CROSS_COMPILE=arm-poky-linux-gnueabi-
- Fixed ： 注释掉编译器6.0的监测

### 编译kernel
- make  ARCH=arm  CROSS_COMPILE=arm-poky-linux-gnueabi-  imx_v7_defconfig
- make  ARCH=arm  CROSS_COMPILE=arm-poky-linux-gnueabi-    zImage  LOADADDR=0x10008000 -j8
- make  imx6ul-14x14-evk.dtb

### 编译 OPTEE-OS
- make PLATFORM=imx-mx6ulevk ARCH=arm  CROSS_COMPILE=arm-poky-linux-gnueabi-  DEBUG=y CFG_TEE_CORE_LOG_LEVEL=4

- mkimage -A arm -O linux -C none -a 0x84000000 -e 0x84000000 -d ./out/arm-plat-imx/core/tee.bin uTee

### 引导
- 烧写 uTee到fat去？
- u-boot会自动引导

### TO-DO Issues
1. GP的规范
2. libtee是否允许重入访问， 是否会失败？
3. 

## 从YOCTO开始构建
### 下载代码

### 编译
