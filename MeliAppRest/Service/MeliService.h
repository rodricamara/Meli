//
//  MeliService.h
//  MeliAppRest
//
//  Created by marcos vissio on 23/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeliService : NSObject

// Class method to search an entered field
+ (void) getProducts:(NSURL *)baseURL andResources: (NSString *)path andSuccesBlock:(void(^)(id response))successBlock andFailureBlock:(void(^)(NSError *))errorBlock;

@end

