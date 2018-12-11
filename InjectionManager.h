//
//  InjectionManager.h
//  Test
//
//  Created by 唐林 on 2018/12/4.
//  Copyright © 2018年 唐林. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///配合工具 InjectionIII 使用
@interface InjectionManager : NSObject

/**
 Start Injection (在didFinishLaunchingWithOptions开启)
 */
+ (void)inject;

@end

NS_ASSUME_NONNULL_END
