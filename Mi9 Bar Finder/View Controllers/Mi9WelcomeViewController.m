//
//  Mi9WelcomeViewController.m
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9WelcomeViewController.h"
#import "Mi9SignInViewController.h"
#import "Mi9RegisterViewController.h"

@interface Mi9WelcomeViewController ()

@end

@implementation Mi9WelcomeViewController

- (IBAction) showSignInScreen
{
    Mi9SignInViewController* signInViewController = [[Mi9SignInViewController alloc] initWithNibName:@"Mi9SignInViewController" bundle:nil];
    
    [self.navigationController pushViewController:signInViewController animated:YES];
}

- (IBAction) showRegisterScreen
{
    Mi9RegisterViewController* registerViewController = [[Mi9RegisterViewController alloc] initWithNibName:@"Mi9RegisterViewController" bundle:nil];
    
    [self.navigationController pushViewController:registerViewController animated:YES];
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
