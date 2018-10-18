//
//  ViewController.m
//  ImageViewSample
//
//  Created by Ben Gao (RD-CN) on 12/10/18.
//  Copyright © 2018年 Ben Gao (RD-CN). All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

-(void)addImageView{
    NSImageView *testImageView = [[NSImageView alloc] init];
    
    NSRect curViewFrame = self.view.frame;
    CGFloat myFrameX = NSMidX(curViewFrame);//-NSWidth(curViewFrame)/2;
    CGFloat myFrameY = NSMidY(curViewFrame);//-NSHeight(curViewFrame)/2;
    
    testImageView.frame = NSMakeRect(10, 10, 500, 500);
    
    testImageView.imageFrameStyle = NSImageFramePhoto;
    testImageView.image = [NSImage imageNamed:@"QR_code"];
    testImageView.imageScaling = NSImageScaleNone;
    
    //图片内容对于ImageView内的位置
    testImageView.imageAlignment = NSImageAlignCenter;
    
    //能否直接将图片拖到一个NSImageView类里
    [testImageView setEditable:YES];
    
    //能否对图片内容进行剪切、复制、粘贴行操作
    [testImageView setAllowsCutCopyPaste:YES];

    [self.view addSubview:testImageView];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self addImageView];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
