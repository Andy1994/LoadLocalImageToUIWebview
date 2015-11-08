//
//  BLDownloadImageManager.h
//  HappyHoliday
//
//  Created by Double on 15/11/7.
//  Copyright © 2015年 Wdabo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLFeaturedModel.h"

@interface BLDownloadImageManager : NSObject

+ (instancetype)shareDownloadImageManager;

- (void)downloadImageWithURL:(NSArray *)models;

- (void)downloadImageWithFeaturedModel:(BLFeaturedModel *)model;

@end
