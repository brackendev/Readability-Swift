//
//  SyllableCounter.h
//  WeHaiku
//
//  Created by Anthony Nichols on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RegexKitLite/RegexKitLite.h>

@interface SyllableCounter : NSObject

+ (int)syllableCountForWord:(NSString*)word;
+ (int)syllableCountForWords:(NSString*)words;

@end
