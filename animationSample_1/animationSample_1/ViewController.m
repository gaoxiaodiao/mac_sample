//
//  ViewController.m
//  animationSample_1
//
//  Created by Ben Gao (RD-CN) on 8/10/18.
//  Copyright © 2018年 Ben Gao (RD-CN). All rights reserved.
//

#import "ViewController.h"
@interface ViewController()
@property (weak) IBOutlet NSView *mobileView;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


-(void)startAnimation:(id)animationTarget endPoint:(NSPoint)endPoint{
    NSRect startFrame = [animationTarget frame];
    NSRect endFrame = NSMakeRect(endPoint.x, endPoint.y, startFrame.size.width, startFrame.size.height);
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                
                                animationTarget,NSViewAnimationTargetKey,
                                
                                NSViewAnimationFadeOutEffect,NSViewAnimationEffectKey,
                                
                                [NSValue valueWithRect:startFrame],NSViewAnimationStartFrameKey,
                                
                                [NSValue valueWithRect:endFrame],NSViewAnimationEndFrameKey, nil];
    
    NSViewAnimation *animation = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObject:dictionary]];
    animation.delegate = self;
    animation.duration = 2;
    //NSAnimationBlocking阻塞
    //NSAnimationNonblocking异步不阻塞
    //NSAnimationNonblockingThreaded线程不阻塞
    [animation setAnimationBlockingMode:NSAnimationNonblocking];
    [animation startAnimation];
}

- (IBAction)up:(id)sender {
    CGFloat upX = NSMinX(_mobileView.frame);
    CGFloat upY = NSMaxY(self.view.frame)-NSHeight(_mobileView.frame);
    NSPoint endPoint = NSMakePoint(upX, upY);
    [self startAnimation:_mobileView endPoint:endPoint];
}

- (IBAction)down:(id)sender {
    CGFloat x = NSMinX(_mobileView.frame);
    CGFloat y = 0;
    NSPoint endPoint = NSMakePoint(x, y);
    [self startAnimation:_mobileView endPoint:endPoint];
}

- (IBAction)left:(id)sender {
    CGFloat x = 0;
    CGFloat y = NSMinY(_mobileView.frame);
    NSPoint endPoint = NSMakePoint(x, y);
    [self startAnimation:_mobileView endPoint:endPoint];
}

- (IBAction)right:(id)sender {
    CGFloat x = NSMaxX(self.view.frame)-NSWidth(_mobileView.frame);
    CGFloat y = NSMinY(_mobileView.frame);
    NSPoint endPoint = NSMakePoint(x, y);
    [self startAnimation:_mobileView endPoint:endPoint];
}
- (IBAction)center:(id)sender {
    CGFloat x = NSMidX(self.view.frame)-NSWidth(_mobileView.frame)/2;
    CGFloat y = NSMidY(self.view.frame)-NSHeight(_mobileView.frame)/2;
    NSPoint endPoint = NSMakePoint(x, y);
    [self startAnimation:_mobileView endPoint:endPoint];
    
    
}


- (void)animationDidEnd:(NSAnimation*)animation
{
    NSLog(@"%d",[[NSThread currentThread] isMainThread]);
    NSLog(@"The animation did end !");
}
@end
