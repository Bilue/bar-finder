//
//  Mi9ViewController.m
//  Mi9 Bar Finder
//
//  Created by Cameron Barrie on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9ViewController.h"
#import "Mi9Bar.h"

@interface Mi9ViewController ()

@end

@implementation Mi9ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [Mi9Bar findAllWithCompletion:^(NSArray *bars, NSError *error) {
        NSLog(@"BARS: %@", bars);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
