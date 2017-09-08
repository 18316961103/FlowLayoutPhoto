//
//  FlowLayout.m
//  FlowLayoutPhoto
//
//  Created by apple on 17/9/7.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "FlowLayout.h"

/*
    自定义流水布局：只需要了解五个方法,这五个必须调用父类的方法，苹果要求
 */

@implementation FlowLayout


/**
 什么时候调用：collectionView第一次布局，collectionView刷新的时候也会调用
 作用：计算cell的布局，条件：cell的位置固定不变
 */
//- (void)prepareLayout {
//    [super prepareLayout];
//    NSLog(@"%s",__func__);
//}


/**
 UICollectionViewLayoutAttributes：确定cell的尺寸
 一个UICollectionViewLayoutAttributes对象就对应一个cell
 拿到UICollectionViewLayoutAttributes相当于拿到cell
 */
// 作用：指定一段区域给你这段区域内cell的尺寸
// 可以一次性返回所有cell的尺寸，也可以每隔一个距离返回cell
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    // 获取当前显示cell的布局
    NSArray *attrs = [super layoutAttributesForElementsInRect:self.collectionView.bounds];

    for (int i = 0; i < attrs.count; i++) {
        
        UICollectionViewLayoutAttributes *attr = attrs[i];
        
        // 计算cell与中心点的距离，求绝对值，越靠近中心店，距离越小，缩放越大
        CGFloat distance = fabs((attr.center.x - self.collectionView.contentOffset.x) - self.collectionView.bounds.size.width * 0.5);
        
        // 计算比例，离中心越近，放大的比例就要越大，所以求反比
        CGFloat scale = 1 - distance / (self.collectionView.bounds.size.width * 0.5) * 0.35;
        
        attr.transform = CGAffineTransformMakeScale(scale, scale);
        
    }
    
    return attrs;
}

// 计算collectionView的滑动范围
//- (CGSize)collectionViewContentSize {
//    return [super collectionViewContentSize];
//}


// Invalidate：刷新
// 在滚动的时候是否允许刷新布局，默认是否
// 现在我们需要在滑动的时候，cell可以放大缩小，所以需要设置为yes
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
//    return [super shouldInvalidateLayoutForBoundsChange:newBounds];
}


/**
 什么时候调用：用户手指一松开就会调用
 作用：确定最终偏移量
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 拖动比较快时 最终偏移量 不等于 手指离开时偏移量，因为会有缓冲
    
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
}
@end
