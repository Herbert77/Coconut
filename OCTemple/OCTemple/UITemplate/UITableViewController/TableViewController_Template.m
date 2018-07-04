//
//  ViewController.m
//  OCTemple
//
//  Created by Herbert Hu on 2018/6/29.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "<#Unit#>ViewController.h"
#import "<#Unit#>Cell.h"

@interface <#Unit#>ViewController () <#usedDelegateInController#>
{
    NSInteger page;
}
@property (strong, nonatomic) UITableView    *tableView;
@property (strong, nonatomic) NSMutableArray *dsArr;
@property (assign, nonatomic) NSInteger       page;
@property (assign, nonatomic) NSInteger       dataTotal;
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

- (void)setupUI
{
    
}

- (void)startToRequest
{
    self.page = 0;
    self.dataTotal = 0;
    [self requestRawDataWithPage:self.page];
}

#pragma mark - UI
- (void)addSubviews {
    [self.view addSubview:self.tableView];
}

- (void)setLayout {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(SC_StatusBarAndNavigationBarHeight);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        //make.bottom.equalTo(self.view.mas_bottom).offset(SC_TabbarHeight);
    }];
}

#pragma mark - Getter
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 8, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        [_tableView registerClass:[<#Unit#>Cell class] forCellReuseIdentifier:NSStringFromClass([<#Unit#>Cell class])];
        
        [self addUploadWithView:_tableView andRefreshingBlock:^{
            weakSelf.page++;
            [weakSelf requestRawDataWithPage:weakSelf.page];
        }];
    }
    
    return _tableView;
}

- (NSMutableArray *)dsArr {
    if (!_dsArr) {
        _dsArr = [NSMutableArray new];
    }
    return _dsArr;
}

#pragma mark - Request
- (void)requestRawDataWithPage:(NSInteger)page {
    
    
    
    [FaceFunsNetManager connectWithModel:param WithUrlSring:HOST isShowLoading:NO success:^(id dic) {
        
        
        [self endRefreshingWithDataArray:[NSArray new] total:self.dataTotal];
        
    } failure:^(NSError *error) {
        
        [self endRefreshing];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dsArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    <#Unit#>Cell *cell = [tableView dequeueReusableCellWithIdentifier:[NSStringFromClass([<#Unit#>Cell class])] forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [<#Unit#>Cell cellWithTableView:tableView];
    }
    
    id rawData = nil;
    <#Unit#>CellViewModel *viewModel = [<#Unit#>CellViewModel viewModelWithRawData:rawData];
    [cell bindDataWithViewModel:viewModel];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

@end
