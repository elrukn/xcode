//
//  Attribute.h
//  Test3
//
//  Created by Cristian Barbu on 1/18/13.
//  Copyright (c) 2013 Cristian Barbu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Attribute : NSObject {
@private
    NSString *name;
    NSString *value;
}

@property (copy) NSString *name;
@property (copy) NSString *value;

@end
