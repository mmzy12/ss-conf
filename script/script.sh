#!/bin/bash

# 下载文件
wget https://johnshall.github.io/Shadowrocket-ADBlock-Rules-Forever/lazy_group.conf -O lazy_group.conf

# 提取信息
rule_file="rule.list"
proxy_group_file="proxy_group.list"
host_file="host.list"

# 检查文件是否存在
for file in "$rule_file" "$proxy_group_file" "$host_file"; do
    if [ ! -f "$file" ]; then
        echo "文件 $file 不存在"
        exit 1
    fi
done

# 修改配置文件

# 删除skip-proxy中的192.168.0.0/16
sed -i 's/skip-proxy = 192.168.0.0\/16,//' lazy_group.conf

# 在 [Rule] 下插入内容
sed -i "/\[Rule\]/r $rule_file" lazy_group.conf

# 在 [Proxy Group] 下插入内容
sed -i "/\[Proxy Group\]/r $proxy_group_file" lazy_group.conf

# 在 [Host] 下插入内容
sed -i "/\[Host\]/r $host_file" lazy_group.conf

