//
//  WebViewConverter.h
//  webkitToPDF
//
//  Created by Noah Spies on 3/6/15.
//  Copyright (c) 2015 Noah Spies. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface WebViewConverter : NSObject {
    WebView *wview;
    NSWindow *window;
    NSURL *inputURL;
    NSURL *outputURL;
}
- (void) run;
@end
