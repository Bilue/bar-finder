//
//  Mi9StarRatingViewSpec.m
//  Mi9 Bar Finder
//
//  Created by Varun on 2013/09/10.
//  Copyright (c) 2013年 NineMSN. All rights reserved.
//

#import "Kiwi.h"
#import "Mi9StarRatingView.h"

SPEC_BEGIN(Mi9StarRatingViewSpec)

describe(@"The Star Rating View", ^{
    
    __block Mi9StarRatingView* starRatingView;
    
    beforeAll(^{
        starRatingView = [[Mi9StarRatingView alloc] init];
    });

    it(@"should load a full stars image view", ^{
        [[starRatingView.fullStarsImageView shouldNot] beNil];
        [[theValue(starRatingView.fullStarsImageView.frame.size.width) should] equal:theValue(112.f)];
        [[theValue(starRatingView.fullStarsImageView.frame.size.height) should] equal:theValue(21.f)];
    });

    it(@"should resize the full stars image proportionally when a star rating is set", ^{
        CGFloat originalWidth = starRatingView.fullStarsImageView.frame.size.width;
        CGFloat rating = 3.5f;
        CGFloat max = 5.f;
        [starRatingView setRating:rating outOf:max];
        [[theValue(starRatingView.fullStarsImageView.frame.size.width) should] equal:theValue(rating/max * originalWidth)];
    });
});

SPEC_END

