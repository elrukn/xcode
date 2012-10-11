//
//  AppDelegate.h
//  Goldy
//
//  Created by Cristian Barbu on 10/11/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSApplication <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (retain) id monitor;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
