//
//  SearchView.h
//  秋大爷要的搜索框
//
//  Created by 刘智滨 on 16/8/21.
//  Copyright © 2016年 刘智滨. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CustomerSearchBar.h"

@protocol SearchViewSearchBarDelegate <NSObject>

-(void)clickBackBtn;

-(void)clickAssociationBtn;

-(void)searchViewTextDidChange:(CustomerSearchBar *)searchBar;

@end

@protocol SearchViewTableViewDataSource <UITableViewDataSource>

@end

@protocol SearchViewTableViewDelegate <UITableViewDelegate>

@end

@interface SearchView : UIView

//刷新结果用
-(void)refreshResult;

@property(weak ,nonatomic)id<SearchViewSearchBarDelegate>delegate;
@property(weak ,nonatomic)id<SearchViewTableViewDataSource>tableViewDataSource;
@property(weak ,nonatomic)id<SearchViewTableViewDelegate>tableViewDelegate;

@end
