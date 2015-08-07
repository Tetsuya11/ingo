//
//  category1ViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/08/05.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "category1ViewController.h"
#import "AppDelegate.h"


@interface category1ViewController (){
    
NSArray *_categoryName1;

AppDelegate *_appDelegate;
    
}
@end

@implementation category1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.myTableView2.delegate = self;
    self.myTableView2.dataSource = self;
    
    _appDelegate = [[UIApplication sharedApplication]delegate];
    
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:path];//読み込み?
    
    NSString *cate = @""; //*tstの空箱
    
    if(_appDelegate.iPath == 0){
        cate = @"合コン";
    }else if(_appDelegate.iPath == 1){
        cate = @"プログラマー";
    }else if(_appDelegate.iPath == 2){
        cate = @"相撲界";
    }else if(_appDelegate.iPath == 3){
        cate = @"航空業界";
    }else if(_appDelegate.iPath == 4){
        cate =@"大学";
    }
    
    NSLog(@"ここは　＝　(int)%@",dic[cate]);


    
//    NSString *goukon = @"合コン";
//    
//    NSLog(@"全件 = %@",dic);
//    NSLog(@"合コン用語 = %@",dic[goukon]);
//    
//    NSString *seki = @"関ヶ原";
//    NSString *cate = @"";
//   
 //   NSLog(@"%@",dic[cate][seki]);
//    
//    NSLog(@"合コンのkey = %@",[dic[goukon] allKeys]);
//
    NSArray *ary =[dic[cate] allKeys];
//    
//    NSLog(@"キーのary = %@",ary[1]);
//
    _categoryName1 = ary;
//    
//    NSLog(@"ary%@",_categoryName1);
//    

    
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
   return _categoryName1.count;//セル行
   // return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    
    nameLabel.text = _categoryName1[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {//押された瞬間
    NSLog(@"タップしよ");
    _appDelegate.categoryName1 = _categoryName1[indexPath.row];
     _appDelegate.iPath = (int)indexPath.row;
}

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        
    }

@end
