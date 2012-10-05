//
//  BIDViewController.m
//  Json
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDJson.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self testJson];
    BIDJson *json = [[BIDJson alloc] init];
    NSArray *objects = [json getJson:@"http://localhost/ios/list.php"];
    NSLog(@" %@ ", objects);
    
}

-(void)fetchedData:(NSData *)responseData {
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
