//
//  CustomCell1.m
//  Animated Table
//
//  Created by Philip Yu on 4/18/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import "CustomCell1.h"

// Example Cell
#define defaultPadding 5
#define sizeCellWidth 310
#define sizeCellHeight 80
#define sizePicture 50
#define sizeTitleWidth 200
#define sizeTitleheight 20

@implementation CustomCell1

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // User customization
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(defaultPadding, defaultPadding,
                                                                 sizeCellWidth, sizeCellHeight)];
        bgView.backgroundColor = [UIColor grayColor];
        
        UIView *picture = [[UIView alloc] initWithFrame:CGRectMake(defaultPadding, defaultPadding, sizePicture, sizePicture)];
        picture.backgroundColor = [UIColor blackColor];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(picture.frame.origin.x + picture.frame.size.width + defaultPadding, defaultPadding, sizeTitleWidth, sizeTitleheight)];
        title.text = @"Title";
        
        [self.atcContentView addSubview:bgView];
        [bgView addSubview:title];
        [bgView addSubview:picture];
    }
    return self;
}

@end
