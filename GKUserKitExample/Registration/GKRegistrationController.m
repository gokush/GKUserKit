//
//  ViewController.m
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKRegistrationController.h"
#import "GKRegistrationTableViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface GKRegistrationController ()
{
    RACSignal *emailSignal;
    RACSignal *nicknameSignal;
    RACSignal *pwdSignal;
    RACSignal *formValidSignal;
}
@end

@implementation GKRegistrationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    for (NSString* identifier in @[@"GKRegistrationTableViewCell"]) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
    self.title = @"用户注册";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
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
    NSString *identifier = @"GKRegistrationTableViewCell";
    
    GKRegistrationTableViewCell *cell = (GKRegistrationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexpath];
    
    if (!cell) {
        cell = [[GKRegistrationTableViewCell alloc] init];
    }
    
    if (indexpath.section == 0) {
        switch (indexpath.row) {
            case 0:
            {
                cell.label.text = @"邮箱";
                cell.textField.placeholder = @"Email";
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                 emailSignal = [[cell.textField rac_textSignal] map:^id(id value) {
                    return @([cell isValidEmail:value]);
                }];
                
                
            }
                break;
            case 1:
            {
                cell.label.text = @"昵称";
                cell.textField.placeholder = @"昵称";
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                nicknameSignal = [[cell.textField rac_textSignal] map:^id(NSString *value) {
                    return @(value.length > 2 && value.length < 10);
                }];
            }
                break;
            case 2:
            {
                cell.label.text = @"密码";
                cell.textField.placeholder = @"密码";
                cell.textField.secureTextEntry = YES;
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                pwdSignal = [[cell.textField rac_textSignal] map:^id(NSString *value) {
                    return @(value.length > 1);
                }];
            }
                break;
            default:
                break;
        }
    } else {
        UIColor *blueColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        cell.label.textColor = blueColor;
        cell.label.text = @"注册";
        cell.textField.hidden = YES;
        formValidSignal = [RACSignal combineLatest:@[emailSignal, nicknameSignal, pwdSignal] reduce:^id(NSNumber *emailValid, NSNumber *nicknameValid, NSNumber *pwdValid){
            NSLog(@"%@, %@, %@",emailValid, nicknameValid, pwdValid);
            return @([emailValid boolValue] && [nicknameValid boolValue] && [pwdValid boolValue]);
        }];
        
        [formValidSignal subscribeNext:^(id x) {
            cell.label.textColor = [x boolValue] ? blueColor : [UIColor grayColor];
        }];
    }
    
    
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
