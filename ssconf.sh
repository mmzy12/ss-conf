#!/bin/bash

# 下载文件
wget https://johnshall.github.io/Shadowrocket-ADBlock-Rules-Forever/lazy_group.conf -O lazy_group.conf

# 在 [Rule] 下插入内容
sed -i '/\[Rule\]/a DOMAIN-KEYWORD,liviter.top,BACKHOME' lazy_group.conf

# 在 [Rule] 下插入内容
sed -i '/\[Rule\]/a DOMAIN-KEYWORD,wxchatproxy.top,DIRECT' lazy_group.conf

# 在 [Proxy Group] 下插入内容
sed -i '/\[Proxy Group\]/a BACKHOME = select,interval=86400,timeout=5,url=http://www.gstatic.com/generate_204,policy-regex-filter=内网|wire' lazy_group.conf

# 在 [Host] 下插入内容
sed -i '/\[Host\]/a *.liviter.top=223.5.5.5' lazy_group.conf
