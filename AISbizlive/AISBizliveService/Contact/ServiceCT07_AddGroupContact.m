//
//  ServiceCT07_AddGroupContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT07_AddGroupContact.h"

@implementation ServiceCT07_AddGroupContact
@synthesize delegate;

- (void)requestService
{
    NSMutableArray *contactList = [NSMutableArray new];
    for (NSString *contactID in self.contactID) {
        
        NSDictionary *contact = @{REQ_KEY_CONTACT_ID: contactID};
        [contactList addObject:contact];
    }
    
    NSDictionary *requestDict = @{REQ_KEY_GROUP_NAME  : self.groupName,
                                  REQ_KEY_PHOTO       : self.image,
                                  REQ_KEY_CONTACT_LIST: contactList};
    
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)setParameterWithGroupName:(NSString *)groupName
                            image:(NSString *)image
                        contactID:(NSArray *)contactID
{
    self.groupName = groupName;
    self.image = image;
    self.contactID = contactID;
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_ID           : @"01234",
                                   RES_KEY_NAME         : @"Woravit",
                                   RES_KEY_LASTNAME     : @"Poang",
                                   RES_KEY_PHONE_NUMBER : @"089xxxxxxx",
                                   RES_KEY_LAST_UPDATE  : @"1403777666666",
                                   RES_KEY_IMAGE_URL    : @"www.hotmail.co.th"};
        NSDictionary *contact2 =@{RES_KEY_ID            : @"01235",
                                  RES_KEY_NAME          : @"Pluem",
                                  RES_KEY_LASTNAME      : @"Limrattanakan",
                                  RES_KEY_PHONE_NUMBER  : @"089xxxxxxx",
                                  RES_KEY_LAST_UPDATE   : @"1403777666666",
                                  RES_KEY_IMAGE_URL     : @"www.google.co.th"};
        
        NSDictionary *group1 = @{RES_KEY_ID             : @"123",
                                 RES_KEY_NAME           :@"PromptNow",
                                 RES_KEY_IMAGE_URL      :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST   : @[contact1,
                                                            contact2]};
        
        responseData = @{RES_KEY_GROUP_LIST    : @[group1]};
        responseData = group1;
    }
    
    GroupContactDetail *groupContactDetail = [[GroupContactDetail alloc] initWithResponseData:responseData];
    
    
    [delegate addGroupContactSuccess:groupContactDetail];
    
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate addGroupContactError:result];
}


@end
