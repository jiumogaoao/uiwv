//
//  detailVC.m
//  uiwv
//
//  Created by 高志强 on 2016/12/18.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "detailVC.h"

@interface detailVC ()

@end

@implementation detailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithWhite:1 alpha:1];
    UILabel *l=[[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 10)];
    l.text=@"detailVC";
    [self.view addSubview:l];
    // Do any additional setup after loading the view.
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
