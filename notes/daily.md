<!--
 * @Author: shadow 1975876584@qq.com
 * @Date: 2024-06-26 18:02:20
 * @LastEditors: shadow 1975876584@qq.com
 * @LastEditTime: 2024-06-28 17:35:14
 * @FilePath: /dev-server/notes/daily.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
<!--
 * @Author: shadow 1975876584@qq.com
 * @Date: 2024-06-26 18:02:20
 * @LastEditors: shadow 1975876584@qq.com
 * @LastEditTime: 2024-06-26 18:02:53
 * @FilePath: /dev-server/notes/daily.md
 * @Description: mysql
-->
###### wsl -Ubuntu

```
https://developer.aliyun.com/mirror/docker-ce/?spm=a2c6h.25603864.0.0.50a0745dndNSwH
# step 1: 安装必要的一些系统工具
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
# step 2: 安装GPG证书
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
# Step 3: 写入软件源信息
sudo add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
# Step 4: 更新并安装Docker-CE
sudo apt-get -y update
sudo apt-get -y install docker-ce

# 安装指定版本的Docker-CE:
# Step 1: 查找Docker-CE的版本:
# apt-cache madison docker-ce
#   docker-ce | 17.03.1~ce-0~ubuntu-xenial | https://mirrors.aliyun.com/docker-ce/linux/ubuntu xenial/stable amd64 Packages
#   docker-ce | 17.03.0~ce-0~ubuntu-xenial | https://mirrors.aliyun.com/docker-ce/linux/ubuntu xenial/stable amd64 Packages
# Step 2: 安装指定版本的Docker-CE: (VERSION例如上面的17.03.1~ce-0~ubuntu-xenial)
# sudo apt-get -y install docker-ce=[VERSION]

```

###### mysql
```
CREATE USER 'canal'@'localhost' IDENTIFIED BY 'canal';

GRANT ALL PRIVILEGES ON *.* TO 'canal'@'localhost';

FLUSH PRIVILEGES;
```

######  zookeeper

```
docker run -d --name=grafana -p 3000:3000 grafana/grafana
```

######  prometheus

```

docker run --name prometheus bitnami/prometheus:latest

```



######  grafana

```
docker run -d --name=grafana -p 3000:3000 grafana/grafana
```