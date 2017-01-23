//
//  PXRouter.h
//  MVVMTT
//
//  Created by Xin Peng on 17/1/2.
//  Copyright © 2017年 EB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PXViewModel;

@interface PXRouter : NSObject

+ (instancetype)sharedInstance;

/// 统跳协议转换（可以由服务器下发匹配，跳转原生或web页）
///
/// urlKey - 和返回的url可以一致，可以区分动态配置
- (NSString *)rootUrlWithKey:(NSString *)urlKey;

@end
