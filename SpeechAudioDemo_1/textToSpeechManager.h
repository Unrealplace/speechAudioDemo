//
//  textToSpeechManager.h
//  SpeechAudioDemo_1
//
//  Created by LiYang on 16/11/28.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface textToSpeechManager : NSObject

@property (nonatomic,strong,readonly) AVSpeechSynthesizer  * synthesizer;


+ (instancetype)speechControll;

- (void)beginConversation;



@end
