//
//  Mi9User.h
//  Mi9 Bar Finder
//
//  Created by Daphne Chong on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mi9User : NSObject

@property NSString *username;
@property NSString *email;
@property NSString *password;

- (void) saveInBackground;

@end
