//
//  ViewController.m
//  MVVMTT
//
//  Created by Xin Peng on 16/12/31.
//  Copyright © 2016年 EB. All rights reserved.
//

#import "ViewController.h"
#import "PXViewModelServicesImpl.h"
#import "ViewControllerViewModel.h"

@interface ViewController ()

@property(nonatomic, strong) ViewControllerViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
}

- (void)bindViewModel {
    _viewModel = [[ViewControllerViewModel alloc] init];
}
- (IBAction)push:(id)sender {
    [_viewModel openPath:@"MVVMTT://NaviPush/SecondController?name=彭欣&age=28"];
//    [PXViewModelServicesImpl.sharedInstance openPath:@"MVVMTT://NaviPush/SecondController?name=彭欣&age=28"];
}

- (IBAction)present:(id)sender {
    [_viewModel openPath:@"MVVMTT://Present/SecondController"];//问题页导向web
//    [PXViewModelServicesImpl.sharedInstance openPath:@"MVVMTT://Present/SecondController"];
}

- (IBAction)webPage:(id)sender {
    [_viewModel openPath:@"httpPage"];//问题页导向web
//    [PXViewModelServicesImpl.sharedInstance openPath:@"httpPage"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
