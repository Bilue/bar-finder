//
//  Mi9AddBarViewController.m
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9AddBarViewController.h"
#import "Mi9UITextFieldDelegate.h"
@interface Mi9AddBarViewController ()

@end

@implementation Mi9AddBarViewController

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

    [self.photoButton addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchUpInside];

    [self.ratingSlider addTarget:self action:@selector(sliderUpdate) forControlEvents:UIControlEventTouchUpInside];


    _tDelegate = [[Mi9UITextFieldDelegate alloc]init];
    self.nameTextField.delegate = _tDelegate;
}

- (void) sliderUpdate {
    double doubleSliderValue = self.ratingSlider.value * 2;
    [self.ratingSlider setValue:round(doubleSliderValue)/2 animated:YES];
}

- (void) addPhoto {

    self.imagePickerDelegate = [[Mi9PhotoPickerDelegate alloc] init];
    self.imagePickerDelegate.parentViewController = self;

    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera] == YES){
        self.imagePicker = [[UIImagePickerController alloc] init];
        self.imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;

        self.imagePicker.delegate = self.imagePickerDelegate;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    } else {
        [self.imagePickerDelegate selectDefaultPicture];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
