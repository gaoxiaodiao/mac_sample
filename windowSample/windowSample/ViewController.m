//
//  ViewController.m
//  windowSample
//
//  Created by Ben Gao (RD-CN) on 8/10/18.
//  Copyright © 2018年 Ben Gao (RD-CN). All rights reserved.
//

#import "ViewController.h"
#import "testWindowController.h"
@interface ViewController(){
    testWindowController * twc;
    NSModalSession sessionCode;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    twc = [[testWindowController alloc] initWithWindowNibName:@"testWindowController"];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowWillClose:)
                                                 name:NSWindowWillCloseNotification
                                               object:nil];
    
}


- (IBAction)func1:(id)sender {
    sessionCode = 0;
    testWindowController * twc = [[testWindowController alloc] initWithWindowNibName:@"testWindowController"];
    [twc showWindow:nil];
}

- (IBAction)func2:(id)sender {
    sessionCode = 0;
    [[NSApplication sharedApplication] runModalForWindow:twc.window];
}

- (IBAction)func3:(id)sender {
    sessionCode = [[NSApplication sharedApplication] beginModalSessionForWindow:twc.window];
}

- (void)windowWillClose:(NSNotification *)notification {
    
    [[NSApplication sharedApplication] stopModal];
    
    if (sessionCode != 0) {
        [[NSApplication sharedApplication]endModalSession:sessionCode];
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



@end
