//
//  testView.m
//  test
//
//  Created by Ben Gao (RD-CN) on 17/10/18.
//  Copyright © 2018年 Ben Gao (RD-CN). All rights reserved.
//

#import "testView.h"
@interface testView(){
    NSRect colorRects[7];
    NSColor *colors[7];
}


@end
@implementation testView

-(void)initColors{
    colors[0] = [NSColor redColor];
    colors[1] = [NSColor systemOrangeColor];
    colors[2] = [NSColor systemYellowColor];
    colors[3] = [NSColor systemGreenColor];
    colors[4] = [NSColor colorWithSRGBRed:25/255.0  green:124/255.0 blue:176/255.0 alpha:1];
    colors[5] = [NSColor systemBlueColor];
    colors[6] = [NSColor systemPurpleColor];
    
    for(int i=0; i<7; ++i){
        colorRects[i] = NSMakeRect(i*400, 0, 400, NSHeight(self.frame));
    }
}

-(void)drawBoundRect:(NSRect)rect color:(NSColor*)color{
    NSBezierPath *bezierPath = [NSBezierPath bezierPathWithRect:rect];
    [color setFill];
    [bezierPath fill];
}


-(instancetype)initWithCoder:(NSCoder *)decoder{
    self = [super initWithCoder:decoder];
    if(self){
        //self.wantsLayer = YES;
        //self.layer.backgroundColor = [NSColor redColor].CGColor;
        [self initColors];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    for(int i=0; i<7; i++){
        [self drawBoundRect:colorRects[i] color:colors[i]];
    }
    
    // Drawing code here.
}



-(void)printRect:(NSRect)rect{
    printf("%lf %lf\n",NSMinX(rect),NSMinY(rect));
}
-(void)printInfo:(NSString*)str view:(NSView *)view{
    printf("self frame:");
    [self printRect:view.frame];
    printf("self bounds:");
    [self printRect:view.bounds];
}

-(void)scrollWheel:(NSEvent *)event{
    [super scrollWheel:event];
    NSView * surperView = self.superview;
    [self printInfo:@"" view:surperView];
    
    //[self printInfo:ssView];
    
    
}

@end
