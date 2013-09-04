//
//  Mi9Bar.h
//  Mi9 Bar Finder
//
//  Created by Cameron Barrie on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mi9Bar : NSObject

@property (strong) NSString* name;
@property (strong) NSString* summary;
@property (strong) NSNumber* rating;
@property (strong) NSString* website;
@property (strong) NSString* address;

- (void)saveInBackground;
+ (void)barWithID:(NSString *)_id completion:(void (^)(Mi9Bar *bar, NSError* error))completionBlock;

@end
