//
//  CollectionViewReusableViewViewModel_Template.h
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCY_CoconutHeaderCRViewViewModel : NSObject

@property (nonatomic,copy) NSString *userName;

+ (HCY_CoconutHeaderCRViewViewModel *)viewModelWithRawData:(id)data;

@end
