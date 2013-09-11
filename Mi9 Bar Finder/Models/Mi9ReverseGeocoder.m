//
//  Mi9ReverseGeocoder.m
//  Mi9 Bar Finder
//
//  Created by Cameron Barrie on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9ReverseGeocoder.h"

typedef void (^LOCATION_BLOCK)(NSString* address, NSError* error);

@interface Mi9ReverseGeocoder()
@property (readonly, strong) CLLocationManager* locationManager;
@property (strong) LOCATION_BLOCK completionBlock;
@property (getter = isGettingLocation) BOOL gettingLocation;
@end

@implementation Mi9ReverseGeocoder

@synthesize locationManager = _locationManager;

+ (id)sharedGeocoder {
    static dispatch_once_t once;
    static Mi9ReverseGeocoder* sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.gettingLocation = NO;
    });
    return sharedInstance;
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _locationManager;
}

- (void)getAddressForCurrentLocationWithCompletion:(void (^)(NSString* address, NSError* error))completion {
    if (!self.isGettingLocation) {
        self.gettingLocation = YES;
        self.completionBlock = completion;
        [self.locationManager startUpdatingLocation];
    } else {
        NSAssert(@"Already obtaining a location", nil);
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* newLocation = [locations lastObject];

    NSString* formattedURL = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&sensor=true", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
    NSURL* URL = [NSURL URLWithString:formattedURL];
    __weak Mi9ReverseGeocoder* weakSelf = self;
    
    NSURLRequest* request = [NSURLRequest requestWithURL:URL];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error == nil) {
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (weakSelf.completionBlock) {
                if (error == nil) {
                    NSString* address = jsonObject[@"results"][0][@"formatted_address"];
                    weakSelf.completionBlock(address, error);
                } else {
                    weakSelf.completionBlock(nil, error);
                }
            }
        } else {
            if (weakSelf.completionBlock)
                weakSelf.completionBlock(nil, error);
        }
        
        [weakSelf.locationManager stopUpdatingLocation];
        weakSelf.gettingLocation = NO;
        weakSelf.completionBlock = nil;
    }];

}

@end
