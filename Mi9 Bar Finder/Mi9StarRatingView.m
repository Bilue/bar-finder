//
//  Mi9StarRatingView.m
//  Mi9 Bar Finder
//
//  Created by Varun on 2013/09/10.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9StarRatingView.h"

@implementation Mi9StarRatingView {
    float _imageViewWidth;
}

- (void)baseInit {
    self.fullStarsImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"full-stars.png"]];
    self.fullStarsImageView.frame = CGRectMake(0, 0, self.fullStarsImageView.image.size.width, self.fullStarsImageView.image.size.height);
    self.fullStarsImageView.clipsToBounds = YES;
    self.fullStarsImageView.contentMode = UIViewContentModeLeft;
    _imageViewWidth = self.fullStarsImageView.image.size.width;

    self.emptyStarsImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"empty-stars.png"]];
    self.emptyStarsImageView.frame = CGRectMake(0, 0, self.emptyStarsImageView.image.size.width, self.emptyStarsImageView.image.size.height);

    [self addSubview:self.fullStarsImageView];
    [self addSubview:self.emptyStarsImageView];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self baseInit];
    }

    return self;
}

- (void)setRating:(float)rating outOf:(float)max {
    float widthMultiplier = rating/max;
    self.fullStarsImageView.frame = CGRectMake(
        self.fullStarsImageView.frame.origin.x,
        self.fullStarsImageView.frame.origin.y,
        _imageViewWidth * widthMultiplier,
        self.fullStarsImageView.frame.size.height);
}
@end
