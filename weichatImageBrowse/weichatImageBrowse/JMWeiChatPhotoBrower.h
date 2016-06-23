//
//  JMWeiChatPhotoBrower.h
//  点击图片放大demo
//
//  Created by caijiamu on 16/6/22.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BackGroudView.h"

@interface JMWeiChatPhotoBrower : NSObject
/**
 *  初始化
 *  @param imageArray 图片源
 *  @param type       图片类型
 *  @param index      图片下标
 */
+(void)showImage:(NSArray *)imageArray photoBrowerType:(JMPhotoBrowerType)type index:(NSInteger)index;


@end
