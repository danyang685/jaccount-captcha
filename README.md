## Jaccount-Captcha

[![Chrome Web Store](https://img.shields.io/badge/Download-424K-green.svg)](https://chrome.google.com/webstore/detail/jacap/dgnigmgogebihejgojnklnhcfjcehldl)

SJTU Jaccount Captcha auto recognize extension.
上海交通大学Jaccount登陆验证码自动识别插件。

### 安装

#### Chrome Webstore安装（墙）

通过下面链接，使用chrome webstore安装。推荐使用如下方式安装，因为一旦我们的项目有更新，chrome会为您自动更新。

https://chrome.google.com/webstore/detail/jacap/dgnigmgogebihejgojnklnhcfjcehldl

#### 通过Crx文件安装

1. 在 [Release](https://github.com/fztfztfztfzt/jaccount-captcha/releases/) 页面下载最新的 crx 文件
2. 点击右上角 __菜单->更多工具->扩展程序__
3. 将 crx 文件从资源管理器中 __拖入“扩展程序”窗口__ 即可
4. 如安装失败，请确认 (1) 操作是否正确 (2) crx 文件是否来自 [Release](https://github.com/fztfztfztfzt/jaccount-captcha/releases/) 页面或网上应用店

***

### 项目结构介绍

#### browser_extension Chrome浏览器插件

利用JavaScript编写。

#### captcha_collector 验证码数据收集脚本

利用Python编写。

#### model_training 神经网络训练脚本

利用MATLAB编写。

#### data 数据集

收集的数据集存放于此，以图像文件形式存储。