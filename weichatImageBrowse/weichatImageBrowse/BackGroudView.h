//
//  BackGroudView.h
//  点击图片放大demo
//
//  Created by caijiamu on 16/6/22.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYImage/YYImage.h>
typedef NS_ENUM(NSInteger,JMPhotoBrowerType)
{
    JMPhotoBroweDefault = 0,//URL模式
    JMPhotoBrowerImage //image模式
};

@interface BackGroudView : UIView

/**
 *  初始化
 *  @param sourceArr  图片源
 *  @param type       模式类型
 *  @param imageIndex 图片下标
 */
-(instancetype)initWithDataSourceArr:(NSArray *)sourceArr sourceType:(JMPhotoBrowerType)type  imageIndex:(NSInteger)imageIndex singleTapGestureRecognizer:(UITapGestureRecognizer *)singleTapGestureRecognizer;
@end


@interface ZBPhotoBrowserCell : UICollectionViewCell
/**
 * 图片
 */
@property (nonatomic, strong) YYAnimatedImageView *imageView;
@property (nonatomic, strong) UIScrollView *containScrollView;
@property(strong,nonatomic) UITapGestureRecognizer *doubleTapGesture;

@end