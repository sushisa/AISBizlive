//
//  GroupContactDetail.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "GroupContactDetail.h"



@implementation GroupContactDetail

@synthesize ID, name, imageURL, lastUpdate;
@synthesize contactList;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.ID = responseData[RES_KEY_ID];
        self.name = responseData[RES_KEY_NAME];
        self.imageURL = responseData[RES_KEY_IMAGE_URL];
        self.lastUpdate = responseData[RES_KEY_LAST_UPDATE];
        
        ResponseGetContactList *responseGetContactList = [[ResponseGetContactList alloc] initWithResponseData:responseData];
        self.contactList = [responseGetContactList contactList];
    }
    return self;
}

@end
