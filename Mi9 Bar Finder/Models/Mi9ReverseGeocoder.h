//
//  Mi9ReverseGeocoder.h
//  Mi9 Bar Finder
//
//  Created by Cameron Barrie on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Mi9ReverseGeocoder : NSObject<CLLocationManagerDelegate>

+ (id)sharedGeocoder;
- (void)getAddressForCurrentLocationWithCompletion:(void (^)(NSString* address, NSError* error))completion;

@end
