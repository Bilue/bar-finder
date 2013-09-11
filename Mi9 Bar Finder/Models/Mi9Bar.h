//
//  Mi9Bar.h
//  Mi9 Bar Finder
//
//  Created by Cameron Barrie on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Mi9Bar;

typedef void (^VOID_BARS_BLOCK)(NSArray *bars, NSError *error);
typedef void (^VOID_BAR_BLOCK)(Mi9Bar *bar, NSError *error);
typedef void (^VOID_IMAGE_BLOCK)(UIImage* image, NSError *error);

@interface Mi9Bar : NSObject

@property (strong) NSString* name;
@property (strong) NSString* summary;
@property (strong) NSNumber* rating;
@property (strong) NSString* website;
@property (strong) NSString* address;
@property (strong) NSNumber* latitude;
@property (strong) NSNumber* longitude;
@property (strong) NSData* photo;

+ (void)findAllWithCompletion:(VOID_BARS_BLOCK)completionBlock;
+ (void)barWithID:(NSString *)_id completion:(VOID_BAR_BLOCK)completionBlock;
- (void)getImageWithCompletion:(VOID_IMAGE_BLOCK)completionBlock;
- (void)saveInBackground;

@end
