//
//  SplashScreenViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

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
}
-(void)viewDidAppear:(BOOL)animated{
    sleep(3);
    NSLog(@"Load");
    [self performSegueWithIdentifier: @"mainPage" sender: self];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"Segue");
//    
////    [self performSegueWithIdentifier: @"mainPage" sender: sender];
////    [self performSegueWithIdentifier:@"mainPage" sender:self];
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
