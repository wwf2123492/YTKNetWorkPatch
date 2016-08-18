//
//  AFHTTPRequestOperationManager.h
//  JdShopOnline
//
//  Created by cdyjy-cdwutao3 on 16/5/19.
//  Copyright © 2016年 jd. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperation.h"

@interface AFHTTPRequestOperationManager : NSObject;

@property (nonatomic, strong) AFHTTPRequestSerializer  * requestSerializer;

+ (AFHTTPRequestOperationManager*)manager;

-(NSOperationQueue*)operationQueue;


//- (NSURLSessionDataTask *)GET:(NSString *)URLString
//                   parameters:(id)parameters
//                      success:
//                      failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;


-(AFHTTPRequestOperation*)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;


-(AFHTTPRequestOperation*) POST:url
                     parameters:param
      constructingBodyWithBlock:constructingBlock
                        success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;


-(AFHTTPRequestOperation*) POST:url
                     parameters:param
                        success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;

-(AFHTTPRequestOperation*) HEAD:url
                     parameters:param
                        success:(void (^)(AFHTTPRequestOperation *task))success
                        failure:(void (^)(AFHTTPRequestOperation *task,NSError *error))failure;


-(AFHTTPRequestOperation*) PUT:url
                    parameters:param
                       success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                       failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;

-(AFHTTPRequestOperation*) DELETE:url
                       parameters:param
                          success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                          failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;

-(AFHTTPRequestOperation*) PATCH:url parameters:param success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;
@end
