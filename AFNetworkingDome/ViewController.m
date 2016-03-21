//
//  ViewController.m
//  AFNetworkingDome
//
//  Created by ttlgz-0022 on 15/12/24.
//  Copyright © 2015年 Transaction Technologies Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)getAction{
    [[WebServiceRequestHandler shareWebServiceRequestHandler] loadWebServiceRequestWithParams:nil aURL:nil method:kGET delegate:self];
}

- (void)postAction{
    [[WebServiceRequestHandler shareWebServiceRequestHandler] loadWebServiceRequestWithParams:nil aURL:nil method:kPOST delegate:self];
}

- (void)putAction{
    [[WebServiceRequestHandler shareWebServiceRequestHandler] loadWebServiceRequestWithParams:nil aURL:nil method:kPUT delegate:self];
}

- (void)deleteAction{
    [[WebServiceRequestHandler shareWebServiceRequestHandler] loadWebServiceRequestWithParams:nil aURL:nil method:kDELETE delegate:self];
}

- (void)webServiceRequested:(NSURLSessionDataTask *)task parsed:(NSMutableDictionary *)responseDict{

}

- (void)webServiceRequestFailed:(NSURLSessionDataTask *)task error:(NSError *)error{

}

@end
