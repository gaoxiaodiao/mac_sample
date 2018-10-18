//
//  ViewController.m
//  test
//
//  Created by Ben Gao (RD-CN) on 17/10/18.
//  Copyright © 2018年 Ben Gao (RD-CN). All rights reserved.
//

#import "ViewController.h"

@interface ViewController(){
    __weak IBOutlet NSSlider *slider;
    __weak IBOutlet NSClipView *clipView;
    __weak IBOutlet testView *childView;
}


@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    slider.minValue = 0;
    slider.maxValue = NSWidth(childView.frame);
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)changed:(NSSlider *)sender {
    NSRect bounds = NSMakeRect(sender.doubleValue,
                               NSMinY(clipView.bounds),
                               NSWidth(clipView.bounds),
                               NSHeight(clipView.bounds));
    [clipView setValue:@(bounds) forKey:@"bounds"];
}



@end
