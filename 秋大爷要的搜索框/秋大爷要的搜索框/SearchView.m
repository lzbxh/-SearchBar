//
//  SearchView.m
//  秋大爷要的搜索框
//
//  Created by 刘智滨 on 16/8/21.
//  Copyright © 2016年 刘智滨. All rights reserved.
//

#define WS(weakSelf)  __weak typeof(&*self)weakSelf = self

#define NAVBARHEIGHT  64
#define SCREENWIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEGIHT  [UIScreen mainScreen].bounds.size.height
#define CONTENT_HEIGHT (SCREENHEGIHT - NAVBARHEIGHT)

#import "SearchView.h"
#import "Masonry.h"

@interface SearchView ()<UITextFieldDelegate ,UITableViewDelegate ,UITableViewDataSource>

@property(strong ,nonatomic)UIButton            *backBtn;
@property(strong ,nonatomic)CustomerSearchBar   *searchBar;
@property(strong ,nonatomic)UIButton            *AssociationBtn;

@property(strong ,nonatomic)UITableView         *resultTableView;

@end

@implementation SearchView

-(UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(CustomerSearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[CustomerSearchBar alloc]init];
    
        [_searchBar addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        _searchBar.layer.borderWidth = 1;
        _searchBar.layer.borderColor = [UIColor redColor].CGColor;
        _searchBar.layer.cornerRadius = 5;
        _searchBar.placeholder = @"搜索...";
    
    }
    return _searchBar;
}

-(UIButton *)AssociationBtn {
    if (!_AssociationBtn) {
        _AssociationBtn = [[UIButton alloc]init];
        [_AssociationBtn setTitle:@"确定关联(0)" forState:UIControlStateNormal];
        [_AssociationBtn addTarget:self action:@selector(clickAssociationBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _AssociationBtn;
}

-(UITableView *)resultTableView {
    if (!_resultTableView) {
        _resultTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVBARHEIGHT, SCREENWIDTH, 0)];
        _resultTableView.dataSource = self;
        _resultTableView.delegate   = self;
    }
    return _resultTableView;
}

-(instancetype)init {
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI {
    [self addSubview:self.backBtn];
    [self addSubview:self.searchBar];
    [self addSubview:self.AssociationBtn];
    [self addSubview:self.resultTableView];
    [self sendSubviewToBack:self.resultTableView];
}

-(void)layoutSubviews {
    WS(ws);
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(10);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(NAVBARHEIGHT);
        make.left.equalTo(ws);
    }];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.backBtn.mas_right).with.offset(5);
        make.centerY.equalTo(ws.backBtn);
//        make.height.mas_equalTo(ws.frame.size.height - 20);
        make.height.mas_equalTo(44);
    }];
    
    [self.AssociationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-5);
        make.width.mas_equalTo(16*6);
        make.height.equalTo(ws);
        make.left.equalTo(ws.searchBar.mas_right);
        make.centerY.equalTo(ws.searchBar);
    }];
}

//输入框事件
- (void) textFieldDidChange:(CustomerSearchBar *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchViewTextDidChange:)]) {
        [self.delegate searchViewTextDidChange:textField];
    }
}

-(void)refreshResult {
    [self.resultTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tableViewDataSource) {
        if ([self.tableViewDataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
            NSInteger resultCount = [self.tableViewDataSource tableView:tableView numberOfRowsInSection:section];
            //给一个简单的小动画
            WS(ws);
            if (resultCount > 0) {
                [UIView animateWithDuration:0.5 animations:^{
                    ws.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEGIHT);
                    ws.resultTableView.frame = CGRectMake(0, NAVBARHEIGHT, SCREENWIDTH, CONTENT_HEIGHT);
                } completion:^(BOOL finished) {
                    
                }];
            } else {
                [UIView animateWithDuration:0.5 animations:^{
                    ws.frame = CGRectMake(0, 0, SCREENWIDTH, NAVBARHEIGHT);
                    ws.resultTableView.frame = CGRectMake(0, NAVBARHEIGHT, SCREENWIDTH, 0);
                } completion:^(BOOL finished) {
                    
                }];
            }
            return resultCount;
        }else {
            return 0;
        }
    }else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableViewDataSource) {
        if ([self.tableViewDataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
            return [self.tableViewDataSource tableView:tableView cellForRowAtIndexPath:indexPath];
        }else {
            NSAssert(NO, @"这种情况不允许发生");
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            return cell;
        }
    }else {
        NSAssert(NO, @"这种情况不允许发生");
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableViewDelegate) {
        if ([self.tableViewDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
            [self.tableViewDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
        }else {
            //DO NOTHING
        }
    }else {
        //DO NOTHING
    }
}

-(void)clickBackBtn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickBackBtn)]) {
        [self.delegate clickBackBtn];
    }
}

-(void)clickAssociationBtn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickAssociationBtn)]) {
        [self.delegate clickAssociationBtn];
    }
}

@end






















