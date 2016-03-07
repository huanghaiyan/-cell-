//
//  ViewController.m
//  Layout4CustemCell
//
//  Created by 斯菲尔 on 15/8/6.
//  Copyright (c) 2015年 斯菲尔物流股份. All rights reserved.
//


/**
 *  autolayout设置cell自适应高度
 1.自定义cell,约束内部控件，约束内容可变的label的时候制约是四周即可，cell底部的控件 至少有一个添加距离cell底部固定距离的约束（关键）
 2.设置内容可变的内部label的行数为0（容易忘记）
 3.在自定义的cell类中重写layoutSubviews方法，并且设置内容可变的label的preferredMaxLayoutWidth属性为该label的宽度
 4.在tableView设置高度的数据源方法中，创建临时的cell，并给内部空间赋值（只给可变高度的label赋值应该也可以，因为其他控件的高度已经约束为固定的了，你可以试试），并调用cell的layoutIfNeeded方法
 5.最后调用cell contentView的systemLayoutSizeFittingSize方法得到cell高度
 */

#import "ViewController.h"
#import "CustemCell.h"


static NSString *identify = @"identify";

static NSString *cellTitle = @"测试标题";
static NSString *cellContent = @"这是一2015年8月6日报道，Kevin Richardson从来没有像现在这样难过，他最爱的那头狮子，津巴布韦草原上的绝对王者Cecil，被一个美国牙医猎杀了。美国牙医的那一枪，价值5万美刀。在那一天，他不是世界著名的“狮语者”，他只是陷入愤怒与声讨的人群其中的一个情详情详情这是一2015年8月6日报道，Kevin Richardson从来没有像现在这样难过，他最爱的那头狮子，津巴布韦草原上的绝对王者Cecil，被一个美国牙医猎杀了。美国牙医的那一枪，价值5万美刀。在那一天，他不是世界著名的“狮语者”，他只是陷入愤怒与声讨的人群其中的一个情详情详情";
static NSString *detaile = @"详情详情详情详情详情详情详情详情详情详情详情";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CustemCell class] forCellReuseIdentifier:identify];
}


#pragma mark -
#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustemCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    cell.titleLabel.text = cellTitle;
    cell.contentLabel.text = cellContent;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustemCell *tmpCell = [tableView dequeueReusableCellWithIdentifier:identify];
    tmpCell.titleLabel.text = cellTitle;
    tmpCell.contentLabel.text = cellContent;
    
    // 设置cell这个属性，内容改变时自动调用layoutSubviews方法
    [tmpCell layoutIfNeeded];
    
    CGFloat height = [tmpCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    return height + 1;
}

@end
