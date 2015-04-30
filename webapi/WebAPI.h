
//DO NOT EDIT! 
//source: api.json  main.go

#import "WebAPI_model.h"
#import "WebAPIStauts.h"

@interface WebAPI : NSObject
//
+(void)registerstauts:(enum WebAPIStauts)status block:(void(^)())block;
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
+(void)recommend_openmachine:(id)Id
onSuceess:(void(^)(Ret_recommend_openmachine* ret))onSuceess
onFailed:(void(^)(enum WebAPIStauts stauts,NSString* msg))onFailed
;

#pragma -mark 注释啊
+(void)products_list:(id)Id
cate:(NSString*)cate
page:(NSString*)page
pagesize:(NSString*)pagesize
sort:(NSString*)sort
onSuceess:(void(^)(Ret_products_list* ret))onSuceess
onFailed:(void(^)(enum WebAPIStauts stauts,NSString* msg))onFailed
;

@end