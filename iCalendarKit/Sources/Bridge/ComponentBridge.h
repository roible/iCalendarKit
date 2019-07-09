//
//  ComponentBridge.h
//  Demo iOS
//
//  Created by roy on 2019/7/4.
//  Copyright © 2019 xiaoman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComponentBridge : NSObject

/**
 解析ics文件，将输出的主体自费串解析为json格式内容，component嵌套其中
 
 @param content ics文件主体内容
 @return component嵌套的json字典
 */
-(nullable NSDictionary *) parseWithContent: (nonnull NSString *)content;

@end

NS_ASSUME_NONNULL_END
