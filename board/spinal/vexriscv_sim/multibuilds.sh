#!/bin/sh


cd ../../..
rm -rf build
mkdir build

sed -i '/CONFIG_RISCV_ISA_M=/c\CONFIG_RISCV_ISA_M=y' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_A=/c\CONFIG_RISCV_ISA_A=y' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_C=/c\CONFIG_RISCV_ISA_C=y' board/spinal/vexriscv_sim/linux.config

sed -i '/BR2_RISCV_ISA_CUSTOM_RVM=/c\BR2_RISCV_ISA_CUSTOM_RVM=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVA=/c\BR2_RISCV_ISA_CUSTOM_RVA=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVC=/c\BR2_RISCV_ISA_CUSTOM_RVC=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_CCACHE_DIR=/c\BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache-rv32imac"' configs/spinal_vexriscv_sim_defconfig

make clean
make spinal_vexriscv_sim_defconfig
make -j$(nproc) O=build/rv32imac
output/host/bin/riscv32-linux-objcopy  -O binary build/rv32imac/images/vmlinux build/rv32imac/images/Image


sed -i '/CONFIG_RISCV_ISA_M=/c\CONFIG_RISCV_ISA_M=n' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_A=/c\CONFIG_RISCV_ISA_A=y' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_C=/c\CONFIG_RISCV_ISA_C=y' board/spinal/vexriscv_sim/linux.config

sed -i '/BR2_RISCV_ISA_CUSTOM_RVM=/c\BR2_RISCV_ISA_CUSTOM_RVM=n' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVA=/c\BR2_RISCV_ISA_CUSTOM_RVA=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVC=/c\BR2_RISCV_ISA_CUSTOM_RVC=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_CCACHE_DIR=/c\BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache-rv32iac"' configs/spinal_vexriscv_sim_defconfig

make clean
make spinal_vexriscv_sim_defconfig
make -j$(nproc) O=build/rv32iac
output/host/bin/riscv32-linux-objcopy  -O binary build/rv32iac/images/vmlinux build/rv32iac/images/Image

sed -i '/CONFIG_RISCV_ISA_M=/c\CONFIG_RISCV_ISA_M=n' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_A=/c\CONFIG_RISCV_ISA_A=y' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_C=/c\CONFIG_RISCV_ISA_C=n' board/spinal/vexriscv_sim/linux.config

sed -i '/BR2_RISCV_ISA_CUSTOM_RVM=/c\BR2_RISCV_ISA_CUSTOM_RVM=n' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVA=/c\BR2_RISCV_ISA_CUSTOM_RVA=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVC=/c\BR2_RISCV_ISA_CUSTOM_RVC=n' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_CCACHE_DIR=/c\BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache-rv32ia"' configs/spinal_vexriscv_sim_defconfig

make clean
make spinal_vexriscv_sim_defconfig
make -j$(nproc) O=build/rv32ia
output/host/bin/riscv32-linux-objcopy  -O binary build/rv32ia/images/vmlinux build/rv32ia/images/Image


sed -i '/CONFIG_RISCV_ISA_M=/c\CONFIG_RISCV_ISA_M=y' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_A=/c\CONFIG_RISCV_ISA_A=y' board/spinal/vexriscv_sim/linux.config
sed -i '/CONFIG_RISCV_ISA_C=/c\CONFIG_RISCV_ISA_C=n' board/spinal/vexriscv_sim/linux.config

sed -i '/BR2_RISCV_ISA_CUSTOM_RVM=/c\BR2_RISCV_ISA_CUSTOM_RVM=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVA=/c\BR2_RISCV_ISA_CUSTOM_RVA=y' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_RISCV_ISA_CUSTOM_RVC=/c\BR2_RISCV_ISA_CUSTOM_RVC=n' configs/spinal_vexriscv_sim_defconfig
sed -i '/BR2_CCACHE_DIR=/c\BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache-rv32ima"' configs/spinal_vexriscv_sim_defconfig

make clean
make spinal_vexriscv_sim_defconfig
make -j$(nproc) O=build/rv32ima
output/host/bin/riscv32-linux-objcopy  -O binary build/rv32ima/images/vmlinux build/rv32ima/images/Image


