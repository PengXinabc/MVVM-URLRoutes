//
//  PXSingleton.h
//  MVVMTT
//
//  Created by Xin Peng on 17/1/10.
//  Copyright © 2017年 EB. All rights reserved.
//

#ifndef PXSingleton_h
#define PXSingleton_h


#define singletonInterface(className)          + (instancetype)shared##className;

#define singletonImplementation(className) \
static id instance; \
\
+ (instancetype)shared##className { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [[self alloc] init]; \
}); \
return instance; \
} \
\

#endif /* PXSingleton_h */
