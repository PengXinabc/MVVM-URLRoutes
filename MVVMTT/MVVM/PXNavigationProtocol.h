//
//  PXNavigationProtocol.h
//  MVVMTT
//
//  Created by Xin Peng on 16/12/31.
//  Copyright © 2016年 EB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXViewModel.h"

typedef void (^VoidBlock)();

typedef NS_ENUM(NSUInteger, PXControlerType) {
    ///default vc
    PXControlerTypeDefault = 1 << 0,
    ///nav vc
    PXControlerTypeNav = 1 << 1,
    ///tabbar vc
    PXControlerTypeTabbar = 1 << 2,
};

@protocol PXNavigationProtocol <NSObject>

@optional

/// Pushes the view controller.(PXControlerTypeDefault --default vcType)
///
/// 基于viewModel进行push
/// viewModel - 指定的viewModel
- (void)pushViewModel:(PXViewModel *)viewModel animated:(BOOL)animated;

/// Pushes the view controller
///
/// 基于viewModel进行push
/// viewModel - 指定的viewModel
- (void)pushViewModel:(PXViewModel *)viewModel vcType:(PXControlerType)vcType animated:(BOOL)animated;

/// Pops the top view controller in the stack.
///
- (void)popViewModelAnimated:(BOOL)animated;

/// Pops until there's only a single view controller left on the stack.
///
- (void)popToRootViewModelAnimated:(BOOL)animated;

/// Present the corresponding view controller.(PXControlerTypeDefault --default vcType)
///
/// viewModel  - the view model
- (void)presentViewModel:(PXViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;

/// Present the corresponding view controller.
///
/// viewModel  - the view model
- (void)presentViewModel:(PXViewModel *)viewModel vcType:(PXControlerType)vcType animated:(BOOL)animated completion:(VoidBlock)completion;

/// Dismiss the presented view controller.
///
- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;

/// Reset the corresponding view controller as the root view controller of the application's window.
/// (PXControlerTypeDefault --default vcType)
/// viewModel - the view model
- (void)resetRootViewModel:(PXViewModel *)viewModel;

/// Reset the corresponding view controller as the root view controller of the application's window.
///
/// viewModel - the view model
- (void)resetRootViewModel:(PXViewModel *)viewModel vcType:(PXControlerType)vcType;

/// url Route (pattern 和 parameters分开，将来服务端统一下发扩展)
/// routePattern - url pattern
/// parameters   - url parameters
- (void)addRoute:(NSString *)routePattern parameters:(NSDictionary *)parameters;

@end
