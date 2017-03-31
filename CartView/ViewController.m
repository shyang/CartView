//
//  ViewController.m
//  CartView
//
//  Created by shaohua on 31/03/2017.
//  Copyright © 2017 syang. All rights reserved.
//

#import "ViewController.h"
#import "CartView.h"

static int count = 0;

@interface ViewController ()

@property (nonatomic) CartView *cartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    _cartView = [[CartView alloc] init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_cartView];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onLeftTapped)];
}

- (void)onLeftTapped {
    [_cartView setObject:++count animated:YES];
}

@end
