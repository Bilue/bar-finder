//
//  Mi9LocationManagerDelegate.h
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 7/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreLocation/CLLocationManager.h"
#import "CoreLocation/CLLocationManagerDelegate.h"

typedef void (^VOID_LOCATIONS_BLOCK)(NSString* location, NSError *error);

@interface Mi9LocationManagerDelegate : NSObject<CLLocationManagerDelegate>

@property (nonatomic, strong) VOID_LOCATIONS_BLOCK callback;

- (instancetype) initWithCallback:(VOID_LOCATIONS_BLOCK) handler;

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;


@end
