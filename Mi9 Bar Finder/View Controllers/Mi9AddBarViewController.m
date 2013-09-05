//
//  Mi9AddBarViewController.m
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9AddBarViewController.h"

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
}

- (void) addPhoto {

    self.imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera] == YES){
        self.imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;

    }

    self.imagePickerDelegate = [[Mi9PhotoPickerDelegate alloc] init];
    // Delegate is self
    self.imagePicker.delegate = self.imagePickerDelegate;

    // Show image picker
    [self presentViewController:self.imagePicker animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
