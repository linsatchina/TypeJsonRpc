
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
+(void)cancelAllRequestWithId:(id)Id;
//
//
//以下函数
//Id dealloc 会自动调用 cancelAllRequestWithId
//同1个函数调用多次 Id相同的话  会取消上1次的调用 (取消网络请求 回收blcok)
#pragma -mark 开机图片
+(void)f1:(id)Id
onSuceess:(void(^)(Ret_f1_Array* ret))onSuceess
onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed
;

#pragma -mark 注释啊
+(void)f2:(id)Id
cate:(NSString*)cate
page:(NSString*)page
pagesize:(NSString*)pagesize
sort:(NSString*)sort
onSuceess:(void(^)(Ret_f2* ret))onSuceess
onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed
;

@end