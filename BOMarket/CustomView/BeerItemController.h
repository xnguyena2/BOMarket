//
//  BeerItemController.h
//  BOMarket
//
//  Created by imac 2015 4k on 5/11/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductData.h"

NS_ASSUME_NONNULL_BEGIN


@interface BeerItemController : UIView

-(void) UpdateWidth:(float)height;

-(void) SetData:(ProductData*)data;

@end

NS_ASSUME_NONNULL_END
