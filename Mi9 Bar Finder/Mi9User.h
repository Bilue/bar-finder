//
//  Mi9User.h
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

typedef void (^signUpUserBlock)(BOOL succeeded, NSError *error);
typedef void (^signinUserBlock)(PFUser *user, NSError *error);

@interface Mi9User : NSObject

@property NSString *username;
@property NSString *email;
@property NSString *password;
@property NSString *errorMessage;

- (void) saveInBackground:(signUpUserBlock)block;

- (id)initWithUsername:(NSString*)username andPassword:(NSString*)password andEmail:(NSString*)email;

+ (void) signInWithUsername:(NSString*)username andPassword:(NSString*)password WithCompletion:(signinUserBlock)block;
@end
