//
//  CollectionViewCell_Template.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "<#Unit#>CollectionViewCell.h"

@interface <#Unit#>CollectionViewCell () <#usedDelegateInCell#>
<#propertyInCell#>
@end

@implementation <#Unit#>CollectionViewCell

#pragma mark - Bind Data
- (void)bindDataWithViewModel:(<#Unit#>CollectionCellViewModel *)viewModel {
    
    
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
    <#addViewsInCell#>
}

- (void)setLayout {
    <#setLayoutInCell#>
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - Getter
<#getterMethodsInCell#>
@end
