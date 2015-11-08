//
//  NSString+BLStringCategory.h
//  HappyHoliday
//
//  Created by Double on 15/11/7.
//  Copyright © 2015年 Wdabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BLStringCategory)

- (float) heightWithFont: (UIFont *) font withinWidth: (float) width;
- (float) widthWithFont: (UIFont *) font;

- (NSString *)toURL;

- (NSString *)webImageCachePath;

- (void)saveJpgWithImage:(UIImage *)image;

@end
