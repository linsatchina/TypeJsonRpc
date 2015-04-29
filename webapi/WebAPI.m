
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
@end