//
//  WebServiceRequestHandler.h
//  AFNetworkingDome
//
//  Created by ttlgz-0022 on 15/12/24.
//  Copyright © 2015年 Transaction Technologies Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "DLog.h"

#define kPOST @"POSTMETHOD"
#define kGET @"GETMETHOD"
#define kPUT @"PUTTMETHOD"
#define kDELETE @"DELETEMETHOD"

@protocol WebServiceRequestHandlerDelegate <NSObject>
- (void)webServiceRequested:(NSURLSessionDataTask *)task parsed:(NSMutableDictionary *)responseDict;
- (void)webServiceRequestFailed:(NSURLSessionDataTask *)task error:(NSError *)error;
@end


@interface WebServiceRequestHandler : NSObject
+ (WebServiceRequestHandler *)shareWebServiceRequestHandler;
- (void)loadWebServiceRequestWithParams:(NSMutableDictionary *)params aURL:(NSString *)aURL method:(NSString *)method delegate:(id) delegate;
@end
