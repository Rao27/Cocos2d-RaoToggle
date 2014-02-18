//
//  RaoToggle.m
//  HealthBarAnimation
//
//  Created by Cocos on 2/18/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "RaoToggle.h"


@implementation RaoToggle
-(id)init{
    if (self=[super init]) {
        buttonOn=NO;
        togglePad = [CCSprite spriteWithFile:@"ToggleButtonBG.png"];
        togglePad.position=ccp(togglePad.contentSize.width/2, togglePad.contentSize.height/2);
        [self addChild:togglePad];
        toggleHadle = [CCSprite spriteWithFile:@"ToggleButtonHandle.png"];
        toggleHadle.position=ccp(togglePad.position.x-toggleHadle.contentSize.width/2, togglePad.position.y+1);
        offPosition=toggleHadle.position;
        onPosition=offPosition;
        onPosition.x+=toggleHadle.contentSize.width;
        [self addChild:toggleHadle];
        self.isTouchEnabled=YES;
    }
    return self;
}
#pragma mark-Touch
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CCDirector* director = [CCDirector sharedDirector];
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:director.view];
    CGPoint locationGL = [director convertToGL:touchLocation];
    
    CGPoint locationInNodeSpace = [toggleHadle convertToNodeSpace:locationGL];
    if (CGRectContainsPoint([toggleHadle textureRect], locationInNodeSpace)) {
        toggleHandleTouched=YES;
    }
    CGPoint locationInNodeSpace1 = [togglePad convertToNodeSpace:locationGL];
    if (CGRectContainsPoint([togglePad textureRect], locationInNodeSpace1)) {
        togglePadTouched=YES;
    }
}
-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (toggleHandleTouched) {
        togglePadTouched=NO;
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        location.x-=self.position.x;
        location.y-=self.position.y;
        if (location.x >= offPosition.x  && location.x <= onPosition.x) {
            toggleHadle.position=ccp(location.x, toggleHadle.position.y);
        }
    }
    
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (togglePadTouched) {
        if (buttonOn) {
            //make button off
            buttonOn=NO;
            [toggleHadle runAction:[CCMoveTo actionWithDuration:0.5 position:offPosition]];
        }else{
            //make button on
            buttonOn=YES;
            [toggleHadle runAction:[CCMoveTo actionWithDuration:0.5 position:onPosition]];
        }
    }else if(toggleHandleTouched){
        if ((toggleHadle.position.x-offPosition.x)>(onPosition.x-toggleHadle.position.x)) {
            buttonOn=YES;
            [toggleHadle runAction:[CCMoveTo actionWithDuration:0.5 position:onPosition]];
        }else{
            buttonOn=NO;
            [toggleHadle runAction:[CCMoveTo actionWithDuration:0.5 position:offPosition]];
        }
    }
    toggleHandleTouched=NO;
    togglePadTouched=NO;
}
-(BOOL)getOnOff{
    if (buttonOn) {
        return TRUE;
    }else{
        return FALSE;
    }
}
@end
