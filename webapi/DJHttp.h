#import <Foundation/Foundation.h>
#import "WebAPIStatus.h"

@interface DJHttp : NSObject

//全局事件注册
+(void)registerErrorCode:(enum WebAPIStatus)status block:(void(^)())block;

//id + path + method 相同    取消上次
+(void)sendRequestWithId:(id)Id
            method:(NSString*)method
            path:(NSString*)path
            param:(NSDictionary*)param
            onSuceess:(void(^)(id data))onSuceess
            onFailed:(void(^)(enum WebAPIStatus errorCode,NSString* msg))onFailed;

//取消 id 所有
+(void)cancelAllRequestWithId:(id)Id;

@end
