//
//  AddPeopleViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/4/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPeopleViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    //Field
    __weak IBOutlet UITextField *mobileNoTextField;
    __weak IBOutlet UITextField *lastNameTextField;
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UIButton *imagePeople;
    //Label
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *lastNameLabel;
    __weak IBOutlet UILabel *mobileLabel;
}

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *profile;
@property (strong, nonatomic) NSString *checkPush;
- (IBAction)selectPicture:(id)sender;

@end
