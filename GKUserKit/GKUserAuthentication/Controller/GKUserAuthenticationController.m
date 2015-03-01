//
//  UserauthenticationViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 11/18/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "GKUserAuthenticationController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "GKUserContainerMock.h"

typedef enum {
    InputSectionUsernameCell,
    InputSectionPasswordCell
} InputSection;

typedef enum {
    ConfirmSectionCell
} ConfirmSection;

typedef enum {
    InputUserAuthenticationSection,
    ConfirmUserAuthenticationSection
} UserAuthenticationSection;

@interface GKUserAuthenticationController ()

@end

@implementation GKUserAuthenticationController

- (id)init
{
    self = [self initWithNibName:@"GKUserAuthenticationView" bundle:nil];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
    }
    return self;
}

- (void)setup
{
    self.service = [[GKUserContainerMock alloc] userService];
    self.user = [[GKUserAuthentication alloc] init];
    self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    self.hud.mode = MBProgressHUDModeCustomView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (NSString *identifier in @[@"GKUserAuthenticationTableViewCell"]) {
        UINib *nib;
        nib = [UINib nibWithNibName:identifier bundle:nil];
        [self.tableView registerNib:nib
             forCellReuseIdentifier:identifier];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
{
    float height;
    switch (section) {
        case ConfirmUserAuthenticationSection:
            height = 40.0f;
            break;
            
        default:
            height = 0.0f;
            break;
    }
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
    if (section == InputUserAuthenticationSection)
        return nil;
    
    CGRect footerViewRect = CGRectMake(0.0f, 0.0f, 320.0f, 40.0f);
    UIView *footerView = [[UIView alloc] initWithFrame:footerViewRect];
    
    UIButton *forgotPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgotPassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgotPassword addTarget:self action:@selector(forgotPasswordDidTap:)
             forControlEvents:UIControlEventTouchUpOutside];
    forgotPassword.frame = CGRectMake(0.0f, 10.0f, 320.0f, 40.0f);
    [forgotPassword setTitleColor:forgotPassword.tintColor
                         forState:UIControlStateNormal];
    forgotPassword.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    
    UIButton *registration = [UIButton buttonWithType:UIButtonTypeCustom];
    [registration setTitle:@"注册新账号" forState:UIControlStateNormal];
    [registration addTarget:self action:@selector(registrationDidTap:)
           forControlEvents:UIControlEventTouchUpOutside];
    registration.frame = CGRectMake(0.0f, 35.0f, 320.0f, 40.0f);
    [registration setTitleColor:registration.tintColor
                       forState:UIControlStateNormal];
    registration.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    
    [footerView addSubview:forgotPassword];
    [footerView addSubview:registration];
    
    return footerView;
}

- (IBAction)forgotPasswordDidTap:(id)sender
{
    
}

- (IBAction)registrationDidTap:(id)sender
{
    
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case InputUserAuthenticationSection:
            return 2;
            break;
        case ConfirmUserAuthenticationSection:
            return 1;
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case InputUserAuthenticationSection:
            cell = [self inputCellForRowAtIndexPath:indexPath];
            break;
        case ConfirmUserAuthenticationSection:
            cell = [self confirmCellForRowAtIndexPath:indexPath];
        default:
            break;
    }
    
//    [tableView tableViewCell:cell setSeparatorForRowAtIndexPath:indexPath];
    return cell;
}

- (UITableViewCell *)inputCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKUserAuthenticationTableViewCell *cell;
    static NSString *name = @"GKUserAuthenticationTableViewCell";
    cell = [self.tableView dequeueReusableCellWithIdentifier:name];
    
    switch (indexPath.row) {
        case InputSectionUsernameCell: {
            cell.titleLabel.text = @"用户名";
            cell.inputTextField.placeholder = @"请输入用户名";
            break;
        }
        case InputSectionPasswordCell: {
            cell.titleLabel.text = @"密码";
            cell.inputTextField.placeholder = @"请输入密码";
            break;
        }
        default:
            break;
    }
    [cell.inputTextField addTarget:self
                            action:@selector(textFieldDidChange:)
                  forControlEvents:UIControlEventEditingChanged];
    cell.inputTextField.tag = indexPath.row;
    
    return cell;
}

- (UITableViewCell *)confirmCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *name = @"GKUserAuthenticationConfirmTableViewCell";
    cell = [self.tableView dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:name];
        
        cell.textLabel.textColor = [UIColor colorWithRed:0.15f green:0.47f
                                                    blue:1.0f alpha:1.0f];
        cell.textLabel.text = @"登录";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case ConfirmUserAuthenticationSection: {
            NSError *error = [self.user valid];
            if (nil == error) {
                [[self.service authenticate:self.user]
                 subscribeNext:[self didAuthencateUserSuccess]
                 error:[self didAuthencateUserFailure]];
                break;
            }
            
            self.hud.labelText = [error localizedDescription];
            [self.view addSubview:self.hud];
            [self.hud show:YES];
            [self.hud hide:YES afterDelay:2];
            if (self.authenticateDidFail)
                self.authenticateDidFail(error);
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            break;
        }
        default:
            break;
    }
}

- (void)textFieldDidChange:(id)sender
{
    UITextField *textField = (UITextField *)sender;
    switch (textField.tag) {
        case InputSectionUsernameCell:
            self.user.username = textField.text;
            break;
        case InputSectionPasswordCell:
            self.user.password = textField.text;
        default:
            break;
    }
}

- (void(^)(GKUser *))didAuthencateUserSuccess
{
    return ^(GKUser *user) {
        self.hud.labelText = @"成功登录";
        [self.view addSubview:self.hud];
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:2];
        
        [self.navigationController popViewControllerAnimated:YES];
        if (self.authenticateDidSucceed)
            self.authenticateDidSucceed(self, [[GKUser alloc] init]);
    };
}

- (void(^)(NSError *))didAuthencateUserFailure
{
    return ^(NSError *error) {
        self.hud.labelText = error.localizedDescription;
        [self.view addSubview:self.hud];
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:2];
        if (self.authenticateDidFail)
            self.authenticateDidFail(error);
    };
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
