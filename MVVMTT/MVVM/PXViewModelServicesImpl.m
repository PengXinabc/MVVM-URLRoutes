//
//  PXViewModelServicesImpl.m
//  MVVMTT
//
//  Created by Xin Peng on 16/12/31.
//  Copyright © 2016年 EB. All rights reserved.
//

#import "PXViewModelServicesImpl.h"
#import "PXNavigationControllerStack.h"

@implementation PXViewModelServicesImpl
singletonImplementation(Instance)

#pragma mark - PXViewModelServices

/// PXViewModelServices method forwardInvocation
- (id)forwardingTargetForSelector:(SEL)aSelector {
    PXNavigationControllerStack *navStack = PXNavigationControllerStack.sharedInstance;
    if ([PXNavigationControllerStack instancesRespondToSelector:aSelector]) {
        return navStack;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
