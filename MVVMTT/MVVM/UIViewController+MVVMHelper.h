//
//  UIViewController+MVVMHelper.h
//  MVVMTT
//
//  Created by Xin Peng on 17/1/2.
//  Copyright © 2017年 EB. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (MVVMHelper)


- (void)bindParams:(NSDictionary<NSString *, NSString *> *)parameters;

+ (UIViewController *)currentController;

@end
