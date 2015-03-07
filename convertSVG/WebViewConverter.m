//
//  WebViewConverter.m
//  convertSVG
//
//  Created by Noah Spies on 3/6/15.
//  Copyright (c) 2015 Noah Spies. All rights reserved.
//

#import "WebViewConverter.h"

@implementation WebViewConverter

- (id) init {
    
    if ( self = [super init] )
    {
        wview = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, 1, 1) frameName:@"myFrame" groupName:@"myGroup"];
        window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0,0,800,1)
                                                       styleMask:NSBorderlessWindowMask
                                                         backing:NSBackingStoreRetained
                                                           defer:false];
        [wview setFrameLoadDelegate:self];
        [window setContentView:wview];
        
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        
        inputURL = [NSURL URLWithString:[arguments objectAtIndex:1]];
        outputURL = [NSURL fileURLWithPath:[arguments objectAtIndex:2]];
    }
    return self;
}
- (void)run {
    NSURLRequest *req = [NSURLRequest requestWithURL:inputURL];
    [[wview mainFrame] loadRequest:req];
}

- (void) webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame{
    NSError *error;
    NSView *viewToPrint = frame.frameView.documentView;
    NSRect bounds = [viewToPrint bounds];
    NSData *data = [viewToPrint dataWithPDFInsideRect:bounds];
    [data writeToURL:outputURL options:NSDataWritingAtomic error:&error];
    
    if (error) {
        NSLog(@"Error writing to file: %@", [error description]);
    }
    
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}


- (void) webView:(WebView *)sender didFailLoadWithError:(NSError *)error forFrame:(WebFrame *)frame {
    NSLog(@"Error while loading page: %@", error);
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}
- (void) webView:(WebView *)sender didFailProvisionalLoadWithError:(NSError *)error forFrame:(WebFrame *)frame {
    NSLog(@"Error loading page: %@", error);
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}


@end
