# 概述
这是南京信息工程大学校园网的自动认证脚本. 目前仅支持MacOS, 计划支持Linux. 实现连接校园网即自动登录自己的帐号.
如果需要Windows上的自动认证脚本, 参见[Alrash/WebAuthenticate](https://github.com/Alrash/WebAuthenticate)

# 安装与卸载
使用以下命令安装:
```bash
git clone git@github.com:RRRRRm/nuistconnect.git ~/nuistconnect
sudo ~/nuistconnect/install.sh -i
```

卸载:
```bash
sudo ~/nuistconnect/install.sh -u
rm -r ~/nuistconnect/
```

# TODO
- [ ] Linux 支持
- [ ] 将配置文件独立出来
- [ ] 使用交互式命令行程序生成配置文件
- [ ] 使用C重写
