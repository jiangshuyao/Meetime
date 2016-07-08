//
//  ViewController.m
//  JavaScripetext
//
//  Created by Rongheng on 16/4/20.
//  Copyright © 2016年 Rongheng. All rights reserved.
//

#import "ViewController.h"
#import "ShopCarViewController.h"

@interface ViewController ()<UIWebViewDelegate,UIAlertViewDelegate>

@end

@implementation ViewController
{
    UIWebView *JSWebview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JSWebview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:JSWebview];
    JSWebview.delegate = self;
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"About" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    [JSWebview loadHTMLString:htmlString baseURL:baseURL];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    if([[url scheme] isEqualToString:@"devzeng"]) {
        //处理JavaScript和Objective-C交互
        if([[url host] isEqualToString:@"login"])
        {
            //获取URL上面的参数
            NSString *params = [url query];
            
            if(params)
            {
                //调用JS回调
                //[webView stringByEvaluatingJavaScriptFromString:@"alert('登录成功!')"];
                [[[UIAlertView alloc]initWithTitle:@"点击了JS" message:@"准备跳转" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil]show];
            }
            else
            {
                [webView stringByEvaluatingJavaScriptFromString:@"alert('登录失败!')"];
            }
        }
        return NO;
    }

    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        ShopCarViewController *shopCar = [[ShopCarViewController alloc] init];
        [self.navigationController pushViewController:shopCar animated:YES];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
