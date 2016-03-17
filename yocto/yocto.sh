git clone -b jethro git://git.yoctoproject.org/meta-xilinx
#git://git.openembedded.org/openembedded-core
git clone -b jethro  git://git.yoctoproject.org/poky.git
cd meta-xilinx
patch < ../meta-xilinx-commit-id-*/meta-xilinx.patch
cd ../poky

