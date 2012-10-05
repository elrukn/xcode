//
//  WallpaperCell.m
//  Wallpapers
//
//  Created by Cristian Barbu on 10/5/12.
//  Copyright (c) 2012 Cristian Barbu. All rights reserved.
//

#import "WallpaperCell.h"

@implementation WallpaperCell

@synthesize name;
@synthesize thumb;
@synthesize filename;

@synthesize nameLabel;
@synthesize filenameLabel;
@synthesize thumbImage;
@synthesize thumbLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(void)setName:(NSString *)n {
    if (![n isEqualToString:name]) {
        name = [n copy];
        
        nameLabel.text = name;
    }
}

-(void)setFilename:(NSString *)n {
    if (![n isEqualToString:filename]) {
        filename = [n copy];
        
        filenameLabel.text = filename;
    }
}

-(void)setThumb:(NSString *)t {
    if (![t isEqualToString:thumb]) {
        thumb = [t copy];
        
        
        NSString *imageUrl = [[NSString alloc] initWithFormat:@"http://localhost/ios/wallpapers/%@",thumb];
        NSString *imageUrlEscaped = [imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        // http://stackoverflow.com/questions/7417257/ios-problem-with-resize-a-uiimage
        thumbImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrlEscaped]]];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
