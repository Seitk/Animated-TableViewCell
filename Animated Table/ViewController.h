//
//  ViewController.h
//  Animated Table
//
//  Created by Philip Yu on 4/17/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    bool tableAnimated;
}

@property (nonatomic,strong) UITableView *table;

@end
