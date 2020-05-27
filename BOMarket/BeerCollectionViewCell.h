//
//  BeerCollectionViewCell.h
//  BOMarket
//
//  Created by imac 2015 4k on 5/18/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeerItemController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerCollectionViewCell : UICollectionViewCell

-(void) SetData:(ProductData*)data;

@end

NS_ASSUME_NONNULL_END
