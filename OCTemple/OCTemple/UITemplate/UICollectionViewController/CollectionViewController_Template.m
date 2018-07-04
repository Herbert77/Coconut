//
//  CollectionViewController_Template.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/7/2.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "<#Unit#>ViewController.h"
#import "<#Unit#>CollectionCell.h"

@interface <#Unit#>ViewController () <#usedDelegateInController#>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic ,strong) NSMutableArray   *dsArr;
@end

@implementation <#Unit#>ViewController

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
        [_collectionView registerClass:[<#Unit#>CollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([<#Unit#>CollectionCell class])];
        
      //[_collectionView registerClass:[<#Unit#>HeaderCRView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([<#Unit#>HeaderCRView class])];
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
    
    <#Unit#>CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([<#Unit#>CollectionCell class]) forIndexPath:indexPath];
    
    id rawData = nil;
    <#Unit#>CollectionCellViewModel *viewModel = [<#Unit#>CollectionCellViewModel viewModelWithRawData:rawData];
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
        <#Unit#>HeaderCRView *headerCRView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([<#Unit#>HeaderCRView class]) forIndexPath:indexPath];
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
