//
//  ImportContactViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ImportContactViewController.h"
#import "AISGlobal.h"

@interface ImportContactViewController ()
{
    NSDictionary *dict;
    NSMutableArray *myObject,*check;
    CFIndex number;
    NSString *Firstname ,*Lastname ;
    ABMultiValueRef Phone ;
    NSString *lastname,*firstname,*phone1,*profileImage;
    NSMutableArray *selectedMarks;
    NSData *contactImageData ;
}
@end

@implementation ImportContactViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    firstname = @"firstname";
    lastname = @"lastname";
    phone1 = @"phone";
    profileImage = @"profileImage";
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(nil, nil);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted) {
                // If the app is authorized to access the first time then add the contact
                [self phonebook];
            } else {
                NSLog(@"Not Allow");
            }
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        
        [self phonebook];
    }
    else {
        NSLog(@"Not Allow 2");
    }
    NSLog(@"Import Contact");
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.topItem.title = @"Import Contact";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.topItem.title = @"Import Contact";
    [self phonebook];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}

-(void)phonebook{
    myObject = [[NSMutableArray alloc] init];
    dict = [[NSDictionary alloc] init];
    CFErrorRef error = NULL;
    
    ABAddressBookRef UserAddressBook = ABAddressBookCreateWithOptions(NULL, &error);
    CFArrayRef Contant = ABAddressBookCopyArrayOfAllPeople(UserAddressBook);
    number = CFArrayGetCount(Contant);
    NSString *phones = nil;
    for (int i = 0;i<number; i++) {
        ABRecordRef ref = CFArrayGetValueAtIndex(Contant, i);
        Firstname = [[NSString alloc] initWithFormat:@"%@",ABRecordCopyValue(ref, kABPersonFirstNameProperty) ];
        Lastname = [[NSString alloc] initWithFormat:@"%@",ABRecordCopyValue(ref, kABPersonLastNameProperty) ];
       contactImageData  = (__bridge NSData *)ABPersonCopyImageDataWithFormat(ref, kABPersonImageFormatThumbnail);
//
//        [contactInfoDict setObject:contactImageData forKey:@"image"];
        Phone = ABRecordCopyValue(ref, kABPersonPhoneProperty);
        if (ABMultiValueGetCount(Phone)>0){
            phones = [[NSString alloc] initWithFormat:@"%@",ABMultiValueCopyValueAtIndex(Phone, 0) ];
            dict = [NSDictionary dictionaryWithObjectsAndKeys:
                    Firstname, firstname,
                    Lastname, lastname,
                    phones, phone1,
                    contactImageData,profileImage,
                    nil];
        }
        [myObject addObject:dict];
        
    }
    check =[[NSMutableArray alloc] initWithArray:myObject];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [check count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
     NSDictionary *cellValue = [check objectAtIndex:indexPath.row];
    UIImageView *profile = (UIImageView *)[cell viewWithTag:19];
    if([cellValue objectForKey:profileImage] != nil){
        profile.image = [UIImage imageWithData:[cellValue objectForKey:profileImage]];
    }
    else {
        profile.image = [UIImage imageNamed:@"Avatar_Default.png"];
    }
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:20];
    nameLabel.textColor = [AISColor lightgrayColor];
    nameLabel.text =  [[NSString alloc]initWithFormat:@"%@ %@",[cellValue objectForKey:firstname],[cellValue objectForKey:lastname]];
    UILabel *telLabel = (UILabel *)[cell viewWithTag:21];
    telLabel.textColor = [AISColor lightgrayColor];
    telLabel.text =  [[NSString alloc]initWithFormat:@"%@",[cellValue objectForKey:phone1]];
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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