//
//  ViewController.m
//  weichatImageBrowse
//
//  Created by caijiamu on 16/6/22.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import "ViewController.h"
#import "JMWeiChatPhotoBrower.h"
#import <YYWebImage/UIImageView+YYWebImage.h>
#import "JMWeiChatPhotoBrower.h"
static NSString *const ID = @"cell";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) JMWeiChatPhotoBrower *chatPhotoBrower;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArr = @[@"http://files.mucaibang.cn/data/wood/android/picture1a6362fc787b4d8f8a1f17836d949d65.jpg",@"http://files.mucaibang.cn/data/wood/android/picture1156dbee9b434c14943659b519d74d32.jpg",@"http://files.mucaibang.cn/data/wood/android/picturee70304823f63495da4bfd3c1e7ab3ca8.jpg"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100,100);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)clickImageBrower:(UIButton *)button
{
    [JMWeiChatPhotoBrower showImage:_imageArr photoBrowerType:JMPhotoBroweDefault index:0];
}

#pragma mark - delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [imageView yy_setImageWithURL:[NSURL URLWithString:self.imageArr[indexPath.item]] placeholder:nil options:YYWebImageOptionProgressive completion:nil];
    [cell.contentView addSubview:imageView];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.item);
    [JMWeiChatPhotoBrower showImage:_imageArr photoBrowerType:JMPhotoBroweDefault index:indexPath.item];
    
}


@end
