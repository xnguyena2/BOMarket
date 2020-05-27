//
//  AllProductionCollectionView.m
//  BOMarket
//
//  Created by imac 2015 4k on 5/18/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import "AllProductionCollectionView.h"


@implementation AllProductionCollectionView

- (void)LoadData{
    
    ProductData *p1 = [[ProductData alloc] init];
    p1.ID = @"1";
    p1.ProductName = @"Bia 1";
        
    ProductData *p2 = [[ProductData alloc] init];
    p2.ID = @"2";
    p2.ProductName = @"Bia 2";
        
    ProductData *p3 = [[ProductData alloc] init];
    p3.ID = @"3";
    p3.ProductName = @"Bia 3";
        
    ProductData *p4 = [[ProductData alloc] init];
    p4.ID = @"4";
    p4.ProductName = @"Bia 4";
        
    ProductData *p5 = [[ProductData alloc] init];
    p5.ID = @"5";
    p5.ProductName = @"Bia 5";
        
    ProductData *p6 = [[ProductData alloc] init];
    p6.ID = @"6";
    p6.ProductName = @"Bia 6";
        
    ProductData *p7 = [[ProductData alloc] init];
    p7.ID = @"7";
    p7.ProductName = @"Bia 7";
        
    ProductData *p8 = [[ProductData alloc] init];
    p8.ID = @"8";
    p8.ProductName = @"Bia 8";
    p8.ProductPrice = @"133.0";
    p8.ProductProductSaleOff = @"15.9%";
    self.Product = [[NSMutableArray alloc] initWithObjects:p1, p2, p3, p4, p5, p6, p7, p8, nil];
    NSLog(@"Load Data");
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([collectionView frame].size.width/3.2, [collectionView frame].size.width/3.2);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%lu", (unsigned long)[self Product].count);
    return [self Product].count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"BeerCell";

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    BeerCollectionViewCell *beer = (BeerCollectionViewCell *)cell;
    
    /*
    if([beer GetProductName] == nil || [[beer GetProductName]  isEqual: @"Product Name"]){
        
        [beer SetProductName:self.array[indexPath.item]];
    }
    */
    
    [beer SetData:self.Product[indexPath.item]];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Selected item: %ld", indexPath.item);
    NSLog(@"%@",[self.Product[indexPath.item] ID]);
}

@end
