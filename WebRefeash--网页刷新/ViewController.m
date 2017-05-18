//
//  ViewController.m
//  WebRefeash--网页刷新
//
//  Created by JM Zhao on 16/7/13.
//  Copyright © 2016年 yijia. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#define WEBURL @"https://www.baidu.com"

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView * webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSLog(@"刷新");
    }];
    
    
    [self createWebURL:WEBURL];
    [self example31];
}

- (void)example31
{
    __unsafe_unretained UIWebView *webView = self.webView;
    webView.delegate = self;
    
    __unsafe_unretained UIScrollView *scrollView = self.webView.scrollView;
    
    // 添加下拉刷新控件
    scrollView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        [webView reload];
    }];
}

- (void)createWebURL:(NSString *)webURL{
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    _webView.frame = self.view.frame;
    _webView.delegate = self;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    [self.view addSubview:_webView];
    [self.webView loadRequest:request];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView.scrollView.mj_header endRefreshing];
}

@end
