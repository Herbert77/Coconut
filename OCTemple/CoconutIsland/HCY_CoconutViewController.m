//
//  CollectionViewController_Template.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "HCY_CoconutViewController.h"
#import "HCY_CoconutCollectionCell.h"

@interface HCY_CoconutViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic ,strong) NSMutableArray   *dsArr;
@end

@implementation HCY_CoconutViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
    [self setLayout];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

#pragma mark - UI
- (void)addSubviews {
    [self.view addSubview:self.collectionView];
}

- (void)setLayout {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(SC_StatusBarAndNavigationBarHeight);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
      //make.bottom.equalTo(self.view.mas_bottom).offset(SC_TabbarHeight);
    }];
}

#pragma mark - Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[HCY_CoconutCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([HCY_CoconutCollectionCell class])];
        
      //[_collectionView registerClass:[HCY_CoconutHeaderCRView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HCY_CoconutHeaderCRView class])];
    }
    return _collectionView;
}

- (NSMutableArray *)dsArr {
    if (!_dsArr) {
        _dsArr = [NSMutableArray new];
    }
    return _dsArr;
}

#pragma mark - CollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dsArr count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    HCY_CoconutCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HCY_CoconutCollectionCell class]) forIndexPath:indexPath];
    
    id rawData = nil;
    HCY_CoconutCollectionCellViewModel *viewModel = [HCY_CoconutCollectionCellViewModel viewModelWithRawData:rawData];
    [cell bindDataWithViewModel:viewModel];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize itemSize;
    
    CGFloat itemWidth = (SC_ScreenWidth - 1.5*2)/3.0;
    CGFloat itemHeight = itemWidth;
    itemSize = CGSizeMake(itemWidth, itemHeight);
    
    return itemSize;
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    /*
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HCY_CoconutHeaderCRView *headerCRView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([HCY_CoconutHeaderCRView class]) forIndexPath:indexPath];
        return self.albumHeaderCRView;
    }
    else
    {
        return nil;
    }
    */
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = {self.view.width, 150};
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.5;
}

@end
