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
    NSLog(@"register user");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField setReturnKeyType:UIReturnKeyDone];
    [textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
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
