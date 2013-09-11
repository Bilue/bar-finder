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

- (void)ValidateText:(UITextField *)textField{
    if(textField.text.length == 0 && textField.tag != 2){
    textField.layer.borderColor=[[UIColor colorWithRed:255.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0] CGColor];
        textField.layer.borderWidth=5.0;
        textField.layer.cornerRadius = 5;
        textField.clipsToBounds      = YES;
        _viewController.submitButton.enabled = false;
    }else if (textField.tag == 2){
       
        if([textField.text rangeOfString:@"http://"].location == NSNotFound ){
            textField.layer.borderColor=[[UIColor colorWithRed:255.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0] CGColor];
            textField.layer.borderWidth=5.0;
            textField.layer.cornerRadius = 5;
            textField.clipsToBounds      = YES;
            _viewController.submitButton.enabled = false;
            
        }else{
            textField.layer.borderColor=[[UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:178.0f/255.0f alpha:1.0] CGColor];
            textField.layer.borderWidth=5.0;
            textField.layer.cornerRadius = 5;
            textField.clipsToBounds      = YES;
            _viewController.submitButton.enabled = true;
        }
    }else{
        textField.layer.borderColor=[[UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:178.0f/255.0f alpha:1.0] CGColor];
        textField.layer.borderWidth=5.0;
        textField.layer.cornerRadius = 5;
        textField.clipsToBounds      = YES;
        _viewController.submitButton.enabled = true;
    }
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self ValidateText:textField];
    
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self ValidateText:textField];

    

}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self ValidateText:textField];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self ValidateText:textField];

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [self ValidateText:textField];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self ValidateText:textField];
    [textField resignFirstResponder];
    return NO;
}

@end
