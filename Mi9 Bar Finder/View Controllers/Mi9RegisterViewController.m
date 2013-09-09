//
//  Mi9RegisterViewController.m
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9RegisterViewController.h"
#import "Mi9User.h"

@interface Mi9RegisterViewController ()

@end

@implementation Mi9RegisterViewController

-(IBAction)registerUser:(id)sender
{
    [self scrollToTop];
    self.errorLabel.hidden = YES;
    
    if (![self.passwordTextField.text isEqualToString:self.confirmTextField.text])
    {
        [self showErrorLabel:@"Passwords do not match"];
    }
    else if (![self isUserInputValid])
    {
        [self showErrorLabel:@"Please fill in all fields"];
    }
    else
    {
        Mi9User *user = [[Mi9User alloc] initWithUsername:self.nameTextField.text andPassword:self.passwordTextField.text andEmail:self.emailTextField.text];
        
        [user saveInBackground:^(BOOL success,NSError *error){
            if (success)
            {
                // todo: show bar list
            }
            else {
                // todo: get meaningful error message
                [self showErrorLabel:error.description];
            }
        }];
    }
}

- (void) showErrorLabel:(NSString*)message {
    self.errorLabel.hidden = NO;
    self.errorLabel.text = message;
    self.errorLabel.textColor = [UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0];
}


- (BOOL) isUserInputValid {
    return
        !([self.nameTextField.text isEqualToString:@""]) &&
        !([self.emailTextField.text isEqualToString:@""]) &&
        !([self.passwordTextField.text isEqualToString:@""]) &&
        !([self.confirmTextField.text isEqualToString:@""]);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField.frame.origin.y > 100) {
        [self scrollToTop];
    }
    
}

- (void) scrollToTop {

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    self.view.frame = frame;
    [UIView commitAnimations];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField setReturnKeyType:UIReturnKeyDone];
    [textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    
    if (textField.frame.origin.y > 100) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
        CGRect frame = self.view.frame;
        frame.origin.y = - textField.frame.origin.y + 40;
        self.view.frame = frame;
        [UIView commitAnimations];
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
