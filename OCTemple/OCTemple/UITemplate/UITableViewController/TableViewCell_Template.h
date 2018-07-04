//
//  TableViewCell.h
//  OCTemple
//
//  Created by Herbert Hu on 2018/6/29.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "<#Unit#>CellViewModel.h"

@interface <#Unit#>Cell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)cellHeight;

- (void)bindDataWithViewModel:(<#Unit#>CellViewModel *)viewModel;

@end
