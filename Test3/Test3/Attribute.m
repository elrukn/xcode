//
//  Attribute.m
//  Test3
//
//  Created by Cristian Barbu on 1/18/13.
//  Copyright (c) 2013 Cristian Barbu. All rights reserved.
//

#import "Attribute.h"

@implementation Attribute

@synthesize name;
@synthesize value;

-(id) init {
    self = [super init];
    if (self) {
        name  = @"default_name";
        value = @"default_value";
    }
    
    return self;
}

@end
