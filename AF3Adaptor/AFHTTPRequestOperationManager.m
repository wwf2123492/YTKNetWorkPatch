//
//  AFHTTPRequestOperationManager.m
//  JdShopOnline
//
//  Created by cdyjy-cdwutao3 on 16/5/19.
//  Copyright © 2016年 jd. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
@interface AFHTTPRequestOperationManager() {
    
}
@property(strong,nonatomic) AFHTTPSessionManager* sessionManager;
@end

@implementation AFHTTPRequestOperationManager
+ (AFHTTPRequestOperationManager*)manager {
    AFHTTPRequestOperationManager* manager =[[AFHTTPRequestOperationManager alloc] init];
    manager.sessionManager = [AFHTTPSessionManager manager];
    return manager;
}

-(NSOperationQueue*)operationQueue {
    return self.sessionManager.operationQueue;
}

-(void)setRequestSerializer:(AFHTTPRequestSerializer *)requestSerializer{
    self.sessionManager.requestSerializer = requestSerializer;
}


-(AFHTTPRequestOperation*)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure{
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] init];
    operation.task = [self.sessionManager GET:URLString
                                   parameters:parameters
                                     progress:nil
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          operation.responseObj = responseObject;
                                          success(operation,responseObject);
                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                          failure(operation,error);
                    }];
    return operation;
}

-(AFHTTPRequestOperation*) POST:url
                     parameters:param
      constructingBodyWithBlock:constructingBlock
                        success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure{
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] init];
    operation.task = [self.sessionManager POST:url
                                    parameters:param
                     constructingBodyWithBlock:constructingBlock
                                      progress:nil
                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                           operation.responseObj = responseObject;
                                           success(operation,responseObject);
                                       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           failure(operation,error);
                                       }];
    return operation;
}


-(AFHTTPRequestOperation*) POST:url
                     parameters:param
                        success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure {
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] init];
    operation.task = [self.sessionManager POST:url parameters:param
                                      progress:nil
                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                           operation.responseObj = responseObject;
                                           success(operation,responseObject);
                                       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           failure(operation,error);
                                       }];
    return operation;
}

-(AFHTTPRequestOperation*) HEAD:url parameters:param
                        success:(void (^)(AFHTTPRequestOperation *task))success
                        failure:(void (^)(AFHTTPRequestOperation *task,NSError *error))failure{
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] init];
    operation.task = [self.sessionManager HEAD:url
                                    parameters:param success:^(NSURLSessionDataTask * _Nonnull task) {
                                        success(operation);
                                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                        failure(operation,error);
                                    }];
    return operation;
}

-(AFHTTPRequestOperation*) PUT:url
                    parameters:param
                       success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                       failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure {
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] init];
    operation.task = [self.sessionManager PUT:url
                                   parameters:param
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          operation.responseObj = responseObject;
                                          success(operation,responseObject);
                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                          failure(operation,error);
                                      }];
    return operation;
}


-(AFHTTPRequestOperation*) DELETE:url
                       parameters:param
                          success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                          failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure{
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] init];
    operation.task = [self.sessionManager DELETE:url
                                   parameters:param
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          operation.responseObj = responseObject;
                                          success(operation,responseObject);
                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                        failure(operation,error);
                                      }];
    return operation;
}

-(AFHTTPRequestOperation*) PATCH:url parameters:param success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure {
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] init];
    operation.task = [self.sessionManager PATCH:url
                                      parameters:param
                                         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                             operation.responseObj = responseObject;
                                             success(operation,responseObject);
                                         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                             failure(operation,error);
                                         }];
    return operation;
}
@end
