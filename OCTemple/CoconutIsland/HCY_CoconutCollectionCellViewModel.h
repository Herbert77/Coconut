//
//  CollectionViewCellViewModel_Template.h
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCY_CoconutCollectionCellViewModel : NSObject

@property (nonatomic,copy) NSString *fruitName;
@property (nonatomic,copy) NSString *fruitImageUrl;
@property (nonatomic,copy) NSString *inputPlaceHolder;

+ (HCY_CoconutCollectionCellViewModel *)viewModelWithRawData:(id)data;

@end
