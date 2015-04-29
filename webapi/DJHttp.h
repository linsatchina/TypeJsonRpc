#import <Foundation/Foundation.h>
#import "WebAPIErrorCode.h"

@interface DJHttp : NSObject

//全局事件注册
+(void)registerErrorCode:(enum WebAPIErrorCode)status block:(void(^)())block;

//id + path + method 相同    取消上次
+(void)sendRequestWithId:(id)Id
            method:(NSString*)method
            path:(NSString*)path
            param:(NSDictionary*)param
            onSuceess:(void(^)(id data))onSuceess
            onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed;

//取消 id 所有
+(void)cancelRequest:(id)Id;

@end
