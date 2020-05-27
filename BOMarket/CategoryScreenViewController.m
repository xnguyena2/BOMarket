//
//  CategoryScreenViewController.m
//  BOMarket
//
//  Created by imac 2015 4k on 5/20/20.
//  Copyright © 2020 Buffchalo. All rights reserved.
//

#import "CategoryScreenViewController.h"

@interface CategoryScreenViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@property (weak, nonatomic) IBOutlet UISearchBar *Search;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *SearchTrailing;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeaderHeight;

@property (weak, nonatomic) IBOutlet UIImageView *TopLogo;

@end

@implementation CategoryScreenViewController

CGFloat const AllowOffset = 5;
CGFloat const SearchBarHeight = 56;
CGFloat const HeaderMaxHeight = 107;
CGFloat const DirectionHold = 0;
CGFloat start = 0;
CGFloat currentHeight = 0;
bool affect = true;
bool alredyTop = false;
bool alredyBottom = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self ScrollView].delegate = self;
    // Do any additional setup after loading the view.
    [self.Search setBackgroundImage:[[UIImage alloc]init]];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y - start;
    NSLog(@"Scroll: %f, offset: %f", scrollView.contentOffset.y, offset);
    NSLog(@"%@", affect ? @"YES" : @"NO");
    bool haveUpdate = false;
    //scroll up when in top
    if(affect &&
       scrollView.contentOffset.y>0 &&//must sure user in positive position
       offset > 0 &&// directly is up
       !alredyTop//if not alredy up
       ){
        if(alredyBottom){
            alredyBottom = false;
            currentHeight = self.HeaderHeight.constant;
        }
        if(start<0){
            offset = scrollView.contentOffset.y;
        }
       if(currentHeight - offset < SearchBarHeight){
           offset = currentHeight - SearchBarHeight;
           alredyTop = true;
           //affect = false;
       }
       NSLog(@"offset up: %f", offset);
        haveUpdate = true;
       //[scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
       //trigger start
    }else if(affect &&
             scrollView.contentOffset.y<0 &&//must sure user in nagative position
             offset < 0 &&
             !alredyBottom//if not alredy down
             ){
        if(alredyTop){
            alredyTop = false;
            currentHeight = self.HeaderHeight.constant;
        }
        if(start > 0){
            offset = scrollView.contentOffset.y;
        }
        if (currentHeight - offset > HeaderMaxHeight){
            offset = currentHeight - HeaderMaxHeight;
            alredyBottom = true;
        }
        NSLog(@"current height: %f, offset down: %f", currentHeight, offset);
        haveUpdate = true;
    }
    if(haveUpdate){
        self.HeaderHeight.constant = currentHeight - offset;
        self.SearchTrailing.constant = HeaderMaxHeight - (currentHeight - offset);
        [[self TopLogo] setAlpha:(currentHeight - offset - SearchBarHeight)/(HeaderMaxHeight-SearchBarHeight)];
    }
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"finisheddddddddddd    %f, %f", scrollView.contentOffset.y, self.HeaderHeight.constant);
    if(self.HeaderHeight.constant<SearchBarHeight + AllowOffset){
        affect = false;
        alredyBottom = false;
        alredyTop=true;
        [self.view layoutIfNeeded];
        [UIView animateWithDuration:0.1 animations:^{
            self.HeaderHeight.constant = SearchBarHeight;
            self.SearchTrailing.constant = HeaderMaxHeight - SearchBarHeight;
            [[self TopLogo] setAlpha:0];
            [self.view layoutIfNeeded];
        }];
    }else{
        affect = false;
        alredyBottom = true;
        alredyTop=false;
        [self.view layoutIfNeeded];
        [UIView animateWithDuration:0.1 animations:^{
            self.HeaderHeight.constant = HeaderMaxHeight;
            self.SearchTrailing.constant = 0;
            [[self TopLogo] setAlpha:1];

            [self.view layoutIfNeeded];
        }];
    }
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"End---------");
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    affect = true;
    currentHeight = self.HeaderHeight.constant;
    start = scrollView.contentOffset.y;
    NSLog(@"Begin---------, %f", start);
}

@end
