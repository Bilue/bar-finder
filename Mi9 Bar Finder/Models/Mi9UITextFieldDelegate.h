//
//  Mi9UITextFieldDelegate.h
//  Mi9 Bar Finder
//
//  Created by Paul Mansfield on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mi9AddBarViewController.h"
@class Mi9AddBarViewController;
@interface Mi9UITextFieldDelegate : NSObject<UITextFieldDelegate>
@property (nonatomic,assign) Mi9AddBarViewController* viewController;
@end

