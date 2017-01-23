//
//  PXNavigationControllerStack.m
//  MVVMTT
//
//  Created by Xin Peng on 16/12/31.
//  Copyright © 2016年 EB. All rights reserved.
//

#import "PXNavigationControllerStack.h"
#import <UIKit/UIKit.h>
#import "PXRouter.h"
#import "AppDelegate.h"
#import "JLRoutes.h"
#import "UIViewController+MVVMHelper.h"

@interface PXNavigationControllerStack () <UINavigationControllerDelegate>

@end

#pragma mark --

@implementation PXNavigationControllerStack
singletonImplementation(Instance)

- (void)addRoute {
    
    [JLRoutes addRoute:@"/NaviPush/:controller" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
        UIViewController *currentVc = UIViewController.currentController;
        UIViewController *targetVc = [[NSClassFromString(parameters[@"controller"]) alloc] init];
        [targetVc bindParams:parameters];
        currentVc.navigationController.delegate = self;
        [currentVc.navigationController pushViewController:targetVc animated:YES];
        return YES;
    }];
    
    [JLRoutes addRoute:@"/Present/:controller" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
        UIViewController *currentVc = UIViewController.currentController;
        UIViewController *targetVc = [[NSClassFromString(parameters[@"controller"]) alloc] init];
        [targetVc bindParams:parameters];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:targetVc];
        nav.navigationController.delegate = self;
        [currentVc presentViewController:nav animated:YES completion:nil];
        return YES;
    }];
    
    [JLRoutes addRoute:@"/StoryBoardPush" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
       //...
        return YES;
    }];
    
    [JLRoutes addRoute:@"/Root/:controller" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
        
        //...
        return YES;
        
    }];
    
}

- (void)openPath:(NSString *)patternStr {
    if (![patternStr length]) {
        return;
    }
    NSString *rootPath = nil;
    NSString *queryStr = nil;
    if ([patternStr rangeOfString:@"?"].length != 0) {
        rootPath = [patternStr substringToIndex:[patternStr rangeOfString:@"?"].location];
        queryStr = [patternStr substringFromIndex:[patternStr rangeOfString:@"?"].location+1];
    }else{
        rootPath = patternStr;
    }
    NSString *routeStr = [PXRouter.sharedInstance rootUrlWithKey:rootPath];
    if ([routeStr hasPrefix:@"http"]) {//跳转web页 自行扩展
        UIViewController *currentVc = UIViewController.currentController;
        UIViewController *webViewController = [[NSClassFromString(@"WebViewController") alloc] init];
        [webViewController setValue:[NSURL URLWithString:routeStr] forKey:@"url"];
        if (currentVc.navigationController) {
            [currentVc.navigationController pushViewController:webViewController animated:YES];
        }else{
            [currentVc presentViewController:webViewController animated:YES completion:nil];
        }
    }else{
        if ([queryStr length]) {
            routeStr = [routeStr stringByAppendingString:[NSString stringWithFormat:@"?%@",queryStr]];
        }
        [self encodeStr:&routeStr];
        NSURL *routeUrl = [NSURL URLWithString:routeStr];
        [[UIApplication sharedApplication] openURL:routeUrl options:@{} completionHandler:nil];
    }
    
}

- (BOOL)routeURL:(NSURL *)patternUrl {
    return [JLRoutes routeURL:patternUrl];
}
#pragma mark --

- (void)encodeStr:(NSString **)originalStr {
    *originalStr = [*originalStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

#pragma mark - UINavigationControllerDelegate 可以转场做动画

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    return nil;
}

@end
