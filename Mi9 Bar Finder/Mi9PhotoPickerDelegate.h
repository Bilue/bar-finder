//
//  Mi9PhotoPickerDelegate.h
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 5/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mi9PhotoPickerDelegate : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;


@end
