//
//  WSocketManager.h
//  websocketTest
//
//  Created by YU on 16/9/20.
//  Copyright © 2016年 luode. All rights reserved.
//

#import <Foundation/Foundation.h>

//开发参数
NSString * const wsTestServerRealm = @"Message.Server";
NSString * const wsTestServerURLString = @"ws://192.168.16.217:8000/ws";


NSString * const wsSHYServerRealmMessageCenter = @"shy.messasge.center";//消息服务器
NSString * const wsTopicSHYGlobalMessage = @"com.shy.global.message";//全局Topic，针对所有app
//实时通信协议
//消息服务器
//Realm: shy.messasge.center
//
//Topic: com.shy.global.message
//类型：全局
//范围：所有App
//
//Topic: com.{merchant_id}.order
//类型：区域
//适用范围：指定商家App
//命令：
//创建订单:{“event”:” create”, “data”:{}}
//
//Topic:  com.{merchant_id}.order.{order_id}
//类型: 局部
//命令：
//加菜: {“event”:”add_goods”, “order_id”:100, “data”:{}}
//退菜:{“event”:”remove_goods”, “order_id”:100, “goods_id”:1001 }
//上菜:{“event”:”served _goods”, “order_id”:100, “goods_id”:1001 }
//取消订单:{“event”:”remove_order”, “order_id”:100}
//状态更新：{“event”:”update”, “status”:”new”}  //状态：新建、已取消、已支付[外卖订单：已接收、配送中、已完成]
@interface WSocketManager : NSObject
@property (copy, nonatomic) NSString *wsTopicMerchant;//自定商家的app通信,帐户唯一



+ (instancetype)shareWSocketManager;


@end
