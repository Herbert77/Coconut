//
//  TableViewCell.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/6/29.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "<#Unit#>Cell.h"

@interface <#Unit#>Cell () <#usedDelegateInCell#>
<#propertyInCell#>
@end

@implementation <#Unit#>Cell

#pragma mark - Bind Data
- (void)bindDataWithViewModel:(<#Unit#>CellViewModel *)viewModel {
    
    
}

#pragma mark - Life Cycle
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    NSString * identifier = NSStringFromClass([<#Unit#>Cell class]);
    <#Unit#>Cell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[<#Unit#>Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
        [self setLayout];
    }
    return self;
}

- (void)setupSubviews {
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
#pragma mark - Class Method
+ (CGFloat)cellHeight {
    return 45;
}

@end
