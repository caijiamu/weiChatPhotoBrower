//
//  JMWeiChatPhotoBrower.m
//  点击图片放大demo
//
//  Created by caijiamu on 16/6/22.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import "JMWeiChatPhotoBrower.h"
#import "BackGroudView.h"
@implementation JMWeiChatPhotoBrower
+(void)showImage:(NSArray *)imageArray photoBrowerType:(JMPhotoBrowerType)type index:(NSInteger)index
{
    //单击手势
    UITapGestureRecognizer *singleTapGestureRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    BackGroudView *backGroudView = [[BackGroudView alloc]initWithDataSourceArr:imageArray sourceType:type imageIndex:index singleTapGestureRecognizer:(UITapGestureRecognizer *)singleTapGestureRecognizer];
    backGroudView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    backGroudView.frame=[backGroudView convertRect:backGroudView.bounds toView:window];

    [backGroudView addGestureRecognizer: singleTapGestureRecognizer];

    [window addSubview:backGroudView];
}

+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    [UIView animateWithDuration:0.3 animations:^{
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}
@end
