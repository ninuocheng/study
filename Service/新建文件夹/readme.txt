
曾 晔

考试介绍、考场介绍
考点串讲（RHCSA、RHCE）
        陌生知识点 讲+练
        熟悉知识点 解题示范

时间安排：
        09:30~12:00 
        13:30~16:30
        16:30~18:00  自由练习

资料获取（内部资料，请勿外传!!!）：
        RHCE-REVIEW.txt			【串讲笔记】
        RHCE-EXAM-TIPS.txt			【考前提示/防坑宝典】
        rhcsa.pdf、rhce.pdf			【样题+解题参考】
        RHCSA7-NOTE.txt、RHCE7-NOTE.txt	【社招班RHCE随堂资料】

        http://localhost/exam/ （模拟测试题，答案参见PDF样题文件）
        QQ群（RHCE考前辅导）：303486093 【群文件 RHCE-7-ANSWER.zip，已包含上述资料】

模拟考试要求：
        上午 90分钟内完成，正确率 >= 90%
        下午 150分钟内完成，正确率 >= 90%

讲师机桌面（北京）：
	vncviewer  172.40.50.113:7000

#################################################################
考场需要提供你的英文姓名、电子邮箱、已有的证书编号（如果有的话），上下午填写的信息要保持一致
关于证书查询：
        默认不对外提供，
        如果希望查询到，需要到红帽官网注册一个账号，关联你的证书并设置允许被查询
﻿严格禁止作弊！！！
具体考试题目以实际为准！！！

一、红帽考试及环境介绍
1. RHCSA（红帽认证系统管理员）
    全机试，时长150分钟
    约16道题，满分300分（210分合格）

2. RHCE（红帽认证工程师）
    全机试，时长210分钟
    约22道题，满分300分（210分合格）

3. 考试环境说明（X为考生编号）
    !!每名考生一台真实机，这台真机上提供虚拟机，答题全部在虚拟机中完成
    !!桌面上会提供访问考试平台及虚拟机的快捷方式
    !!由考官服务器提供所需软件、DNS/DHCP/集中认证等必要的资源
    !!真实机： foundation.domainX.example.com
    !!虚拟机-RHCSA部分：station.domainX.example.com
    !!虚拟机-RHCE部分：system1.domainX.example.com、system2.domainX.example.com


二、练习环境说明
1. 每人可使用3台虚拟机
    !!虚拟机 classroom，相当于考官服务器：classroom.example.com
    !!虚拟机 server，相当于答题机1：server0.example.com 
    !!虚拟机 desktop，相当于答题机2：desktop0.example.com

2. 快速重置练习环境
    !! 按顺序执行，根据提示输入 y 确认
    [root@room9pc13 ~]# rht-vmctl  reset  classroom
    [root@room9pc13 ~]# rht-vmctl  reset  server
    [root@room9pc13 ~]# rht-vmctl  reset  desktop

    rht-vmctl 脚本控制参数说明：
    rht-vmctl  reset  虚拟机名 		【断电-还原-开启虚拟机】
    rht-vmctl  poweroff  虚拟机名 	【强制关闭虚拟机】
    rht-vmctl  start  虚拟机名		【开启虚拟机】

#################################################################