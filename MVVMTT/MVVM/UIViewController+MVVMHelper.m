//
//  UIViewController+MVVMHelper.m
//  MVVMTT
//
//  Created by Xin Peng on 17/1/2.
//  Copyright © 2017年 EB. All rights reserved.
//

#import "UIViewController+MVVMHelper.h"
#import <objc/runtime.h>

@interface UIViewController ()


@end

@implementation UIViewController (MVVMHelper)

- (void)bindParams:(NSDictionary<NSString *, NSString *> *)parameters{
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(self.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [self setValue:param forKey:key];
        }
    }
}

+ (UIViewController *)currentController {
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    UIWindow *keywindow = nil;
    for (UIWindow *window in frontToBackWindows){
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        
        if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
            keywindow = window;
            break;
        }
    }
    return [self currentViewControllerFrom:keywindow.rootViewController];
    
}

+ (UIViewController *)currentViewControllerFrom: (UIViewController *)controller {
    if ([controller isKindOfClass:[UINavigationController class]]) {
        return [self currentViewControllerFrom:((UINavigationController *)controller).viewControllers.lastObject];
    }else if ([controller isKindOfClass:[UITabBarController class]]){
        return [self currentViewControllerFrom:((UITabBarController *)controller).selectedViewController];
    }else{
        if (controller.presentedViewController) {
            return [self currentViewControllerFrom:controller.presentedViewController];
        }
        return controller;
    }
}
@end
