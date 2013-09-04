//
//  Mi9WelcomeViewController.h
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mi9WelcomeViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *signInButton;
@property (nonatomic, weak) IBOutlet UIButton *registerButton;

- (IBAction) showSignInScreen;
- (IBAction) showRegisterScreen;

@end
