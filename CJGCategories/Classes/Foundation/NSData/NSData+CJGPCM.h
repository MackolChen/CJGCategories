//
//  NSData+CJGPCM.h
//  CJGCategories-Demo
//
//  Created by Jakey on 16/6/5.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
/*
 
AudioStreamBasicDescription _format;
_format.mFormatID = kAudioFormatLinearPCM;
_format.mFormatFlags = kLinearPCMFormatFlagIsSignedInteger | kLinearPCMFormatFlagIsPacked;
_format.mBitsPerChannel = 16;
_format.mChannelsPerFrame = 1;
_format.mBytesPerPacket = _format.mBytesPerFrame = (_format.mBitsPerChannel / 8) * _format.mChannelsPerFrame;
_format.mFramesPerPacket = 1;
_format.mSampleRate = 8000.0f;
*/

@interface NSData (CJGPCM)
/// format wav data
/// - Parameter PCMFormat: format of pcm
- (NSData *)cjg_wavDataWithPCMFormat:(AudioStreamBasicDescription)PCMFormat;
@end
