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
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    for (NSString* identifier in @[@"RegistrationTableViewCell"]) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0f;
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
    
    if (indexpath.section == 0) {
        switch (indexpath.row) {
            case 0:
                cell.label.text = @"邮箱";
                cell.textField.placeholder = @"Email";
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                break;
            case 1:
                cell.label.text = @"昵称";
                cell.textField.placeholder = @"昵称";
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                break;
            default:
                break;
        }
    } else {
        cell.label.textColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        cell.label.text = @"注册";
        cell.textField.hidden = YES;
        
    }
    
    
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
