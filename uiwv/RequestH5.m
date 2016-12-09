//
//  getRequest.m
//  uiwv
//
//  Created by 高志强 on 2016/12/8.
//  Copyright © 2016年 高志强. All rights reserved.
//

#import "RequestH5.h"
@interface RequestH5 ()
@property (nonatomic, strong) UIViewController* target;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSData *receiveData;
@property (nonatomic, strong) NSDictionary *callback;
@end

@implementation RequestH5
-(void)get:(NSString *)strURL
    target:(UIViewController*)targetObject
      name:(NSString *)nameString{
    self.target = targetObject;
    self.name = nameString;
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:request
                                   delegate:self];
};
-(void)post:(NSString *)strURL
    postStr:(NSString*)postData
     target:(UIViewController*)targetObject
       name:(NSString *)nameString{
    self.target = targetObject;
    self.name = nameString;

    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSData *sendData = [postData dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:sendData];
    
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:request
                                   delegate:self];
};
#pragma mark- NSURLConnection 回调方法
- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData");
    self.receiveData=data;
}


-(void) connection:(NSURLConnection *)connection
  didFailWithError: (NSError *)error {
    
    NSLog(@"%@",[error localizedDescription]);
}

- (void) connectionDidFinishLoading: (NSURLConnection*) connection {
    NSLog(@"请求完成...");
    self.callback = [NSJSONSerialization JSONObjectWithData:self.receiveData
                                                    options:NSJSONReadingAllowFragments
                                                      error:nil];
    NSLog(@"%@", self.callback);
    [self.target getCallBack:self.name callBackJSON:self.callback];
}
@end
