//
//  AnimatedTableCell.m
//      Animated Table
//
//  Created by Philip Yu on 4/18/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import "AnimatedTableCell.h"
#import "UIView+Positioning.h"

#define animationDelay 0.0
#define defaultDuration 0.5

@implementation AnimatedTableCell
@synthesize atcContentView;
@synthesize popped;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        atcContentView = [[UIView alloc] initWithFrame:CGRectZero];
        [atcContentView resetOriginToTopLeft];
        [self addSubview:atcContentView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void) resetPosition
{
    [atcContentView setCenter:CGPointMake(0, 0)];
}

- (void) configureCellContentSizeWidth:(float) width height:(float)height
{
    [atcContentView setFrame:CGRectMake(0, 0, width, height)];
}


- (void) pushCellWithAnimation:(bool)animated
{
    [self pushCellWithAnimation:animated duration:defaultDuration];
}

- (void) pushCellWithAnimation:(bool)animated direction:(NSString *)direction
{
    [self pushCellWithAnimation:animated duration:defaultDuration direction:direction];
}

- (void) pushCellWithAnimation:(bool)animated duration:(float)duration
{
    if (!animated) duration = 0.0;
    
    [UIView animateWithDuration:duration
                          delay:animationDelay
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{atcContentView.center = CGPointMake(0, 0);}
                     completion:nil];
}

- (void) pushCellWithAnimation:(bool)animated duration:(float)duration direction:(NSString *)direction
{
    if ([direction isEqualToString:@"up"])
    {
        [atcContentView setCenter:CGPointMake(0, -atcContentView.frame.size.height)];
    } else if ([direction isEqualToString:@"down"])
    {
        [atcContentView setCenter:CGPointMake(0, atcContentView.frame.size.height)];
    } else if ([direction isEqualToString:@"left"])
    {
        [atcContentView setCenter:CGPointMake(-atcContentView.frame.size.width, 0)];
    } else if ([direction isEqualToString:@"right"])
    {
        [atcContentView setCenter:CGPointMake(atcContentView.frame.size.width, 0)];
    } else {
        [atcContentView setCenter:CGPointMake(0, -atcContentView.frame.size.height)];
    }
    
    [self pushCellWithAnimation:animated duration:duration];
}


- (void) popCellWithAnimation:(bool)animated
{
    [self popCellWithAnimation:animated duration:defaultDuration];
}

- (void) popCellWithAnimation:(bool)animated duration:(float)duration
{
    popped = YES;
    
    if (!animated) duration = 0.0;
    
    [UIView animateWithDuration:duration
                          delay:animationDelay
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{atcContentView.center = CGPointMake(atcContentView.frame.size.width, 0);}
                     completion:nil];
}


@end
