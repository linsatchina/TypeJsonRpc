#import <Foundation/Foundation.h>
#import "WebAPIStatus.h"

@interface DJHttp : NSObject

+(void)registerStatus:(enum WebAPIStatus)status block:(void(^)())block;

//id   path+method  相同取消上次
+(void)callhttpReguest:(id)Id
                  path:(NSString*)funcName
                method:(NSString*)method
                 param:(NSDictionary*)param
             onSuceess:(void(^)(NSArray* retArr))onSuceess
              onFailed:(void(^)(enum WebAPIStatus status,NSString* msg))onFailed;

//  取消 id 所有
+(void)cancelRequest:(id)Id;

@end
