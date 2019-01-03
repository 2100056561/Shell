#更新系统
yum update -y && yum install wget -y
#安装常用基础软件
yum install -y epel-release vim lrzsz screen git ntp crontabs net-tools telnet
#设置时区为东八区
echo yes | cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#同步时间
ntpdate cn.pool.ntp.org
#添加系统定时任务自动同步时间并重启定时任务服务
sed -i '/^.*ntpdate*/d' /etc/crontab
sed -i '$a\* * * * 1 ntpdate cn.pool.ntp.org >> /dev/null 2>&1' /etc/crontab
service crond restart
#/etc/init.d/crond restart
#把时间写入到BIOS
hwclock -w
