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

@property (weak, nonatomic) IBOutlet UILabel* location;
@property (weak, nonatomic) IBOutlet UILabel* description;
@property (weak, nonatomic) IBOutlet UILabel* rating;
@property (weak, nonatomic) IBOutlet UILabel* reviewerName;
@property (weak, nonatomic) IBOutlet UIImageView* mainImage;
@property (weak, nonatomic) IBOutlet MKMapView* map;


- (void)loadBarData:(Mi9Bar*)bar;

@end
