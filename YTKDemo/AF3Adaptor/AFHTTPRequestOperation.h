//
//  AFHTTPRequestOperation.h
//  JdShopOnline
//
//  Created by cdyjy-cdwutao3 on 16/5/19.
//  Copyright © 2016年 jd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFHTTPRequestOperation : NSObject
@property (strong,nonatomic) NSURLSessionTask* task;
@property (strong,nonatomic) id responseObj;

@property (strong,nonatomic) NSError* error;

-(NSURLResponse*) response;

-(BOOL)isExecuting;

-(id)responseObject;

-(NSString *)responseString;

- (NSInteger)responseStatusCode;

- (NSDictionary *)responseHeaders;

-(void)cancel;

- (NSUInteger)hash;
@end
