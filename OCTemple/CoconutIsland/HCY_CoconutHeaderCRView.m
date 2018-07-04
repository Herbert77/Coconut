//
//  CollectionViewReusableView_Template.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "HCY_CoconutHeaderCRView.h"

@interface HCY_CoconutHeaderCRView () 
@property (strong, nonatomic) UILabel *userNameLabel;

@end

@implementation HCY_CoconutHeaderCRView

#pragma mark - Bind Data
- (void)bindDataWithViewModel:(HCY_CoconutHeaderCRViewViewModel *)viewModel {
    
    
}

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubviews];
        [self setLayout];
    }
    return self;
}

- (void)addSubviews {
    
    [self.contentView addSubview:self.userNameLabel];
}

- (void)setLayout {
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {<#constraint#>}];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - Getter
- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        [_userNameLabel setTextColor:[UIColor blackColor]];
        [_userNameLabel setFont:[UIFont systemFontOfSize:16]];
        [_userNameLabel setTextAlignment:NSTextAlignmentCenter];
        [_userNameLabel setNumberOfLines:0];
        [_userNameLabel sizeToFit];
    }
    return _userNameLabel;
}

@end
