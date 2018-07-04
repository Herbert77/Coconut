//
//  CollectionViewCellViewModel_Template.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "HCY_CoconutCollectionCellViewModel.h"

@implementation HCY_CoconutCollectionCellViewModel

+ (HCY_CoconutCollectionCellViewModel *)viewModelWithRawData:(id)data {
    
    HCY_CoconutCollectionCellViewModel *viewModel = [HCY_CoconutCollectionCellViewModel new];
    <#setupViewModel#>
    return viewModel;
}

@end
