//
//  CGECollectionViewCell.m
//  Challenger
//
//  Created by Sreenivas Appasani on 11/10/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGECollectionViewCell.h"

@interface CGECollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *cgeImgView;


@end

@implementation CGECollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UIImage *testImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://challengerapp-assets.s3.amazonaws.com/testLogo.png"]]];
    self.cgeImgView.image = testImg;
    [self.cgeImgView sizeToFit];
}

@end
