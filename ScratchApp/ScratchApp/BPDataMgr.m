//
//  BPDataMgr.m
//  ScratchApp
//
//  Created by Brian Pfeil on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BPDataMgr.h"

static BPDataMgr *BPDataMgrSharedInstance = nil;

@implementation BPDataMgr

- (id)init {
    self = [super init];
    if (self) {
        // grab config from data.json
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSString *jsonDataContents = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:dataPath] encoding:NSUTF8StringEncoding error:nil];
        _data = [[jsonDataContents JSONValue] valueForKeyPath:@"data"];
    }
    
    return self;
}

+ (BPDataMgr*)sharedInstance {
    if (!BPDataMgrSharedInstance) {
        BPDataMgrSharedInstance = [[[self class] alloc] init];
    }
    return BPDataMgrSharedInstance;
}

- (NSDictionary*)data {
    return _data;
}

- (id)valueForKeyPath:(NSString*)path {
    return [_data valueForKeyPath:path];
}

@end
