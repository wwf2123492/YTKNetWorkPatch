//
//  AFHTTPRequestOperation.m
//  JdShopOnline
//
//  Created by cdyjy-cdwutao3 on 16/5/19.
//  Copyright © 2016年 jd. All rights reserved.
//

#import "AFHTTPRequestOperation.h"

@implementation AFHTTPRequestOperation

-(NSURLResponse*) response {
    return self.task.response;
}
-(BOOL)isExecuting {
    return self.task.state == NSURLSessionTaskStateRunning;
}
-(id)responseObject {
    return _responseObj;
}

-(NSString *)responseString{
    if(!self.responseObj) {
        return nil;
    }
    NSString *jsonString = nil;
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.responseObj
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

- (NSInteger)responseStatusCode{
    if([self.task.response isKindOfClass:[NSHTTPURLResponse class]]){
        NSHTTPURLResponse* realResponse = (NSHTTPURLResponse* )self.task.response;
        return realResponse.statusCode;
    }
    return -1;
}

- (NSDictionary *)responseHeaders {
    if([self.task.response isKindOfClass:[NSHTTPURLResponse class]]){
        NSHTTPURLResponse* realResponse = (NSHTTPURLResponse* )self.task.response;
        return realResponse.allHeaderFields;
    }
    return nil;
}

-(void)cancel {
    [self.task cancel];
}

- (NSUInteger)hash {
    return self.task.taskIdentifier;
}
@end
