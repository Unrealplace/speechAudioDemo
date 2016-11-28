//
//  textToSpeechManager.m
//  SpeechAudioDemo_1
//
//  Created by LiYang on 16/11/28.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "textToSpeechManager.h"

@interface textToSpeechManager ()

//类的扩展部分重新定义头部定义过的属性，这样可以支持读写操作。
@property (nonatomic,strong)AVSpeechSynthesizer * synthesizer;

@property (nonatomic,strong)NSArray   * voices;

@property (nonatomic,strong)NSArray   * speechStrings;


@end
@implementation textToSpeechManager

+(instancetype)speechControll{

    return [[self alloc] init];
    
}
-(id)init{

    if (self = [super init]) {
        
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        
        
        _voices      = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],
                         [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"]];
        
        _speechStrings  = [self buildSpeechStrings];
        
        
        
    }
    return self;
}
-(NSArray*)buildSpeechStrings{

    return @[@"buildSpeechStrings",
             @"you are a bad girl",
             @"i am a good man",
             @"let us make kiss in the bed",
             @"it is time for us to study hard"];
}

-(void)beginConversation{

    for (NSUInteger i = 0; i < self.speechStrings.count; i++) {
        AVSpeechUtterance * uttereace = [[AVSpeechUtterance alloc] initWithString:_speechStrings[i]];
        uttereace.voice = _voices[i % 2];
        uttereace.rate  = 0.4f; // 语音播放的速度
        uttereace.pitchMultiplier = 0.8f; //  改变声音的音调
        uttereace.postUtteranceDelay = 0.1f; // 每句话间的间隔
        
        [self.synthesizer speakUtterance:uttereace];
    }
}
@end
