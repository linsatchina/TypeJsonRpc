
//DO NOT EDIT! 
//source: api.json  main.go

#import "WebAPI.h"
#import "DJHttp.h"

@implementation WebAPI

+(void)registerErrorCode:(enum WebAPIErrorCode)status block:(void(^)())block{
	[DJHttp registerErrorCode:status block:block];
}

+(void)cancelRequest:(id)Id{
	[DJHttp cancelRequest:Id];
}
#pragma -mark 注释啊
+(void)f2:(id)Id
cate:(NSString*)cate
page:(NSString*)page
pagesize:(NSString*)pagesize
sort:(NSString*)sort
onSuceess:(void(^)(Ret_f2* ret))onSuceess
onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed
{
[DJHttp sendRequestWithId:Id
	method:method
	path:path
	param:@{@"cate":cate,@"page":page,@"pagesize":pagesize,@"sort":sort,}
	onSuceess:^(id data){
		if(onSuceess){
			onSuceess([Ret_f2 createWith:data]);
		}
	}
	onFailed:onFailed
];
}

#pragma -mark 开机图片
+(void)f1:(id)Id
onSuceess:(void(^)(Ret_f1_Array* ret))onSuceess
onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed
{
[DJHttp sendRequestWithId:Id
	method:method
	path:path
	param:@{}
	onSuceess:^(id data){
		if(onSuceess){
			onSuceess([Ret_f1_Array createWith:data]);
		}
	}
	onFailed:onFailed
];
}

@end