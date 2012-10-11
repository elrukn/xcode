//
//  AppDelegate.m
//  Events
//
//  Created by Cristian Barbu on 10/11/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

/* 
    TODO:
        - record
            - time of click / key press
            - button press
            - right click press
        - play
        - stop ( recording / playing )
        - reset


*/
#import "AppDelegate.h"

@implementation AppDelegate

@synthesize monitor;
@synthesize recording;
@synthesize positionText;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"position.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"position" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSPoint mouseLoc;
    mouseLoc = [NSEvent mouseLocation];
    
    [data setObject:[NSNumber numberWithFloat:0.0] forKey:@"x"];
    [data setObject:[NSNumber numberWithFloat:0.0] forKey:@"y"];
    
    [data writeToFile:path atomically:YES];
    
    recording = NO;
    [self startMonitoring];
}

-(void)startMonitoring {
    //NSLog(@"start");
    monitor = [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask handler:^(NSEvent *event)
               {
                   [self keyDown:event];
               }];
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseDownMask handler:^(NSEvent *event)
     {
         [self mouseClick:event];
     }];
    
    [NSEvent addGlobalMonitorForEventsMatchingMask:[NSApp eventClass] handler:^(NSEvent *event) {
        [self checkEvent:event];
    }];
}

-(void)checkEvent:(NSEvent *)theEvent {
    NSLog(@"Event: %@", theEvent);
}

-(void)keyDown:(NSEvent *)theEvent {
    NSLog(@"%hu", [theEvent keyCode]);
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"position.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"position" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    
    //set point
    if ([theEvent keyCode] == 120) {
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
        NSPoint mouseLoc;
        mouseLoc = [NSEvent mouseLocation];
        NSScreen *screen = [[NSScreen screens] objectAtIndex:0];
        
        [data setObject:[NSNumber numberWithFloat:mouseLoc.x] forKey:@"x"];
        [data writeToFile:path atomically:YES];
        

        float y = [screen visibleFrame].size.height - mouseLoc.y + 24;
        [data setObject:[NSNumber numberWithFloat:y] forKey:@"y"];
        
        [data writeToFile:path atomically:YES];
        NSLog(@"Set: %.2f %.2f", mouseLoc.x, mouseLoc.y);
        
    }
    //get point
    if ([theEvent keyCode] == 99) {
        NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
        NSString *positionString = [[NSString alloc] initWithFormat:@"%.2f %.2f", [[savedStock objectForKey:@"x"] floatValue], [[savedStock objectForKey:@"y"] floatValue]];
        NSLog(@"Get: %@", positionString);
        [positionText setStringValue:positionString];
    }
    // move to set point
    if ([theEvent keyCode] == 118) {
        [self clickIt];
    }
}

-(void)clickIt {
    //NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"position.plist"]; //3
    
    //NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    
    CGPoint point = CGPointMake([[savedStock objectForKey:@"x"] floatValue], [[savedStock objectForKey:@"y"] floatValue]);
    
    NSString *txt = [[NSString alloc] initWithFormat:@"%.2f.%.2f", [[savedStock objectForKey:@"x"] floatValue], [[savedStock objectForKey:@"y"] floatValue]];
    [positionText setStringValue:[NSString stringWithFormat:@"%@", txt]];
    //CGEventRef theEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDown, point, kCGMouseButtonLeft);
    CGEventRef theEvent = CGEventCreateMouseEvent(NULL, kCGEventMouseMoved, point, kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, theEvent);
    
    CGEventSetType(theEvent, kCGEventLeftMouseUp);
    CGEventPost(kCGHIDEventTap, theEvent);
    
    CGEventSetIntegerValueField(theEvent, kCGMouseEventClickState, 0);
    
    CGEventSetType(theEvent, kCGEventLeftMouseUp);
    CGEventPost(kCGHIDEventTap, theEvent);
    
    CFRelease(theEvent);
}


-(void)fakeClick:(CGPoint )point {

    CGEventRef theEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDown, point, kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, theEvent);
    
    CGEventSetType(theEvent, kCGEventLeftMouseUp);
    CGEventPost(kCGHIDEventTap, theEvent);
    
    CGEventSetIntegerValueField(theEvent, kCGMouseEventClickState, 0);
    
    CGEventSetType(theEvent, kCGEventLeftMouseUp);
    CGEventPost(kCGHIDEventTap, theEvent);
    
    CFRelease(theEvent);
}
-(void)mouseClick:(NSEvent *)theEvent {
    NSPoint mouseLoc;
    mouseLoc = [NSEvent mouseLocation]; //get current mouse position
    NSLog(@"Mouse: %.2f %.2f", mouseLoc.x, mouseLoc.y);
}

@end
