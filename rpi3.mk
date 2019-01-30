## Download files
- repo init -u https://github.com/OP-TEE/manifest.git -m rpi3.xml -b 3.4.0
- Use MiniTCU rootfs

## Compiler (OPTEE)
### Kernel 配置修改
- make ARCH=ARM64 defconfig menuconfig
```
  geneal setup->audit supporting
  security->enable different security model
                ->socket and networking security Hooks
                ->NSA selinux
                

enable CONFIG_EXT4_FS_SECURITY

enable Android_Driver (binder)
```

### u-boot 配置修改
- enable ramdisk
```
build/rpi3/firmware/config.txt
  initramfs ramdisk.img 0x03300000 (To Do)
build/rpi3/firmware/uboot.env.txt
  load_ramdisk ?
  booti kernel_addr ramdisk_addr dt_addr
```

### ramdisk
- mkimage  -A arm -O linux -C gzip  -T ramdisk -d ramdisk.img u_ramdisk.img

### system
- dd if=system.img of=/dev/sdx2 seek=0 count=32415 bs=4096

## 启动
- tee-supplicant &
- xtest
