//
//  tabBarController.m
//  clubManager
//
//  Created by 刘人华 on 2016/11/19.
//  Copyright © 2016年 刘人华. All rights reserved.
//

#import "tabBarController.h"

@interface tabBarController ()

@end

@implementation tabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"tab bar");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue");
    // Get the new view controller using [segue destinationViewController].
    activityListTableViewController *nextScene = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    nextScene.clubName = self.clubName;
    
}


@end
