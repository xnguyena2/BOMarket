//
//  BeerItemController.m
//  BOMarket
//
//  Created by imac 2015 4k on 5/11/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import "BeerItemController.h"


@interface BeerItemController ()

@property (weak, nonatomic) IBOutlet UIImageView *ProductLogo;

@property (weak, nonatomic) IBOutlet UILabel *ProductSaleOff;

@property (weak, nonatomic) IBOutlet UILabel *ProductName;

@property (weak, nonatomic) IBOutlet UILabel *ProductPrice;


@end


@implementation BeerItemController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
    UIView* view = [self loadView];
    view.frame = self.bounds;
    [self addSubview:view];
}

-(UIView*) loadView{
    NSBundle* bundel = [NSBundle bundleForClass:[self class]];
    UINib* uinib = [UINib nibWithNibName:@"BeerItem" bundle:bundel];
    return [[uinib instantiateWithOwner:self options:nil] firstObject];
}

-(void) UpdateWidth:(float)height{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:150];
    [self addConstraints:@[widthConstraint]];
}

@end
