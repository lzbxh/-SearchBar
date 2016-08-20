//
//  SearchViewController.m
//  秋大爷要的搜索框
//
//  Created by 刘智滨 on 16/8/21.
//  Copyright © 2016年 刘智滨. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"

@interface SearchViewController ()<SearchViewSearchBarDelegate ,SearchViewTableViewDataSource ,SearchViewTableViewDelegate>

@property(assign ,nonatomic)NSUInteger resultCount;
@property(strong ,nonatomic)SearchView *sv;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //请注意，我这里整个nav都是自定义的了
    [self.navigationController setNavigationBarHidden:YES];
    
    self.sv = [[SearchView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    self.sv.delegate = self;
    self.sv.tableViewDataSource = self;
    self.sv.tableViewDelegate = self;
    self.sv.backgroundColor = [UIColor lightGrayColor];
    self.sv.layer.borderColor = [UIColor blueColor].CGColor;
    self.sv.layer.borderWidth = 1;
    [self.view addSubview:self.sv];
    
    self.resultCount = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchViewTextDidChange:(CustomerSearchBar *)searchBar {
    NSLog(@"searchText:%@" ,searchBar.text);    //监听搜索框
#warning DEUBGUI 自己处理搜索结果，我这里仅仅只用于测试UI
    if (searchBar.text.length > 0) {
        self.resultCount = 10;
    }else {
        self.resultCount = 0;
    }
    [self.sv refreshResult];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"----%lu" ,indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了：%lu" ,indexPath.row);
}

-(void)clickBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickAssociationBtn {
    NSLog(@"%s" ,__PRETTY_FUNCTION__);
}

@end
