//
//  MJCDemoVC9.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC7.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC7 ()

@end

@implementation MJCDemoVC7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }

    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_indicatorStyles(MJCIndicatorItemStyle).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
        jc_itemEdgeinsets(MJCEdgeInsetsMake(5,5,5,5,25)).
        jc_itemSelectedSegmentIndex(3).
        jc_ItemDefaultShowCount(4).
        jc_indicatorFollowEnabled(YES).
        jc_titlesViewBackColor([UIColor whiteColor]).
        jc_indicatorColor([UIColor redColor]).
        jc_itemTextFontSize(13).
        jc_childScollAnimalEnabled(YES).
        jc_itemBackImageNormal([MJCCommonTools jc_imageWithColor:[UIColor yellowColor]]).
        jc_itemBackImageSelected([MJCCommonTools jc_imageWithColor:[UIColor blueColor]]);
    }];

    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.tools = tools;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];

    
}


@end
