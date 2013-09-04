#import "Kiwi.h"
#import "Mi9BarDetailViewController.h"

SPEC_BEGIN(Mi9BarDetailViewControllerSpec)

describe(@"The Detail View Controller", ^{
    
    it(@"should load the view", ^{
        Mi9BarDetailViewController* viewController = [[Mi9BarDetailViewController alloc] initWithNibName:@"Mi9BarDetailViewController" bundle:nil];

        [[(viewController.view) should] beNonNil];
    });
    
    
});

SPEC_END

