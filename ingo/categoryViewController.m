//
//  categoryViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/07/30.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "categoryViewController.h"
#import "AppDelegate.h"
//#import "secoundViewContoller.h"

@interface categoryViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>{
   
    NSArray *_fesImages;
    NSArray *_fesName;
 
    AppDelegate *_appDelegate;
    
}

@end

@implementation categoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    _appDelegate = [[UIApplication sharedApplication] delegate];
    
                    _fesName = @[@"合コン",@"プログラマー",@"相撲界",@"航空業界",@"大学"];
                    
                    _fesImages = @[@"goukonn.jpeg",@"pro.jpeg",@"sumou.jpeg",@"CA.jpeg",@"daigaku.jpeg",];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    //return _fesName.count;//セル行
    NSInteger dataCount;
    
    if(tableView ==self.searchDisplayController.searchResultsTableView){
        switch(section){
            case 0:
                dataCount = self.dataSourceSearchResultscategory.count;
                break;
            case 1:
                dataCount = self.dataSourceSearchResultscategory.count;
                break;
            default:
                break;
                
        }
    }
        return dataCount;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    
    // ここのsearchDisplayControllerはStoryboardで紐付けされたsearchBarに自動で紐づけられています
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        // 検索中の暗転された状態のテーブルビューはこちらで処理
        switch (indexPath.section) {
            case 0: // iOS
                cell.textLabel.text = self.dataSourceSearchResultscategory[indexPath.row];
                break;
                       default:
                break;
        }
    } else {
        // 通常時のテーブルビューはこちらで処理
        switch (indexPath.section) {
            case 0: // iOS
                cell.textLabel.text = _fesName[indexPath.row];
                break;
                      default:
                break;
        }
    }
    
    return cell;
}

- (void)filterContainsWithSearchText:(NSString *)searchText
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    
    self.dataSourceSearchResultscategory = [_fesName filteredArrayUsingPredicate:predicate];
    }

- (BOOL)searchDisplayController:controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // 検索バーに入力された文字列を引数に、絞り込みをかけます
    [self filterContainsWithSearchText:searchString];
    
    // YESを返すとテーブルビューがリロードされます。
    // リロードすることでdataSourceSearchResultsiPhoneとdataSourceSearchResultsAndroidからテーブルビューを表示します
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"table view tap");
    
    secoundViewController *sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"secoundViewController"];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        // 検索中の暗転された状態のテーブルビューはこちらで処理
        switch (indexPath.section) {
            case 0: // iOS
                sVC.title = self.dataSourceSearchResultsiPhone[indexPath.row];
                break;
            case 1: // Android
                sVC.title = self.dataSourceSearchResultsAndroid[indexPath.row];
                break;
            default:
                break;
        }
    } else {
        // 通常時のテーブルビューはこちらで処理
        switch (indexPath.section) {
            case 0: // iOS
                sVC.title = self.dataSourceiPhone[indexPath.row];
                break;
            case 1: // Android
                sVC.title = self.dataSourceAndroid[indexPath.row];
                break;
            default:
                break;
        }
    }
    
    
    [self.navigationController pushViewController:sVC animated:YES];
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
//        NSIndexPath *indexPath = nil;
//        NSString *str;
//
//        if (self.searchDisplayController.active) {
//            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
//            str = [self.dataSourceSearchResultsiPhone objectAtIndex:indexPath.row];
//        } else {
//            //indexPath = [self.tableView indexPathForSelectedRow];
//            //recipe = [recipes objectAtIndex:indexPath.row];
//        }
//
//        SecondViewController *sVC = segue.destinationViewController;
//        // sVC.recipe = recipe;
//    }
//}



@end

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {//押された瞬間
    NSLog(@"タップ");
    // AppDelegateのcategoryNameに値を渡します。
    _appDelegate.categoryName = _fesName[indexPath.row];
    _appDelegate.categoryImage = _fesImages[indexPath.row];
    _appDelegate.iPath = (int)indexPath.row;//テーブルの何番目かをipathに入れている　ここが押されるとDetail mへ
    NSLog(@"%@",indexPath);
    
}        //左右で型が違う為、indexPathをint型に変換

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
@end
