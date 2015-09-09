//
//  ViewController.m
//  FixedSizeConstraints
//
//  Created by Adusa on 15/9/9.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"
#import "ConstraintsHelper.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    UIBarButtonItem *goBar=[[UIBarButtonItem alloc]initWithTitle:@"Go" style:UIBarButtonItemStyleDone target:self action:@selector(go:)];
    self.navigationItem.rightBarButtonItem=goBar;
    
    [self createLabelWithTitle:@"View1" onParent:self.view];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UILabel *)createLabelWithTitle:(NSString *)title onParent:(UIView *)parentView
{
    UILabel *label=[[UILabel alloc]init];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=title;
    label.backgroundColor=[UIColor colorWithRed:0.694 green:0.894 blue:0.702 alpha:1];
    [parentView addSubview:label];
    label.translatesAutoresizingMaskIntoConstraints=NO;
    
    [label constrainWithinSuperviewBounds];
    [label constrainSize:CGSizeMake(100, 100)];
    [label constrainPosition:CGPointMake(50, 50)];
    return label;
}


-(void)go:(UIBarButtonItem*)item
{
    [self logSubviews];
}

-(void)logSubviews
{
    for (UIView *subview in self.view.subviews) {
        NSLog(@"View(%lu)location:%@",(unsigned long)[self.view.subviews indexOfObject:subview],NSStringFromCGRect(subview.frame));
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
