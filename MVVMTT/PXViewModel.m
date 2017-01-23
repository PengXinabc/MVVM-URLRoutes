//
//  PXViewModel.m
//  MVVMTT
//
//  Created by Xin Peng on 17/1/23.
//  Copyright © 2017年 EB. All rights reserved.
//

#import "PXViewModel.h"
#import "PXViewModelServicesImpl.h"
#import <objc/runtime.h>

struct objc_method_description MethodDescriptionForSELInProtocol(Protocol *protocol, SEL sel) {
    struct objc_method_description description = protocol_getMethodDescription(protocol, sel, YES, YES);
    if (description.types) {
        return description;
    }
    description = protocol_getMethodDescription(protocol, sel, NO, YES);
    if (description.types) {
        return description;
    }
    return (struct objc_method_description){NULL, NULL};
}

BOOL ProtocolContainSel(Protocol *protocol, SEL sel) {
    return MethodDescriptionForSELInProtocol(protocol, sel).types ? YES : NO;
}

@interface PXViewModel ()

@property (nonatomic, strong) PXViewModelServicesImpl *services;
@end

@implementation PXViewModel

- (instancetype)init {
    if (self = [super init]) {
        _services = [[PXViewModelServicesImpl alloc] init];
    }
    return self;
}

/// PXViewModelServices method forwardInvocation
- (id)forwardingTargetForSelector:(SEL)aSelector {
    Protocol *protocol = objc_getProtocol("PXViewModelServices");
    if ([PXViewModelServicesImpl instancesRespondToSelector:aSelector] || ProtocolContainSel(protocol, aSelector)) {
        return _services;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
