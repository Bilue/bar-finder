//
//  Mi9StarRatingView.m
//  Mi9 Bar Finder
//
//  Created by Varun on 2013/09/10.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9StarRatingView.h"

@implementation Mi9StarRatingView

- (id)init {
    self = [super init];
    if (self) {
        self.fullStarsImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"full-stars.png"]];
        self.fullStarsImageView.frame = CGRectMake(0, 0, self.fullStarsImageView.image.size.width, self.fullStarsImageView.image.size.height);
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [self init];
    }
    return self;
}

- (void)setRating:(float)rating outOf:(float)max {

}
@end
