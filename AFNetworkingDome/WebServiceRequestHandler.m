//
//  WebServiceRequestHandler.m
//  AFNetworkingDome
//
//  Created by ttlgz-0022 on 15/12/24.
//  Copyright © 2015年 Transaction Technologies Limited. All rights reserved.
//

#import "WebServiceRequestHandler.h"

@implementation WebServiceRequestHandler
{
    AFHTTPSessionManager * manager;
    
}

+ (WebServiceRequestHandler *)shareWebServiceRequestHandler{
    static WebServiceRequestHandler * handler = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        handler = [[WebServiceRequestHandler alloc] init];
    });
    return handler;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        manager = [AFHTTPSessionManager manager];
        [manager.securityPolicy setAllowInvalidCertificates:YES];
        [manager.requestSerializer  setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", nil];
        
    }
    return self;
}

- (void)loadWebServiceRequestWithParams:(NSMutableDictionary *)params aURL:(NSString *)aURL method:(NSString *)method delegate:(id) delegate{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //add http header if need
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"kToken"]) {
//        [manager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"kToken"] forHTTPHeaderField:@"X-CSRF-Token"];
//    }
    
    if ([method isEqual:kPOST]) {
       [manager POST:aURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          
           [self requestFinished:task andResponseObject:responseObject delegate:delegate];
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
           [self requestFailed:task error:error delegate:delegate];
       }];
        
    }
    else if ([method isEqual:kGET]) {
        [manager GET:aURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self requestFinished:task andResponseObject:responseObject delegate:delegate];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self requestFailed:task error:error delegate:delegate];
            
        }];
        
    }
    else if ([method isEqual:kPUT]) {
        [manager PUT:aURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
             [self requestFinished:task andResponseObject:responseObject delegate:delegate];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self requestFailed:task error:error delegate:delegate];
            
        }];
        
    }
    else if ([method isEqual:kDELETE]) {
        [manager DELETE:aURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self requestFinished:task andResponseObject:responseObject delegate:delegate];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self requestFailed:task error:error delegate:delegate];
        }];
        
    }


}
- (void)requestFinished:(NSURLSessionDataTask *)task andResponseObject:(id)responseObject delegate:(id<WebServiceRequestHandlerDelegate>)delegate {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    DLog(@"%@\n%@ %@", task.response.URL.absoluteString, [delegate class], responseObject);
    if (delegate && [delegate respondsToSelector:@selector(webServiceRequested:parsed:)]) {
        [delegate webServiceRequested:task parsed:responseObject];
    }
}

- (void)requestFailed:(NSURLSessionDataTask *)task error:(NSError *)error delegate:(id<WebServiceRequestHandlerDelegate>)delegate {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    DLog(@"%@ %@ %ld %@", task.response.URL.absoluteString, [delegate class], (long)error.code, error.localizedDescription);
    if (delegate && [delegate respondsToSelector:@selector(webServiceRequestFailed:error:)]) {
        [delegate webServiceRequestFailed:task error:error];
    }
}
@end
