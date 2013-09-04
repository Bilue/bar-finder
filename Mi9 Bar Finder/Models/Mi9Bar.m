//
//  Mi9Bar.m
//  Mi9 Bar Finder
//
//  Created by Cameron Barrie on 4/09/13.
//  Copyright (c) 2013 NineMSN. All rights reserved.
//

#import "Mi9Bar.h"
#import <Parse/Parse.h>

@implementation Mi9Bar

+ (NSString *)parseClassName {
    return @"Mi9Bar";
}

- (instancetype)initWithPFObject:(PFObject *)parseObject {
    self = [self init];
    if (self) {
        self.name    = [parseObject objectForKey:@"name"];
        self.summary = [parseObject objectForKey:@"summary"];
        self.rating  = [parseObject objectForKey:@"rating"];
        self.website = [parseObject objectForKey:@"website"];
        self.address = [parseObject objectForKey:@"address"];
    }
    return self;
}

+ (void)barWithID:(NSString *)_id completion:(void (^)(Mi9Bar *bar, NSError* error))completionBlock {
    PFQuery *query = [PFQuery queryWithClassName:[self parseClassName]];
    
    [query getObjectInBackgroundWithId:_id
                                 block:^(PFObject *object, NSError *error) {
        Mi9Bar* bar = [[self alloc] initWithPFObject:object];
        completionBlock(bar, error);
    }];
}

- (void)saveInBackground {
    PFObject *bar = [PFObject objectWithClassName:[[self class] parseClassName]];
    
    [bar setObject:self.name  forKey:@"name"];
    [bar setObject:self.summary forKey:@"summary"];
    [bar setObject:self.rating forKey:@"rating"];
    [bar setObject:self.website forKey:@"website"];
    [bar setObject:self.address forKey:@"address"];
    
    [bar saveInBackground];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<Mi9Bar name:\"%@\" summary:\"%@\" rating:\"%@\" website:\"%@\" address:\"%@\">", self.name, self.summary, self.rating, self.website, self.address];
}

@end
