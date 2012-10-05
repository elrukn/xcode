//
//  JsonHelper.h
//  Wallpapers
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonHelper : NSObject {
    NSArray *objects;
}

-(NSArray *)getJson:(NSString *)url;
@end
