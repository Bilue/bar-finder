//
//  Mi9SignInViewController.m
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9SignInViewController.h"
#import "Mi9User.h"

@interface Mi9SignInViewController ()

@end

@implementation Mi9SignInViewController

- (void) signinUser:(id)sender
{
    [Mi9User signInWithUsername:self.usernameTextField.text andPassword:self.passwordTextField.text WithCompletion:^(PFUser *user, NSError *error) {
        if (user) {
            // Do stuff after successful login.
            NSLog(@"User email: %@", user.email);
        } else {
            // The login failed. Check error to see why.
            [self.scrollView setContentOffset:CGPointZero animated:YES];
            [self showErrorLabel:error.userInfo[@"error"]];
        }
    }];
}

- (void) showErrorLabel:(NSString*)message {
    self.errorLabel.hidden = NO;
    self.errorLabel.text = message;
    self.errorLabel.textColor = [UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
