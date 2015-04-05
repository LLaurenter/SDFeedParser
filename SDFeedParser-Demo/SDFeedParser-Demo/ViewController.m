//
//  ViewController.m
//  SDFeedParser-Demo
//
//  Created by Louis Laurent on 14/08/14.
//  Copyright (c) 2014 Louis Laurent. All rights reserved.
//

#import "ViewController.h"
#import "SDFeedParser.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    
    SDFeedParser *feedParser = [[SDFeedParser alloc]init];
    [feedParser parseURL:@"http://moma.org/wp/inside_out/api/get_recent_posts/" success:^(NSArray *postsArray, NSInteger postsCount) {
        
        NSLog(@"Fetched %ld posts", postsCount);
        SDpostsArray = postsArray;
        [self.tableView reloadData];
        
    }failure:^(NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return SDpostsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    SDPost *currentPost = [SDpostsArray objectAtIndex:indexPath.row];
    
    UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0.0, 120, 77.0)];
    [cell.contentView addSubview:photo];
    
    cell.textLabel.text = currentPost.title;

    [photo sd_setImageWithURL:[NSURL URLWithString:currentPost.thumbnailURL] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UITableViewCellSelectionStyle selectionStyle = cell.selectionStyle;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setSelected:YES];
        [cell setSelected:NO];
        cell.selectionStyle = selectionStyle;
        CGSize itemSize = CGSizeMake(100, 77);
        UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        [cell.imageView.image drawInRect:imageRect];
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }];
    
    return cell;
}

@end
