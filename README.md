# WebSocketTest
 WebSocketTest is iOS  simple web socket test ,use PocketSocket 


# server: 
OS X 应用，在delegate里面可以修改websocket端口，也可以输入ip，如果输入nil的话默认本机，也就是127.0.0.1

# client：
ios应用，在contoller里面可以输入server的ip以及端口，格式 :ws://server地址:端口 , eg:127.0.0.1:9001.


#测试步骤
第一步：配置websocket server的ip以及端口，运行OSX应用
第二部：修改websocket client的配置，运行iOS应用。
当然server和client的传递规则你可以在server和client的delegate里面自定义
