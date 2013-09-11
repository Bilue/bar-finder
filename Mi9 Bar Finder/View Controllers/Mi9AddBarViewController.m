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
#import "Mi9Bar.h"
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

    [self.ratingSlider addTarget:self action:@selector(sliderUpdate) forControlEvents:UIControlEventValueChanged];

    self.locationManager = [[CLLocationManager alloc] init];

    self.locationManagerDelegate = [[Mi9LocationManagerDelegate alloc] initWithCallback:^(NSString* location, NSError* error) {
        [self.locationManager stopUpdatingLocation];
        if (!error) {
            self.locationTextField.text = location;
        }
    }];

    //initializing image from code - had to do it this way because from nib it wrecks
    CGRect frame = self.ratingEmptyImageView.frame;
    self.ratingFullImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"full-stars@2x.png"]];

    self.ratingFullImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width/2, frame.size.height);
    self.ratingFullImageView.contentMode = UIViewContentModeLeft;
    self.ratingFullImageView.clipsToBounds = YES;
    [self.scrollView addSubview:self.ratingFullImageView];

    self.submitButton.tintColor = [UIColor blueColor];
    self.locationManager.delegate = self.locationManagerDelegate;
    [self.locationManager startUpdatingLocation];
    _tDelegate = [[Mi9UITextFieldDelegate alloc]init];
    _tDelegate.viewController = self;
    self.summaryTextField.delegate = _tDelegate;
    self.nameTextField.delegate = _tDelegate;
    self.websiteTextField.delegate = _tDelegate;

}

- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    NSLog(@"%@", info);
    NSValue *avalue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize KeyboardSize = [avalue CGRectValue].size;
    //Assign new frame to your view

    CGRect viewFrame=self.view.frame;
    viewFrame.size.height -= KeyboardSize.height;
    _scrollView.frame=viewFrame;
    // CGRect textViewdRect = [customTextViewTwo frame];
   // [_scrollView scrollRectToVisible: textViewdRect animated:YES];
    for (UIView *view in self.scrollView.subviews) {
        if (view.isFirstResponder) {
            CGRect textViewdRect = [view frame];
            [_scrollView scrollRectToVisible: textViewdRect animated:YES];
        }
    }
 
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{

    NSDictionary *info = [notification userInfo];
    NSValue *avalue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize KeyboardSize = [avalue CGRectValue].size;
    CGRect viewFrame = _scrollView.frame;
    viewFrame.size.height += KeyboardSize.height;
    _scrollView.frame = viewFrame;
   
}


- (void) sliderUpdate {
    double roundedSliderValue = round(self.ratingSlider.value * 2)/2;
    CGPoint origin = self.ratingFullImageView.frame.origin;
    CGSize size = self.ratingEmptyImageView.frame.size;

    double newWidth = (size.width * roundedSliderValue)/5;

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];

    [self.ratingSlider setValue:roundedSliderValue animated:YES];
    self.ratingFullImageView.frame = CGRectMake(origin.x, origin.y, newWidth, size.height);
    [UIView commitAnimations];
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

    [self.photoButton setTitle:@"Change Photo" forState:UIControlStateNormal];

    [Mi9Bar findAllWithCompletion:^(NSArray *bars, NSError *error) {
        NSLog(@"BARS: %@", bars);

    }];

}
- (void)CreateBar {
    Mi9Bar *bar = [[Mi9Bar alloc]init];
    bar.name = self.nameTextField.text;
    bar.summary = self.summaryTextField.text;
    bar.address = self.locationTextField.text;
    bar.website = self.websiteTextField.text;
    bar.rating = [NSNumber numberWithFloat:self.ratingSlider.value];
    bar.photo = UIImageJPEGRepresentation(self.imageView.image, 0.05f);

    [self UploadBarToParse:bar];
}
- (void)UploadBarToParse: (Mi9Bar*)bar{
    [bar saveInBackground];
    [Mi9Bar findAllWithCompletion:^(NSArray *bars, NSError *error) {
        NSLog(@"BARS: %@", bars);
        
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
