//
//  ViewController.m
//  NSBundleSample
//
//  Created by Ben Gao (RD-CN) on 15/10/18.
//  Copyright © 2018年 Ben Gao (RD-CN). All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)clicked:(id)sender {
    NSBundle * mainBundle = [NSBundle mainBundle];
    
    NSDictionary *plist = [mainBundle infoDictionary];
    NSLog(@"%@",plist);
    
    
    NSBundle * classBundle = [NSBundle bundleForClass:[NSBundle class]];
    
    [mainBundle loadNibNamed:@"testWindowController" owner:nil topLevelObjects:nil];
    
}

@end
