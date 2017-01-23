//
//  PXViewModel.h
//  MVVMTT
//
//  Created by Xin Peng on 17/1/23.
//  Copyright © 2017年 EB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXViewModelServices.h"

@class PXViewModelServicesImpl;

@interface PXViewModel : NSObject <PXViewModelServices>

extern PXViewModelServicesImpl *_services;

@end
