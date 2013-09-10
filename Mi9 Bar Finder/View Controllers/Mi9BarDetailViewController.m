//
//  Mi9BarDetailViewController.m
//  Mi9 Bar Finder
//
//  Created by James Prendergast on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9BarDetailViewController.h"

@interface Mi9BarDetailViewController ()

@end

@implementation Mi9BarDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.map.delegate = self;
    
}

-(void)loadBarData:(Mi9Bar *)bar{
    self.title = bar.name;
    self.description.text = bar.summary;
    self.location.text = bar.address;
    self.rating.text = [bar.rating stringValue];
    CLLocationCoordinate2D loc;
    if(bar.latitude != nil){
        loc = CLLocationCoordinate2DMake((CLLocationDegrees)[bar.latitude doubleValue],
                                                            (CLLocationDegrees)[bar.longitude doubleValue]);
    }else{
        loc = CLLocationCoordinate2DMake((CLLocationDegrees)-23.7000,
                                         (CLLocationDegrees)133.8833);
    }
    [self.map setRegion:MKCoordinateRegionMakeWithDistance(loc, (CLLocationDistance)500.0,(CLLocationDistance)500.0) animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView{
    
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    
}

- (IBAction)displayGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer{
    
}

@end
