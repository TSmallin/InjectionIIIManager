//
//  InjectionManager.m
//  Test
//
//  Created by 唐林 on 2018/12/4.
//  Copyright © 2018年 唐林. All rights reserved.
//

#import "InjectionManager.h"

@implementation InjectionManager

+ (instancetype)sharedInstance {
    static InjectionManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[InjectionManager alloc] init];
    });
    return _manager;
}

+ (void)inject {
    [[self sharedInstance] loadInjection];
    [[self sharedInstance] addInjectionNotification];
}

- (void)loadInjection {
#ifdef DEBUG
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
#endif
}

- (void)addInjectionNotification {
#ifdef DEBUG
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(injectionNotification:) name:@"INJECTION_BUNDLE_NOTIFICATION" object:nil];
#endif
}

- (void)injectionNotification:(NSNotification *)notification {
    NSLog(@"injectionNotification_notification: %@", notification);
}
//
//+ (void)addObserverForQueue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block {
//    [[NSNotificationCenter defaultCenter] addObserverForName:@"INJECTION_BUNDLE_NOTIFICATION" object:nil queue:queue usingBlock:block];
//}
//
//+ (void)addObserverForMainQueueUsingBlock:(void (^)(NSNotification *note))block {
//    [self addObserverForQueue:[NSOperationQueue mainQueue] usingBlock:block];
//}


@end
