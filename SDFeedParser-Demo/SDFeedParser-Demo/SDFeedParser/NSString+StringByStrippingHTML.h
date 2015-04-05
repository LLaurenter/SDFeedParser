//
//  NSString+StringByStrippingHTML.h
//  SDFeedParser-Demo
//
//  Created by Peter Foti on 9/4/14.
//  Copyright (c) 2014 Louis Laurent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringByStrippingHTML)

+ (NSString *)stringByStrippingHTML:(NSString *)string;

@end
