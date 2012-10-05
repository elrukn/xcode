//
//  JsonHelper.m
//  Wallpapers
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper

-(id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSArray *)getJson:(NSString *)url {
    if (url != nil) {
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://localhost/ios/list.php"]];
        if (jsonData != nil) {
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
            
            if ([jsonObjects isKindOfClass:[NSArray class]] ) {
                return jsonObjects;
            } else if ([jsonObjects isKindOfClass:[NSDictionary class]]) {
                NSArray *array = [[NSArray alloc] initWithObjects:jsonObjects, nil];
                return array;
            } else {
                return nil;
            }
        } else return nil;
    } else return nil;
}
@end
