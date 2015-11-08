//
//  NSString+BLStringCategory.m
//  HappyHoliday
//
//  Created by Double on 15/11/7.
//  Copyright © 2015年 Wdabo. All rights reserved.
//

#import "NSString+BLStringCategory.h"

@implementation NSString (BLStringCategory)

- (float) heightWithFont: (UIFont *) font withinWidth: (float) width
{
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil];
    
    return textRect.size.height;
}

- (float) widthWithFont: (UIFont *) font
{
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, font.pointSize)
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil];
    
    return textRect.size.width;
}

- (NSString *)toURL
{
    return [NSString stringWithFormat:@"&city=%@",[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

- (void)saveJpgWithImage:(UIImage *)image
{
    [UIImageJPEGRepresentation(image,1.0) writeToFile:[self webImageCachePath] atomically:YES];
//    NSLog(@"Download To %@",[self webImageCachePath]);
}

- (NSString *)webImageCachePath
{
    NSString *fileName = [[self componentsSeparatedByString:@"/"] lastObject];
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/%@",fileName]];
}

@end
