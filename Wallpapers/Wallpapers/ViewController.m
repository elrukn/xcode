//
//  ViewController.m
//  Wallpapers
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import "ViewController.h"
#import "JsonHelper.h"
#import "WallpaperCell.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self getWallpapers];
}

-(void)getWallpapers {
    JsonHelper *json = [[JsonHelper alloc] init];
    wallpapers = [json getJson:@"http://localhost/ios/list.php"];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [wallpapers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellTableIdentifier = @"CellTableIdentifier";
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"WallpaperCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifier];
        nibsRegistered = YES;
    }
    WallpaperCell *cell = [tableView dequeueReusableCellWithIdentifier: CellTableIdentifier];
    
    
     if (cell == nil) {
     cell = [[WallpaperCell alloc]
         initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
     }
    
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowData = [wallpapers objectAtIndex:row];
    cell.name = [rowData objectForKey:@"title"];
    cell.thumb = [rowData objectForKey:@"file"];
    cell.filename = [rowData objectForKey:@"file"];
    
//    cell.color = [rowData objectForKey:@"Color"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 163.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
