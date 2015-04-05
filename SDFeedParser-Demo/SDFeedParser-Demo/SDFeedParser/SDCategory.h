//
//  SDCategory.h
//  SDFeedParser
//
//  Created by Louis Laurent on 18/07/14.
//  Copyright (c) 2014 Louis Laurent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDCategory : NSObject

@property (nonatomic) NSInteger ID;
@property (nonatomic) NSString *slug;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *categoryDescription;
@property (nonatomic) NSInteger parent;
@property (nonatomic) NSInteger postsCount;

@end
