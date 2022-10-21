//
//  UIControl+Sound.m
//  UIControlSound
//
//  Created by Fred Showell on 6/01/13.
//  Copyright (c) 2013 Fred Showell. All rights reserved.
//

#import "UIControl+CJGSound.h"
#import <objc/runtime.h>

// Key for the dictionary of sounds for control events.
static char const * const cjg_kSoundsKey = "cjg_kSoundsKey";

@implementation UIControl (JKSound)

- (void)cjg_setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent
{
	// Remove the old UI sound.
	NSString *oldSoundKey = [NSString stringWithFormat:@"%lu", controlEvent];
	AVAudioPlayer *oldSound = [self cjg_sounds][oldSoundKey];
	[self removeTarget:oldSound action:@selector(play) forControlEvents:controlEvent];
	
	// Set appropriate category for UI sounds.
	// Do not mute other playing audio.
    [[AVAudioSession sharedInstance] setCategory:@"AVAudioSessionCategoryAmbient" error:nil];
	
	// Find the sound file.
    NSString *file = [name stringByDeletingPathExtension];
    NSString *extension = [name pathExtension];
    NSURL *soundFileURL = [[NSBundle mainBundle] URLForResource:file withExtension:extension];
	
    NSError *error = nil;
	
	// Create and prepare the sound.
	AVAudioPlayer *tapSound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
	NSString *controlEventKey = [NSString stringWithFormat:@"%lu", controlEvent];
	NSMutableDictionary *sounds = [self cjg_sounds];
	[sounds setObject:tapSound forKey:controlEventKey];
	[tapSound prepareToPlay];
	if (!tapSound) {
		NSLog(@"Couldn't add sound - error: %@", error);
		return;
	}
	
	// Play the sound for the control event.
	[self addTarget:tapSound action:@selector(play) forControlEvents:controlEvent];
}


#pragma mark - Associated objects setters/getters

- (void)setCjg_sounds:(NSMutableDictionary *)sounds
{
	objc_setAssociatedObject(self, cjg_kSoundsKey, sounds, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)cjg_sounds
{
	NSMutableDictionary *sounds = objc_getAssociatedObject(self, cjg_kSoundsKey);
	
	// If sounds is not yet created, create it.
	if (!sounds) {
		sounds = [[NSMutableDictionary alloc] initWithCapacity:2];
		// Save it for later.
		[self setCjg_sounds:sounds];
	}
	
	return sounds;
}

@end
