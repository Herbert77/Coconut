//
//  CollectionViewCell_Template.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "HCY_CoconutCollectionViewCell.h"

@interface HCY_CoconutCollectionViewCell () 
@property (strong, nonatomic) UILabel *fruitNameLabel;
@property (strong, nonatomic) UIImageView *fruitImageV;
@property (strong, nonatomic) UITextField *inputTextField;

@end

@implementation HCY_CoconutCollectionViewCell

#pragma mark - Bind Data
- (void)bindDataWithViewModel:(HCY_CoconutCollectionCellViewModel *)viewModel {
    
    
}

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self addSubviews];
        [self setLayout];
    }
    return self;
}

- (void)addSubviews {
    
    [self.contentView addSubview:self.fruitNameLabel];
    [self.contentView addSubview:self.fruitImageV];
    [self.contentView addSubview:self.inputTextField];
}

- (void)setLayout {
    
    [self.fruitNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {<#constraint#>}];
    [self.fruitImageV mas_makeConstraints:^(MASConstraintMaker *make) {<#constraint#>}];
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {<#constraint#>}];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - Getter
- (UILabel *)fruitNameLabel {
    if (!_fruitNameLabel) {
        _fruitNameLabel = [[UILabel alloc] init];
        [_fruitNameLabel setTextColor:[UIColor blackColor]];
        [_fruitNameLabel setFont:[UIFont systemFontOfSize:16]];
        [_fruitNameLabel setTextAlignment:NSTextAlignmentCenter];
        [_fruitNameLabel setNumberOfLines:0];
        [_fruitNameLabel sizeToFit];
    }
    return _fruitNameLabel;
}
- (UIImageView *)fruitImageV {
    if (!_fruitImageV) {
        _fruitImageV = [[UIImageView alloc] init];
	[_@clipbboard setClipsToBounds:YES];
        [_fruitImageV setUserInteractionEnabled:NO];
	[_fruitImageV setContentMode:UIViewContentModeScaleAspectFill];
    }
    return _fruitImageV;
}
- (UITextField *)inputTextField {
    if (!_inputTextField) {
        _inputTextField = [[UITextField alloc] init];
        [_inputTextField setPlaceholder:@"请输入文本"];
        [_inputTextField setFont:[UIFont systemFontOfSize:16]];
        [_inputTextField setKeyboardType:UIKeyboardTypeDefault];
        [_inputTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_inputTextField setClearsOnBeginEditing:NO];
        [_inputTextField setTextAlignment:NSTextAlignmentLeft];
        [_inputTextField setReturnKeyType:UIReturnKeyDone];
        [_inputTextField setDelegate:self];
    }
    return _inputTextField;
}

@end
