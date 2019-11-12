//
//  BADGEViewController.m
//  BadgeView
//
//  Created by binzicoder on 11/12/2019.
//  Copyright (c) 2019 binzicoder. All rights reserved.
//

#import "BADGEViewController.h"
#import "UIView+BadgeView.h"
@interface BADGEViewController ()

@end
static CGFloat const kWidthHeight = 100;
@implementation BADGEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor cyanColor];
    button1.tag = 100;
    button1.frame = CGRectMake(50, 90, kWidthHeight, kWidthHeight);
    [button1 showBadgeWithStyle:CustomImageBadgeStyle value:0];
    button1.badgeBackgroundImageView.frame = CGRectMake(CGRectGetWidth(button1.frame), -(CGRectGetHeight(button1.frame)/6)/2, CGRectGetWidth(button1.frame)/6, CGRectGetHeight(button1.frame)/6);
    button1.badgeBackgroundImageView.layer.borderColor = [UIColor redColor].CGColor;
    button1.badgeBackgroundImageView.layer.borderWidth = 2;
    [button1.badgeBackgroundImageView setImage:[UIImage imageNamed:@"reset"]];
    [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor brownColor];
    button2.frame = CGRectMake(50, CGRectGetMaxY(button1.frame)+80, kWidthHeight, kWidthHeight);
    [button2 showBadgeWithStyle:RedDotBadgeStyle value:0];
    button2.tag = 101;
    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.backgroundColor = [UIColor orangeColor];
    button3.frame = CGRectMake(50, CGRectGetMaxY(button2.frame)+80, kWidthHeight, kWidthHeight);
    [button3 showBadgeWithStyle:NumberBadgeStyle value:90];
    button3.badgeMaximumBadgeNumber = 99;
    button3.badgeFont = [UIFont systemFontOfSize:8];
    button3.badgeBgColor = [UIColor purpleColor];
    button3.tag = 102;
    [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    // Do any additional setup after loading the view.
}
- (void)buttonClick:(UIButton *)button
{
    switch (button.tag) {
        case 100:
        {
            button.selected = !button.isSelected;
            if (button.selected) {
                [button.badgeBackgroundImageView setImage:[UIImage imageNamed:@"select"]];
            }else{
                [button.badgeBackgroundImageView setImage:[UIImage imageNamed:@"reset"]];
            }
        }
            break;
        case 101:
        {
            CGRect rect = button.badgeFrame;
            rect.size.width +=1;
            rect.size.height+=1;
            rect.origin.x = CGRectGetWidth(button.frame);
            rect.origin.y = -  CGRectGetHeight(rect)/2;
            button.badgeFrame = rect;
            button.badgeRadius = CGRectGetWidth(rect)/2;
        }
            break;
        case 102:
        {
            NSInteger count =  [button.badge.text integerValue];
            count++;
            button.badge.text = [NSString stringWithFormat:@"%zd",count];
        }
            
            break;
            
        default:
            break;
    }
    
    
    
}

@end
