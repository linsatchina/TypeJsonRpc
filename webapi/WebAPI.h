
//DO NOT EDIT! 
//source: api.json  main.go

#import "WebAPI_model.h"
#import "WebAPIErrorCode.h"

@interface WebAPI : NSObject
//
+(void)registerErrorCode:(enum WebAPIErrorCode)status block:(void(^)())block;
//
//取消Id发起的所有网络请求
//回收所有block
+(void)cancelRequest:(id)Id;
//
//
//以下函数
//Id dealloc 会自动调用 cancelRequest
//同1个函数调用多次 Id相同的话  会取消上1次的调用 (取消网络请求 回收blcok)
@end