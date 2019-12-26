//
//  MeliService.m
//  MeliAppRest
//
//  Created by marcos vissio on 23/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "MeliService.h"
#import "AFNetworking.h"

@implementation MeliService

// Class method to search an entered field
+ (void) getProduct:(NSURL *)baseURL andResources: (NSString *)path andSuccesBlock:(void(^)(id response))successBlock andFailureBlock:(void(^)(NSError *))errorBlock{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
    
    [manager GET:path
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        errorBlock(error);
    }];
}

@end
