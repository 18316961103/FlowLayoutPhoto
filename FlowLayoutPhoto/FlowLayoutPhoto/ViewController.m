//
//  ViewController.m
//  FlowLayoutPhoto
//
//  Created by apple on 17/9/7.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "FlowLayout.h"

/*  屏幕宽度   */
#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController

static NSString *const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 创建流水布局
    UICollectionViewFlowLayout *layout = [self setupFlowLayout];
    
    // 创建UICollectionView
    [self setupCollectionView:layout];
    
    
}

#pragma mark - 创建流水布局
- (UICollectionViewFlowLayout *)setupFlowLayout {
    // 创建流水布局
    FlowLayout *layout = [[FlowLayout alloc] init];
    // 修改item的尺寸
    layout.itemSize = CGSizeMake(180, 180);
    // 修改collectionView的滑动方向，默认垂直方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 修改行间距
    layout.minimumLineSpacing = 10;
    // 修改左右两边的间距
    layout.sectionInset = UIEdgeInsetsMake(0, 100, 0, 100);
    
    return layout;
}

#pragma mark - 创建UICollectionView
- (void)setupCollectionView:(UICollectionViewFlowLayout *)layout {
    // 创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 250) collectionViewLayout:layout];
    
    collectionView.backgroundColor = [UIColor greenColor];
    collectionView.center = self.view.center;
    // 隐藏滚动条
    collectionView.showsHorizontalScrollIndicator = NO;
    
    collectionView.dataSource = self;
    
    // 注册Cell
    //    [collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:ID];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collectionView];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.imageName = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
