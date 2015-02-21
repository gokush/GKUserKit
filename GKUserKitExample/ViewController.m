//
//  ViewController.m
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "ViewController.h"
#import "RegistrationTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    
    for (NSString* identifier in @[@"RegistrationTableViewCell"]) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self configureBasicCell:tableView cellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)configureBasicCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexpath {
    NSString *identifier = @"RegistrationTableViewCell";
    
    RegistrationTableViewCell *cell = (RegistrationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexpath];
    
    if (!cell) {
        cell = [[RegistrationTableViewCell alloc] init];
    }
    
    switch (indexpath.row) {
        case 0:
            cell.label.text = @"邮箱";
            cell.textField.placeholder = @"Email";
            break;
        case 1:
            cell.label.text = @"昵称";
            cell.textField.placeholder = @"昵称";
            break;
        default:
            break;
    }
    
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
