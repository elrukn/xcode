//
//  TableViewController.h
//  Test3
//
//  Created by Cristian Barbu on 1/18/13.
//  Copyright (c) 2013 Cristian Barbu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewController : NSObject <NSTableViewDataSource> {
@private
    IBOutlet NSTableView *tableView;
    NSMutableArray *list;
}

-(IBAction)add:(id)sender;
@end
