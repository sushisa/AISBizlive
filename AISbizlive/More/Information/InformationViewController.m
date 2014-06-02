//
//  InfomationViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/4/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "InformationViewController.h"
#import "AISGlobal.h"
@interface InformationViewController ()
{
    NSMutableArray *info;
}
@end

@implementation InformationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    info = [[NSMutableArray alloc] initWithObjects:@"Help",@"Private Policy",@"Terms of Service",@"About", nil];
    NSLog(@"Information Load");
    
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.topItem.title = @"Information";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.topItem.title = @"Information";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [info count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"InformationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *TextLabel = (UILabel *)[cell viewWithTag:1];
    TextLabel.textColor = [AISColor lightgrayColor];
    TextLabel.text = [info objectAtIndex:indexPath.row];
    return cell;
}
@end
