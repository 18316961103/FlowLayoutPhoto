//
//  PhotoCell.m
//  FlowLayoutPhoto
//
//  Created by apple on 17/9/7.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;


@end

@implementation PhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImageName:(NSString *)imageName {
    
    _imageName = imageName;
    
    _photoImageView.image = [UIImage imageNamed:_imageName];
    
}

@end
