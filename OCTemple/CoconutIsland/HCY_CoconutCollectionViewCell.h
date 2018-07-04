//
//  CollectionViewCell_Template.h
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCY_CoconutCollectionCellViewModel.h"

@interface HCY_CoconutCollectionViewCell : UICollectionViewCell

- (void)bindDataWithViewModel:(HCY_CoconutCollectionCellViewModel *)viewModel;

@end
