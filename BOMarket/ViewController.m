//
//  ViewController.m
//  BOMarket
//
//  Created by imac 2015 4k on 5/10/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *Search;

@property (weak, nonatomic) IBOutlet UILabel *OrderLabel;

@property (weak, nonatomic) IBOutlet UIView *AdsContainer;

@property (weak, nonatomic) IBOutlet UIStackView *FlashSale;

@property (weak, nonatomic) IBOutlet UICollectionView *AllProductContainer;

@property (strong, nonatomic) AllProductionCollectionView *allProduct;

@end

@implementation ViewController


- (void)setupUI{
    self.allProduct = [[AllProductionCollectionView alloc] init];
    [[self allProduct] LoadData];
    
    [self AdsContainer].layer.borderWidth = 0.3;
    [self AdsContainer].layer.borderColor = UIColor.grayColor.CGColor;
    [self AdsContainer].layer.masksToBounds = true;
    [self AdsContainer].layer.cornerRadius = 5.0;
    
    [self OrderLabel].layer.masksToBounds = true;
    [self OrderLabel].layer.cornerRadius = 10.0;
    
    [self Search].delegate = self;
    
    [self AllProductContainer].delegate = [self allProduct];
    [self AllProductContainer].dataSource = [self allProduct];
    [[self AllProductContainer] registerClass:[BeerCollectionViewCell class] forCellWithReuseIdentifier:@"BeerCell"];
    
    [self addProductToFlashSale];
}

- (void) addProductToFlashSale{
    NSLog(@"add beer");
    BeerItemController *beer = [[BeerItemController alloc] init];
    [beer UpdateWidth:100];
    
    
    [[self FlashSale] addArrangedSubview:beer];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(theAction)
                                   userInfo:nil
                                    repeats:NO];
}

-(void) theAction {
    NSLog(@"Will appear after a 2 second delay.");
    BeerItemController *beer = [[BeerItemController alloc] init];
    ProductData *p8 = [[ProductData alloc] init];
    p8.ID = @"8";
    p8.ProductName = @"Bia 8";
    p8.ProductPrice = @"133.0";
    p8.ProductProductSaleOff = @"15.9%";
    [beer SetData:p8];
    [beer UpdateWidth:100];
    [[self FlashSale] addArrangedSubview:beer];
    /*
    [[self AllProductContainer] performBatchUpdates:^{
        [array addObject:@"llllll"];
        [[self AllProductContainer] insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:array.count-1
                                                                                                        inSection:0]]];
    } completion:nil];
     */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [self initArray];
    [self setupUI];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%@", [NSString stringWithFormat:@"Search with txt: %@", searchBar.text]);
}

@end
