#!/usr/bin/env bash
DISTRO=`lsb_release -si`

if [ $DISTRO == "Kali" ]||[ $DISTRO == "Debian" ]||[ $DISTRO == "Ubuntu" ]; then
  echo "Find "$DISTRO". Add Android SDK Bin to Path"
  export PATH=$PATH:/usr/share/android-sdk/platform-tools/
  export PATH=$PATH:/usr/share/android-sdk/tools/
  if [ $(file /usr/share/android-sdk/platform-tools/adb | grep "x86-64"| wc -l) -eq 1 ]; then
	echo "AMD64 detected."
	(emulator64-arm -avd $1 -system images/system.img -ramdisk images/ramdisk.img -prop dalvik.vm.execution-mode=int:portable &)
  else
	echo "Ix86 detected."
	(emulator -avd $1 -system images/system.img -ramdisk images/ramdisk.img -prop dalvik.vm.execution-mode=int:portable &)
  fi
else
  echo "Please add Android SDK Bin to Path manually."
  emulator -avd $1 -system images/system.img -ramdisk images/ramdisk.img -kernel images/zImage -prop dalvik.vm.execution-mode=int:portable &
fi
