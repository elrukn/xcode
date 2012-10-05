//
//  WallpaperCell.h
//  Wallpapers
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallpaperCell : UITableViewCell

@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *thumb;
@property(copy, nonatomic) NSString *filename;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *filenameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImage;
@property (strong, nonatomic) IBOutlet UILabel *thumbLabel;

@end
