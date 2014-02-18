//
//  RaoToggle.h
//  HealthBarAnimation
//
//  Created by Cocos on 2/18/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface RaoToggle : CCLayer {
    CCSprite *togglePad;
    CCSprite *toggleHadle;
    BOOL togglePadTouched;
    BOOL toggleHandleTouched;
    BOOL buttonOn;
    CGPoint offPosition;
    CGPoint onPosition;
}
-(id)init;
-(BOOL)getOnOff;
@end
