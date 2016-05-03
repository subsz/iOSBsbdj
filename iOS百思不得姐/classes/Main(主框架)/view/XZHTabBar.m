//
//  XZHTabBar.m
//  XZH百思
//
//  Created by xuzhenhao on 16/4/15.
//  Copyright © 2016年 xuzhenhao. All rights reserved.
//

#import "XZHTabBar.h"
@interface XZHTabBar()
@property(nonatomic,weak)UIButton *pubBtn;
@end
@implementation XZHTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        //创建发布按钮
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置图片
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        //设置大小
        [publishBtn sizeToFit];
        //添加到tabBar中
        [self addSubview:publishBtn];
        self.pubBtn = publishBtn;
    }
  
    return self;
    
}

#pragma mark -布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    //tabbar中有很多其他控件，所以必须进行过滤
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width / 5;
    CGFloat btnH = self.bounds.size.height;
    //self.subViews是无序的,发布按钮直接布局
    self.pubBtn.center = CGPointMake(self.bounds.size.width/2, btnH/2);
    
    int index = 0;
    for (UIView *btn in self.subviews) {
        if (![btn isKindOfClass:[UIControl class]]||btn==self.pubBtn) {
            continue;
        }
            index = index ==2?index+1:index;
            btn.frame = CGRectMake(index*btnW, 0, btnW, btnH);
            index++;
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
