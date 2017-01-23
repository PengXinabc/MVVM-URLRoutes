//
//  PXViewModelServices.h
//  MVVMTT
//
//  Created by Xin Peng on 16/12/31.
//  Copyright © 2016年 EB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PXViewModelServices <NSObject>

@optional

/// 发送统跳协议
/// patternStr - route规则下的path
- (void)openPath:(NSString *)patternStr;

/// 解析统跳url
/// patternUrl - route规则下的url
- (BOOL)routeURL:(NSURL *)patternUrl;

/// 注册patternUrl
- (void)addRoute;
@end
