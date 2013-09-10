//
//  Mi9BarDetailViewController.h
//  Mi9 Bar Finder
//
//  Created by James Prendergast on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Mi9Bar.h"

@interface Mi9BarDetailViewController : UIViewController<MKMapViewDelegate>{
    MKCoordinateRegion* mapRegion;
}

@property (nonatomic, strong) IBOutlet UILabel* location;
@property (nonatomic, strong) IBOutlet UILabel* description;
@property (nonatomic, strong) IBOutlet UILabel* rating;
@property (nonatomic, strong) IBOutlet UILabel* reviewerName;
@property (nonatomic, strong) IBOutlet UIImageView* mainImage;
@property (nonatomic, strong) IBOutlet MKMapView* map;
@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapRecognizer;


- (void)loadBarData:(Mi9Bar*)bar;

- (IBAction)displayGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer;

@end
