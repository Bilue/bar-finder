//
//  Mi9AddBarViewController.m
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9AddBarViewController.h"
#import "Mi9UITextFieldDelegate.h"
#import "CoreLocation/CLLocationManager.h"
#import "Mi9LocationManagerDelegate.h"
#import "QuartzCore/CALayer.h"

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];

    [self.photoButton addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchUpInside];

    [self.ratingSlider addTarget:self action:@selector(sliderUpdate) forControlEvents:UIControlEventTouchUpInside];

    self.locationManager = [[CLLocationManager alloc] init];

    self.locationManagerDelegate = [[Mi9LocationManagerDelegate alloc] initWithCallback:^(NSString* location, NSError* error) {
        [self.locationManager stopUpdatingLocation];
        if (!error) {
            self.locationTextField.text = location;
        }
    }];

    self.locationManager.delegate = self.locationManagerDelegate;
    [self.locationManager startUpdatingLocation];
    _tDelegate = [[Mi9UITextFieldDelegate alloc]init];
    _tDelegate.view = self.view;
    self.summaryTextField.delegate = _tDelegate;
    self.nameTextField.delegate = _tDelegate;
    self.ratingFullImageView.clipsToBounds = YES;
}
- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    [self.view setFrame:CGRectMake(0,-40,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    [UIView commitAnimations];
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,20,320,460);
    [UIView commitAnimations];
}

- (void) sliderUpdate {
    double roundedSliderValue = round(self.ratingSlider.value * 2)/2;
    [self.ratingSlider setValue:roundedSliderValue animated:YES];


    CGPoint origin = self.ratingFullImageView.frame.origin;
    CGSize size = self.ratingEmptyImageView.frame.size;

    double newWidth = (size.width * roundedSliderValue)/5;

    self.ratingFullImageView.frame = CGRectMake(origin.x, origin.y, newWidth, size.height);
    
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
