//
//  LoggedViewController.m
//  kikast
//
//  Created by Rocio on 12/11/14.
//  Copyright (c) 2014 Seb. All rights reserved.
//

#import "RegisteredViewController.h"

@interface RegisteredViewController ()

@end

@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.lblUserID.text = self.strUserId;
}

@end
