//
//  Mi9AddBarViewController.h
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mi9PhotoPickerDelegate.h"

@interface Mi9AddBarViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField* nameTextField;
@property (nonatomic, weak) IBOutlet UITextField* summaryTextField;
@property (nonatomic, weak) IBOutlet UITextField* locationTextField;
@property (nonatomic, weak) IBOutlet UIButton* photoButton;
@property (nonatomic, weak) IBOutlet UISlider* ratingSlider;
@property (nonatomic, weak) IBOutlet UIButton* submitButton;


@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* summaryLabel;
@property (nonatomic, weak) IBOutlet UILabel* locationLabel;
@property (nonatomic, weak) IBOutlet UILabel* photoLabel;
@property (nonatomic, weak) IBOutlet UILabel* ratingLabel;

@property (nonatomic, strong) IBOutlet UIImagePickerController* imagePicker;
@property (nonatomic, strong) Mi9PhotoPickerDelegate* imagePickerDelegate;

@end
