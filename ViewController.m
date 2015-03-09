//
//  ViewController.m
//  UILabel常用属性与实现自适应
//
//  Created by 陈家庆 on 15-3-9.
//  Copyright (c) 2015年 shikee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationItem.title = @"UILabel常用属性与实现自适应";
    self.view.backgroundColor = [UIColor grayColor];
    
    /*
     *** 创建并初始化UILabel   等同于
     UILabel *label = [[UILabel alloc] init];
     label.frame = CGRectMake(10, 80, 250, 20);//坐标
     */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 250, 20)];
    
    //设置背景颜色
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //添加至父类视图中
    [self.view addSubview:label];
    
    /*
     *** 设置属性
     */
    label.text = @"label";//显示文字
    label.textColor = [UIColor purpleColor];//文字颜色
    
//    label.backgroundColor = [UIColor redColor];//框架背景颜色
//    label.textAlignment = NSTextAlignmentCenter;//文字对齐方式
    
//    label.shadowColor = [UIColor yellowColor];//设置阴影颜色
//    label.shadowOffset = CGSizeMake(3, 3);//设置阴影偏移量
    
//    label.highlighted = YES;//是否高亮，默认NO
//    label.highlightedTextColor = [UIColor greenColor];//字体高亮颜色
    
    /*  设置字体  */
    label.font = [UIFont boldSystemFontOfSize:20];//粗体
    label.font = [UIFont italicSystemFontOfSize:20];//斜体，设置斜体之后，粗体设置将没有效果
    //-----遍历系统文字库，设置字体
    NSArray *textNames = [UIFont familyNames];
    for (NSArray *name in textNames) {
        NSLog(@"字体：%@",name);
    }
    label.font = [UIFont fontWithName:@"Superclarendon" size:20];
    
    /*
     *** 实现UILabel自适应高宽
     */
    
    //1、获取text属性的文本内容；
    label.text = @"标签标签标签标签标签标签标签标签标签标签标签标签签标签标签标签标签标签标签标签标签标签标签标签标签标签签标签标签标签标签标签标签标签标签标签标签标签标签标签签标签标签标签标签标签标签标签标签标签标签标签标签标签签标签标签标签标签标签标签标签标签标签标签标签标签标签签标签标签标签标签标签标签标签标签标签标签标签标签标签签标签";
    
    //2、计算文本的空间；MAXFLOAT为无限大
    //---iOS6
    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(self.view.frame.size.width-20, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    //---iOS7以后
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: label.font} context:nil];
    
    //3、设置UILabel最大显示行数（＝0时不限制）；
    label.numberOfLines = 0;
    
    //4、用计算出来的CGSize/CGRect设置UILabel的frame。
    //iOS6
    label.frame = CGRectMake(label.frame.origin.x , label.frame.origin.y, size.width, size.height);
    //iOS7以后
    label.frame = CGRectMake(label.frame.origin.x , label.frame.origin.y, rect.size.width, rect.size.height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
