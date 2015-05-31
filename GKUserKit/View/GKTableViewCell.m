//
//  GKTableViewCell.m
//  GKUserKitExample
//
//  Created by 小悟空 on 5/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation GKTableViewCell

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self setupTitleLabel];
    [self setupInputTextField];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setupTitleLabel
{
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.width.equalTo(@85);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}

- (void)setupInputTextField
{
    self.inputTextField = [[UITextField alloc] init];
    [self.contentView addSubview:self.inputTextField];
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@100);
        make.trailing.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
