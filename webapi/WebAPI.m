
//DO NOT EDIT! 
//source: api.json  main.go

#import "WebAPI.h"
#import "DJHttp.h"

@implementation WebAPI

+(void)registerErrorCode:(enum WebAPIErrorCode)status block:(void(^)())block{
	[DJHttp registerErrorCode:status block:block];
}

+(void)cancelAllRequestWithId:(id)Id{
	[DJHttp cancelAllRequestWithId:Id];
}
#pragma -mark 开机图片
+(void)recommend_openmachine:(id)Id
onSuceess:(void(^)(Ret_recommend_openmachine* ret))onSuceess
onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed
{
[DJHttp sendRequestWithId:Id
	method:@"get"
	path:@"recommend/openmachine"
	param:@{}
	onSuceess:^(id data){
		if(onSuceess){
			onSuceess([Ret_recommend_openmachine createWith:data]);
		}
	}
	onFailed:onFailed
];
}

#pragma -mark 注释啊
+(void)products_list:(id)Id
cate:(NSString*)cate
page:(NSString*)page
pagesize:(NSString*)pagesize
sort:(NSString*)sort
onSuceess:(void(^)(Ret_products_list* ret))onSuceess
onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed
{
[DJHttp sendRequestWithId:Id
	method:@"post"
	path:@"products/list"
	param:@{@"cate":cate,@"page":page,@"pagesize":pagesize,@"sort":sort,}
	onSuceess:^(id data){
		if(onSuceess){
			onSuceess([Ret_products_list createWith:data]);
		}
	}
	onFailed:onFailed
];
}

@end