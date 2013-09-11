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
+ (void) signInWithUsername:(NSString*)username andPassword:(NSString*)password WithCompletion:(signinUserBlock)block
{
    [PFUser logInWithUsernameInBackground:username password:password block:block];
}

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


- (void) saveInBackground:(signUpUserBlock)userBlock {
    PFUser *user = [[PFUser alloc] init];
    user.password = self.password;
    user.email = self.email;
    user.username = self.username;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"sign up success");        }
        else {
            NSLog(@"%@", error);
            userBlock(succeeded, error);
        }
    }];
}

@end
