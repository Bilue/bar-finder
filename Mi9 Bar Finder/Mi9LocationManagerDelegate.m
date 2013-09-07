//
//  Mi9LocationManagerDelegate.m
//  Mi9 Bar Finder
//
//  Created by Roberto Amici on 7/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9LocationManagerDelegate.h"

@implementation Mi9LocationManagerDelegate


- (instancetype) initWithCallback:(VOID_LOCATIONS_BLOCK)handler {
    if (self) {
        self.callback = handler;
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {

    //TODO: translate lat/long in address?

    NSString* locationAsString = [NSString stringWithFormat:@"%@", manager.location];
    self.callback(locationAsString, nil);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    self.callback(nil, error);
}

@end
