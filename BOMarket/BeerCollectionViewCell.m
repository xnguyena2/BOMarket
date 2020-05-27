//
//  BeerCollectionViewCell.m
//  BOMarket
//
//  Created by imac 2015 4k on 5/18/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import "BeerCollectionViewCell.h"

@implementation BeerCollectionViewCell

BeerItemController *b;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self commonInit];
    }
    return self;
}
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self){
        [self commonInit];
    }
    return self;
}

-(void) commonInit{
    BeerItemController *beer = [[BeerItemController alloc] init];
    b = beer;
    beer.frame = self.bounds;
    [[self contentView] addSubview:beer];
}


-(void) SetData:(ProductData*)data{
    [b SetData:data];
}

@end
