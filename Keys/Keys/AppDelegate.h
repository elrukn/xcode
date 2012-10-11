//
//  AppDelegate.h
//  Keys
//
//  Created by Cristian Barbu on 10/11/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> 

@property (assign) IBOutlet NSWindow *window;

@property (readwrite) NSDateFormatter *logDateFormatter;

@property (strong) IBOutlet NSTextView *textOutput;


@end
