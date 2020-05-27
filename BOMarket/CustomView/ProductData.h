//
//  ProductData.h
//  BOMarket
//
//  Created by imac 2015 4k on 5/18/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductData : NSObject

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *ProductProductSaleOff;
@property (strong, nonatomic) NSString *ProductName;
@property (strong, nonatomic) NSString *ProductPrice;
@property (strong, nonatomic) UIImageView *ProductLogo;

@end

NS_ASSUME_NONNULL_END
