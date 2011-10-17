//
//  BPDataMgr.h
//  ScratchApp
//
//  Created by Brian Pfeil on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPDataMgr : NSObject {
    NSDictionary *_data;
}

+ (BPDataMgr*)sharedInstance;
- (NSDictionary*)data;
- (id)valueForKeyPath:(NSString*)path;

@end
