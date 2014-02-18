//
//  HelloWorldLayer.h
//  RaoToggleButton
//
//  Created by Cocos on 2/18/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "RaoToggle.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    RaoToggle *toggleButton;
    CGSize screenSize;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
