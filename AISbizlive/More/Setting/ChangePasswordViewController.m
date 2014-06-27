//
//  ChangePasswordViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "AISGlobal.h"
@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
    [self setTextLangague];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:BUTTON :@"CHANGE_PASS"]];
    [oldPasswordTextField setPlaceholder:[AISString commonString:PLACEHODER :@"OLD_PASS"]];
    
    [newPasswordTextField setPlaceholder:[AISString commonString:PLACEHODER :@"NEW_PASS"]];
    [reNewPasswordTextField setPlaceholder:[AISString commonString:PLACEHODER :@"CONFIRM_PASS"]];
    [oldPasswordLabel setText:[AISString commonString:LABEL :@"OLD_PASS"]];
    [newPasswordLabel setText:[AISString commonString:LABEL :@"NEW_PASS"]];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
//[AISString commonString:BUTTON :@"DONE"]
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
