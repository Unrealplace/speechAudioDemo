//
//  ViewController.m
//  SpeechAudioDemo_1
//
//  Created by LiYang on 16/11/28.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "textToSpeechManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    //发声合成类
//    AVSpeechSynthesizer * sythesizer = [[AVSpeechSynthesizer alloc] init];
//     // 讲话的语句类
//    AVSpeechUtterance  * utterance = [[AVSpeechUtterance alloc] initWithString:@"nice to meet you oliver lee li yang"];
//    
//    [sythesizer speakUtterance:utterance];
//
    
    textToSpeechManager * speechManager = [textToSpeechManager speechControll];
    [speechManager beginConversation];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
