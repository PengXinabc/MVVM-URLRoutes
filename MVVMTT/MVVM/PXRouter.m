//
//  PXRouter.m
//  MVVMTT
//
//  Created by Xin Peng on 17/1/2.
//  Copyright © 2017年 EB. All rights reserved.
//

#import "PXRouter.h"
#import "UIViewController+MVVMHelper.h"

@interface PXRouter ()


///viewModel <-> vc
@property (nonatomic, copy) NSDictionary *viewModelViewMappings;
@end

@implementation PXRouter

+ (instancetype)sharedInstance {
    static PXRouter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSString *)rootUrlWithKey:(NSString *)urlKey {
    return self.viewModelViewMappings[urlKey];
}

//可以由服务器配置下发
- (NSDictionary *)viewModelViewMappings {
    return @{
             @"MVVMTT://NaviPush/SecondController": @"MVVMTT://NaviPush/SecondController",
             @"MVVMTT://Present/SecondController": @"https://www.baidu.com",
             @"httpPage": @"https://www.baidu.com"
             };
}
@end
