#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# add argon theme
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
rm -rf package/lean/luci-theme-argon && mv luci-theme-argon package/lean/

# add vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git
mv lua-maxminddb package/lean/
git clone https://github.com/jerrykuku/luci-app-vssr.git
mv luci-app-vssr package/lean/

# add JD
git clone https://github.com/jerrykuku/node-request.git
mv node-request package/lean/
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git
mv luci-app-jd-dailybonus package/lean/

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Add openclash
# echo "src-git openclash https://github.com/vernesong/OpenClash;master" >> feeds.conf.default

# Add clash
# git clone -b master https://github.com/frainzy1477/luci-app-clash.git package/lean/luci-app-clash
