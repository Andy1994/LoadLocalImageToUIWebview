//
//  BLDownloadImageManager.m
//  HappyHoliday
//
//  Created by Double on 15/11/7.
//  Copyright © 2015年 Wdabo. All rights reserved.
//

#import "BLDownloadImageManager.h"
#import "BLMediasModel.h"

@implementation BLDownloadImageManager

+ (instancetype)shareDownloadImageManager
{
    return [[BLDownloadImageManager alloc] init];
}

- (void)downloadImageWithURL:(NSArray *)models
{
    for(int i=0;i<models.count;i++)
    {
        BLFeaturedModel *model = models[i];
        [self downloadImageWithFeaturedModel:model];
    }
}

- (void)downloadImageWithFeaturedModel:(BLFeaturedModel *)model
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    for(int j=0;j<model.content_medias.count;j++)
    {
        BLMediasModel *mediaModel = model.content_medias[j];
        
        if(![[NSFileManager defaultManager] fileExistsAtPath:[mediaModel.url webImageCachePath]])
        {
            [manager downloadImageWithURL:[NSURL URLWithString:mediaModel.url] options:SDWebImageLowPriority progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                //将UIImage保存到本地文件
                [[NSString stringWithFormat:@"%@",imageURL] saveJpgWithImage:image];
                image = nil;
                [[SDImageCache sharedImageCache] clearMemory];
            }];
        }
    }
}

@end
