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
    
NSArray *categoryName1;

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
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:@"path"];//読み込み？
    
    
    
    NSDictionary *items =[NSDictionary dictionaryWithObjectsAndKeys:[dic objectForKey:@""]];
    
    for(NSDictionary* str in items){
        
        NSLog(@"%@",[str objectForKey:@"関ヶ原"]);
    
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
