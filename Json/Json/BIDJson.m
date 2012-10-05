//
//  BIDJson.m
//  Json
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import "BIDJson.h"

@implementation BIDJson

@synthesize jsonURL;

- (id)init
{
    self = [super init];
    if (self) {
        //NSLog(@"HERE");
    }
    return self;
}

-(NSArray *)getJson:(NSString *)url {
    if (url != nil) {
//        NSArray *array;
        
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://localhost/ios/list.php"]];
        if (jsonData != nil) {
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
            
            if ([jsonObjects isKindOfClass:[NSArray class]] ) {
//                NSLog(@"NSArray");
//                NSLog(@"objects : %d", [jsonObjects count]);
                return jsonObjects;
            } else if ([jsonObjects isKindOfClass:[NSDictionary class]]) {
                NSArray *array = [[NSArray alloc] initWithObjects:jsonObjects, nil];
                return array;
            } else {
//                NSLog(@"WTF!?");
                return nil;
            }
        } else return nil;
    } else return nil;
}
@end
