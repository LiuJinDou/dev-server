<!--
 * @Author: shadow 1975876584@qq.com
 * @Date: 2024-07-15 16:36:25
 * @LastEditors: shadow 1975876584@qq.com
 * @LastEditTime: 2024-07-15 16:39:39
 * @FilePath: /dev-server/notes/zookeeper.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->




###### 常用命令

###### 创建节点
```
#默认创建的就是持久节点
create /test
#创建序号节点
create -s /test
#返回创建的实际路径
Created /test0000000001
create -s /test
#返回创建的实际路径2
Created /test0000000002
#创建临时节点， 断开会话 在连接将会自动删除
create -e /temp
#创建EPHEMERAL_SEQUENTIAL（临时序号节点）
create -e -s /temp/seq

```

###### 
```
# 节点属性
stat /test
```

######  节点权限
```
#创建一个节点
create -e /testAcl
#查看节点权限
getAcl /testAcl
#返回的默认权限表示 ，所有人拥有所有权限。
'world,'anyone: cdrwa

#设置为rw权限 
setAcl /testAcl world:anyone:rw
# 可以正常读
get /testAcl
# 无法正常创建子节点
create -e /testAcl/t "hi"
# 返回没有权限的异常
Authentication is not valid : /testAcl/t

```