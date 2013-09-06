//
//  Mi9RegisterViewController.h
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mi9RegisterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UITextField *confirmTextField;
@property (nonatomic, weak) IBOutlet UIButton *registerButton;

-(IBAction)registerUser:(id)sender;
@end
