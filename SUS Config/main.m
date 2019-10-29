//
//  main.m
//  SUS Config
//
//  Created by Thomas Verschoren on 12/10/13.
//  Copyright (c) 2013 Verschoren. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
