#import "DJHttp.h"
#import <objc/runtime.h>

@interface DJHttpAutoRemove : NSObject
@property(nonatomic,copy)void(^onDealloc)();
@end

@implementation DJHttpAutoRemove
-(void)dealloc{
    if (self.onDealloc!=nil) {
        self.onDealloc();
    }
}
@end



@implementation DJHttp


+(void)registerStatus:(enum WebAPIStatus)status block:(void(^)())block{

}


+(void)sendRequestWithId:(id)Id
            method:(NSString*)method
            path:(NSString*)path
            param:(NSDictionary*)param
            onSuceess:(void(^)(id data))onSuceess
            onFailed:(void(^)(enum WebAPIStatus errorCode,NSString* msg))onFailed{

}


+(void)cancelAllRequestWithId:(id)Id{

}


@end
