//
//  BIDJson.h
//  Json
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDJson : NSObject {
    NSArray *objects;
}

@property (strong, nonatomic) NSString *jsonURL;

-(NSArray *)getJson:(NSString *)url;

@end
