//
//  ViewController.h
//  kikast
//
//  Created by Rocio on 12/11/14.
//  Copyright (c) 2014 Seb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController{
    NSString *userID;
}

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

