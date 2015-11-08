//
//  BLDetailViewController.m
//  HappyHoliday
//
//  Created by Double on 15/11/7.
//  Copyright © 2015年 Wdabo. All rights reserved.
//

#import "BLDetailViewController.h"
#import "BLMediasModel.h"

@interface BLDetailViewController ()
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation BLDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setModel:(BLFeaturedModel *)model
{
    _model = model;
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(8, 64, ScreenSize.width-16, ScreenSize.height-64)];
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
    
    NSMutableString *htmlString = [[NSMutableString alloc] initWithString:model.content];
    
    for(int i=0;i<model.content_medias.count;i++)
    {
        BLMediasModel *mediaModel = model.content_medias[i];
        //取得文件的绝对路径
        NSString *imageURL;
        if([[NSFileManager defaultManager] fileExistsAtPath:[mediaModel.url webImageCachePath]])
        {
            imageURL = [NSString stringWithFormat:@"file://%@/%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"],[[mediaModel.url componentsSeparatedByString:@"/"] lastObject]];
        }
        else imageURL = mediaModel.url;
            
        NSRange range = [htmlString rangeOfString:@"html_content_loading.png"];
        [htmlString replaceCharactersInRange:range withString:[NSString stringWithFormat:@"%@",imageURL]];
    }
    
    [_webView loadHTMLString:htmlString baseURL:nil];
}

- (void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//    for(int i=0;i<model.content_medias.count;i++)
//    {
//        BLMediasModel *mediaModel = model.content_medias[i];
//        NSString *imageURL = [mediaModel.url webImageCachePath];
//        //NSString *abURL = [[SDImageCache sharedImageCache] defaultCachePathForKey:imageURL];
//
//        NSString *js = [NSString stringWithFormat:@"var imgArray = document.getElementsByTagName('img'); imgArray[%d].src=\"%@\"; " ,i,imageURL];
//        [_webView stringByEvaluatingJavaScriptFromString:js];
//    }
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:path];
//    NSLog(@"%@",baseURL);
//NSString *cachePath = [NSString stringWithFormat:@"file://%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/"]];

@end
