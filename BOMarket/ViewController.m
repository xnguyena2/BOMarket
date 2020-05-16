//
//  ViewController.m
//  BOMarket
//
//  Created by imac 2015 4k on 5/10/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import "ViewController.h"
#import "BeerItemController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *Search;

@property (weak, nonatomic) IBOutlet UILabel *OrderLabel;

@property (weak, nonatomic) IBOutlet UIView *AdsContainer;

@property (weak, nonatomic) IBOutlet UIStackView *FlashSale;

@end

@implementation ViewController

- (void)setupUI{
    
    [self AdsContainer].layer.borderWidth = 0.3;
    [self AdsContainer].layer.borderColor = UIColor.grayColor.CGColor;
    [self AdsContainer].layer.masksToBounds = true;
    [self AdsContainer].layer.cornerRadius = 5.0;
    
    [self OrderLabel].layer.masksToBounds = true;
    [self OrderLabel].layer.cornerRadius = 10.0;
    
    [self Search].delegate = self;
    
    [self addProductToFlashSale];
}

- (void) addProductToFlashSale{
    NSLog(@"add beer");
    BeerItemController *beer = [[BeerItemController alloc] init];
    [beer UpdateWidth:100];
    BeerItemController *beer1 = [[BeerItemController alloc] init];
    [beer1 UpdateWidth:100];
    BeerItemController *beer2 = [[BeerItemController alloc] init];
    [beer2 UpdateWidth:100];
    BeerItemController *beer3 = [[BeerItemController alloc] init];
    [beer3 UpdateWidth:100];
    BeerItemController *beer4 = [[BeerItemController alloc] init];
    [beer4 UpdateWidth:100];
    BeerItemController *beer5 = [[BeerItemController alloc] init];
    [beer5 UpdateWidth:100];
    
    
    [[self FlashSale] addArrangedSubview:beer];
    [[self FlashSale] addArrangedSubview:beer1];
    [[self FlashSale] addArrangedSubview:beer2];
    [[self FlashSale] addArrangedSubview:beer3];
    [[self FlashSale] addArrangedSubview:beer4];
    [[self FlashSale] addArrangedSubview:beer5];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%@", [NSString stringWithFormat:@"Search with txt: %@", searchBar.text]);
}

@end
