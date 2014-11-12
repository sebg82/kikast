//
//  LoggedViewController.h
//  kikast
//
//  Created by Rocio on 12/11/14.
//  Copyright (c) 2014 Seb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisteredViewController : UIViewController

@property (strong, nonatomic) NSString *strUserId;
@property (weak, nonatomic) IBOutlet UILabel *lblUserID;
@end
