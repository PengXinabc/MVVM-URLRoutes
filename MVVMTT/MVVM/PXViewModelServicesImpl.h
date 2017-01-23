//
//  PXViewModelServicesImpl.h
//  MVVMTT
//
//  Created by Xin Peng on 16/12/31.
//  Copyright © 2016年 EB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PXViewModelServices.h"
#import "PXSingleton.h"

@interface PXViewModelServicesImpl : NSObject <PXViewModelServices>

singletonInterface(Instance)
@end
