//
//  WSocketManager.m
//  websocketTest
//
//  Created by YU on 16/9/20.
//  Copyright © 2016年 luode. All rights reserved.
//

#import "WSocketManager.h"
#import <MDWamp.h>

NSString * const wsServerURLString = @"ws://192.168.16.217:8000/ws";

static WSocketManager *_instance;

@interface WSocketManager ()<MDWampClientDelegate>

@property (assign, nonatomic, setter=isConnected:) BOOL connected;
@property (strong, nonatomic) MDWamp *mdwamp;

@end

@implementation WSocketManager

#pragma mark -- instance method

//- (void)wsConnect{
//    [self.mdwamp connect];
//}


#pragma mark -- class method


#pragma mark -- 单例
/*
 *  构造单例
 */
+ (instancetype)shareWSocketManager
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL]init];
        [_instance creatMdwamp];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [WSocketManager shareWSocketManager];
}

#pragma mark -- private method
- (void)creatMdwamp
{
    self.connected = NO;
    MDWampTransportWebSocket *trans = [[MDWampTransportWebSocket alloc] initWithServer:[NSURL URLWithString:wsTestServerURLString] protocolVersions:@[kMDWampProtocolWamp2json,kMDWampProtocolWamp2msgpack]];
    self.mdwamp = [[MDWamp alloc] initWithTransport:trans realm:wsTestServerRealm delegate:_instance];
    [self.mdwamp connect];
}

#pragma -- mark MDWampDelegate
/*
 *  成功链接服务器
 */
- (void)mdwamp:(MDWamp *)wamp sessionEstablished:(NSDictionary *)info
{
    MyNSLog(@"链接服务器成功！");
}

/*
 *  断开链接
 */
- (void)mdwamp:(MDWamp *)wamp closedSession:(NSInteger)code reason:(NSString *)reason details:(NSDictionary *)details
{
    MyNSLog(@"断开连接：reason:%@",reason);
}















@end
