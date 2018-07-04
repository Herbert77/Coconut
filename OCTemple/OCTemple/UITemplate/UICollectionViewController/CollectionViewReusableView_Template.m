//
//  CollectionViewReusableView_Template.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "<#Unit#>HeaderCRView.h"

@interface <#Unit#>HeaderCRView () <#usedDelegateInCRView#>
<#propertyInCRView#>
@end

@implementation <#Unit#>HeaderCRView

#pragma mark - Bind Data
- (void)bindDataWithViewModel:(<#Unit#>HeaderCRViewViewModel *)viewModel {
    
    
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
    <#addViewsInCRView#>
}

- (void)setLayout {
    <#setLayoutInCRView#>
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - Getter
<#getterMethodsInCRView#>
@end
