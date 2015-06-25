git clone git://git.yoctoproject.org/meta-xilinx
git://git.openembedded.org/openembedded-core
git clone git://git.yoctoproject.org/poky.git
cd meta-xilinx
git checkout 2af8d2a0e63aa371045895da03ba2bf98b51adb4
patch < ../meta-xilinx-2af8d2a0e63aa371045895da03ba2bf98b51adb4/meta-xilinx.patch
cd ../poky

