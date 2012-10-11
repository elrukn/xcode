//
//  AppDelegate.m
//  Keys
//
//  Created by Cristian Barbu on 10/11/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize textOutput;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.logDateFormatter = [[NSDateFormatter alloc] init];
    [self.logDateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    // Insert code here to initialize your application
    //get events
    id monitorLeftMouseDown;
    id monitorLeftMouseUp;
    
    
    monitorLeftMouseDown = [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseDownMask handler:^(NSEvent *evt) {
        [self output:[NSString stringWithFormat:@"Left mouse down!"]];
        //self.leftMouseCounter = [NSNumber numberWithInt:(1 + [self.leftMouseCounter intValue])];
    }];
    
}

-(void)output:(NSString *)text {
    NSPoint position = [NSEvent mouseLocation];
    [textOutput setString:[[textOutput string] stringByAppendingFormat:@"%@: %@, %.2f:%.2f\n", [self.logDateFormatter stringFromDate:[NSDate date]],  text, position.x, position.y]];
}

@end
