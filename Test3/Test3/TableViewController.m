//
//  TableViewController.m
//  Test3
//
//  Created by Cristian Barbu on 1/18/13.
//  Copyright (c) 2013 Cristian Barbu. All rights reserved.
//

#import "TableViewController.h"
#import "Attribute.h"

@implementation TableViewController

-(id)init {
    self = [super init];
    if (self) {
        list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [list count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Attribute *a = [list objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    
    return [a valueForKey:identifier];
}

-(void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    Attribute *a = [list objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    [a setValue:object forKey:identifier];
    
}

-(IBAction)add:(id)sender {
    [list addObject:[[Attribute alloc] init]];
    [tableView reloadData];
}

@end
