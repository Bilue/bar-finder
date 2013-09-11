//
//  Mi9PhotoPickerDelegate.m
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 5/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9PhotoPickerDelegate.h"
#import "Mi9AddBarViewController.h"
#import <Parse/Parse.h>

@implementation Mi9PhotoPickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

    // Dismiss controller
    if (picker) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }

    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    Mi9AddBarViewController* parent = (Mi9AddBarViewController*) self.parentViewController;
    parent.imageView.image = smallImage;

}

- (void) selectDefaultPicture {
    // Device has no camera
    UIImage *image = [UIImage imageNamed:@"Default-Bar-Image.png"];
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:image forKey:@"UIImagePickerControllerOriginalImage"];

    [self imagePickerController:nil didFinishPickingMediaWithInfo:dictionary];
}


@end
