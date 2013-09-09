//
//  Mi9User.m
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9User.h"
#import <Parse/PFUser.h>

@implementation Mi9User

- (id)initWithUsername:(NSString*)username andPassword:(NSString*)password andEmail:(NSString*)email {
    self = [super init];
    if (self)
    {
        self.password = password;
        self.username = username;
        self.email = email;
    }
    return self;
}


- (BOOL) saveInBackground {
    PFUser *user = [[PFUser alloc] init];
    user.password = self.password;
    user.email = self.email;
    user.username = self.username;
    
    __block BOOL success = NO;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"sign up success");
            success = YES;
        }
        else {
            NSLog(@"%@", error);
            success = NO;
        }
    }];
    return success;
}

@end
