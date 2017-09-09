//
//  MJCDemoNewVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC1.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC1 ()<MJCSegmentDelegate>

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCSpecialDemoVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//循环创建控制器对象
        MJCTestTableViewController *vc = [[MJCTestTableViewController alloc]init];
        vc.title = titlesArr[i];
        [vcArr addObject:vc];
    }
    
    [self setupBasicUIWithTitlesArr:titlesArr vcArr:vcArr];
}

-(void)setupBasicUIWithTitlesArr:(NSArray*)titlesArr vcArr:(NSArray*)vcArr
{
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.titleBarStyles = MJCTitlesScrollStyle;
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.delegate= self;
    interFace.itemTextSelectedColor = [UIColor blueColor];
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemTextFontSize = 11;
    interFace.defaultShowItemCount = 5;
    interFace.childsContainerBackColor = [UIColor purpleColor];
    interFace.selectedSegmentIndex = 2;
    [interFace intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:interFace];
    [interFace intoChildControllerArray:vcArr];

}

-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    MJCTestTableViewController *vc = (MJCTestTableViewController *)childsController;
    NSMutableDictionary *dic =  _mainArr[tabItem.tag];
    [vc beginLoadNewData:dic];
}
    
-(void)mjc_scrollDidEndDeceleratingWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController indexPage:(NSInteger)indexPage segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    MJCTestTableViewController *vc = (MJCTestTableViewController *)childsController;
    NSMutableDictionary *dic =  _mainArr[tabItem.tag];
    [vc beginLoadNewData:dic];
}

@end
