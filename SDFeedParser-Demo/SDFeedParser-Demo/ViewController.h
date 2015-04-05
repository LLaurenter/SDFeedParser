//
//  ViewController.h
//  SDFeedParser-Demo
//
//  Created by Louis Laurent on 14/08/14.
//  Copyright (c) 2014 Louis Laurent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *SDpostsArray;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
