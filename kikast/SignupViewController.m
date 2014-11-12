//
//  ViewController.m
//  kikast
//
//  Created by Rocio on 12/11/14.
//  Copyright (c) 2014 Seb. All rights reserved.
//

#import "SignupViewController.h"
#import "RegisteredViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"login" ]) {
        NSError *error;
        
        // parameters to send to the web service
        NSMutableDictionary *dicQuery = [NSMutableDictionary dictionary];
        [dicQuery setObject:self.username.text forKey:@"username"];
        [dicQuery setObject:self.email.text forKey:@"email"];
        [dicQuery setObject:self.password.text forKey:@"password"];
        
        // create a json data with the parameters
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dicQuery options:kNilOptions error:&error];
        
        // send request with the json parameters in a POST method
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://private-anon-d06ee8fa1-kikastmobile.apiary-mock.com/users/signupManual"] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10.0];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:jsonData];

        NSURLResponse *response;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        if(!data) return NO;

        NSUInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
        if (error || statusCode != 201) return NO;
        
        // IF WE RECEIVE DATA IN A JSON FORMAT
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(!dictionary) return NO;
        NSDictionary *user = [dictionary objectForKey:@"user"];
        userID = [user objectForKey:@"id"];

        return YES;
    }
    return NO;
    
    // TODO show error messages in place of "return NO"
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];
    if([[segue identifier] isEqualToString:@"login"]){
        RegisteredViewController *loggedVC = (RegisteredViewController *)[segue destinationViewController];
        loggedVC.strUserId = userID;
    }
}

@end
