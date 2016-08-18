//
//  ViewController.m
//  YTKDemo
//
//  Created by cdyjy-cdwutao3 on 16/8/18.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "TestRequest.h"







@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestRequest* request = [[TestRequest alloc] init];
    
    [request startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        NSLog(@"success: code:%@\n returnStr:%@ \n \
              ojb:%@]",@(request.responseStatusCode),
               request.responseString,
               request.responseJSONObject);
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"failure: code:%@ \n \
              request:%@",@(request.responseStatusCode),request.requestOperation.task.currentRequest);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
