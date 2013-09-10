//
//  Mi9StarRatingView.h
//  Mi9 Bar Finder
//
//  Created by Varun on 2013/09/10.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//



@interface Mi9StarRatingView : UIView

@property UIImageView* emptyStarsImageView;
@property UIImageView* fullStarsImageView;

- (void)setRating:(float)rating outOf:(float)max;
@end
