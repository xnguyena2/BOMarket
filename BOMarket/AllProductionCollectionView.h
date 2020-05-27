//
//  AllProductionCollectionView.h
//  BOMarket
//
//  Created by imac 2015 4k on 5/18/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeerCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllProductionCollectionView : UIViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *Product;

-(void)LoadData;

@end

NS_ASSUME_NONNULL_END
