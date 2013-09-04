#import "Kiwi.h"
#import "Mi9BarDetailViewController.h"

SPEC_BEGIN(Mi9BarDetailViewControllerSpec)

describe(@"The Detail View Controller", ^{
    
    __block Mi9BarDetailViewController* viewController;
    
    beforeAll(^{
        viewController = [[Mi9BarDetailViewController alloc] initWithNibName:@"Mi9BarDetailViewController" bundle:nil];
    });
    
    it(@"should load the view", ^{
        
        [[(viewController.view) should] beNonNil];
    });
    
    it(@"should populate properties from Bar Model",^{
        
        id bar = [Mi9Bar alloc];
        NSNumber *rating = [NSNumber numberWithFloat:4.5];
        [bar stub:@selector(name) andReturn:@"Varun's"];
        [bar stub:@selector(address) andReturn:@"Somewhere good"];
        [bar stub:@selector(rating) andReturn:rating];
        [bar stub:@selector(summary) andReturn:@"foo"];
        [viewController loadBarData:bar];
        
        [[viewController.title should] equal:@"Varun's"];
        [[viewController.location.text should] equal:@"Somewhere good"];
        [[viewController.rating.text should] equal:[rating stringValue]];
        [[viewController.description.text should] equal:@"foo"];

    });
});

SPEC_END

