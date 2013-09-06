//
//  Mi9UITextFieldDelegate.m
//  Mi9 Bar Finder
//
//  Created by Paul Mansfield on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9UITextFieldDelegate.h"
#import <QuartzCore/QuartzCore.h>
@implementation Mi9UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

@end
