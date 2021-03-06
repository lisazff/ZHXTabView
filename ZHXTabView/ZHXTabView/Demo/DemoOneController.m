//
//  DemoOneController.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/5/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "DemoOneController.h"
#import "ZHXTabView.h"

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height
@interface DemoOneController ()<ZHXTabViewDelegate>
@property (nonatomic, strong) ZHXTabView *firstTabView;
@property (nonatomic, strong) UILabel *firstTitleLB;
@property (nonatomic, strong) UILabel *firstResultLB;
@property (nonatomic, strong) UILabel *firstIndexLB;
@end

@implementation DemoOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Basic Usage";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addFirstDemo];
}
- (void)addFirstDemo{
    NSArray *titles = @[@"Asian",@"Europe",@"America",@"Africa"];
    self.firstTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.firstTabView];
    self.firstTabView.frame = CGRectMake(20, 150, ScreenWidth -40, 50);
    self.firstTabView.delegate = self;
    self.firstTabView.leftPadding = 10;
    self.firstTabView.rightPadding = 10;
    self.firstTabView.itemLineColor = [UIColor blueColor];
    self.firstTabView.itemSelectedTextColor = [UIColor blueColor];
    
  
    
    self.firstResultLB = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.firstTabView.frame)+10, 100, 60)];
    [self.view addSubview:self.firstResultLB];
    self.firstResultLB.textAlignment = NSTextAlignmentRight;
    self.firstResultLB.font = [UIFont systemFontOfSize:14];
    self.firstResultLB.textColor = [UIColor blackColor];
    self.firstResultLB.text = @"result is : ";
    
    
    self.firstIndexLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.firstResultLB.frame), CGRectGetMaxY(self.firstTabView.frame)+10, 35, 60)];
    [self.view addSubview:self.firstIndexLB];
    self.firstIndexLB.textAlignment = NSTextAlignmentLeft;
    self.firstIndexLB.font = [UIFont boldSystemFontOfSize:20];
    self.firstIndexLB.textColor = [UIColor redColor];
    self.firstIndexLB.text = [NSString stringWithFormat:@"%d",0];
    
    
}

#pragma mark - ZHXTabViewDelegate
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
    if (tabView == self.firstTabView) {
        self.firstIndexLB.text = [NSString stringWithFormat:@"%ld",(long)index];
    }
}

@end
