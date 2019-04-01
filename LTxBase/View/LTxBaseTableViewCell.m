//
//  LTxBaseTableViewCell.m
//  DZNEmptyDataSet
//
//  Created by liangtong on 2019/4/1.
//

#import "LTxBaseTableViewCell.h"

@implementation LTxBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [LTxConfig sharedInstance].cellContentViewColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
