//
//  main.m
//  convertSVG
//
//  Created by Noah Spies on 3/6/15.
//  Copyright (c) 2015 Noah Spies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewConverter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSApplication *app = [NSApplication sharedApplication];
        
        WebViewConverter *converter = [WebViewConverter new];
        [converter run];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
