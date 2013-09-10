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

    describe(@"the full stars image view", ^{
        it(@"should exist and have a size", ^{
            [[starRatingView.fullStarsImageView shouldNot] beNil];
            [[starRatingView.fullStarsImageView.image should] equal:[UIImage imageNamed:@"full-stars.png"]];
            [[theValue(starRatingView.fullStarsImageView.frame.size.width) should] equal:theValue(112.f)];
            [[theValue(starRatingView.fullStarsImageView.frame.size.height) should] equal:theValue(21.f)];
        });

        it(@"should be a subview of the star rating view", ^{
            [[starRatingView.fullStarsImageView.superview should] equal:starRatingView];
        });

        it(@"should clip to bounds", ^{
            [[theValue(starRatingView.fullStarsImageView.clipsToBounds) should] equal:theValue(YES)];
        });

        it(@"should have content mode left", ^{
            [[theValue(starRatingView.fullStarsImageView.contentMode) should] equal:theValue(UIViewContentModeLeft)];
        });
    });

    describe(@"the empty stars image view", ^{
        it(@"should have an empty stars image view", ^{
            [[starRatingView.emptyStarsImageView shouldNot] beNil];
            [[starRatingView.emptyStarsImageView.image should] equal:[UIImage imageNamed:@"empty-stars.png"]];
            [[theValue(starRatingView.emptyStarsImageView.frame.size.width) should] equal:theValue(112.f)];
            [[theValue(starRatingView.emptyStarsImageView.frame.size.height) should] equal:theValue(21.f)];
        });

        it(@"should be a subview of star rating view", ^{
            [[starRatingView.emptyStarsImageView.superview should] equal:starRatingView];
        });
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

