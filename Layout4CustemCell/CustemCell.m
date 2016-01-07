//
//  CustemCell.m
//  Layout4CustemCell
//
//  Created by 斯菲尔 on 15/8/6.
//  Copyright (c) 2015年 斯菲尔物流股份. All rights reserved.
//

#import "CustemCell.h"

@implementation CustemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"CustemCell" owner:nil options:nil]lastObject];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置label的这个属性，自动调整高度
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.frame);
}

@end
