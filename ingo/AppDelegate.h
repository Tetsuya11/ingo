//
//  AppDelegate.h
//  ingo
//
//  Created by 一野哲也 on 2015/07/30.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
NSString *categoryName;
NSString *categoryImage;
NSArray *categoryCommentary;

NSString *categoryName1;
    

int iPath;
}

@property (nonatomic,strong) NSString *categoryName;
@property (nonatomic,strong) NSString *categoryImage;
@property (nonatomic,strong) NSArray *categoryCommentary;

@property (nonatomic,assign) int iPath;

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong)NSString *categoryName1;
@end

