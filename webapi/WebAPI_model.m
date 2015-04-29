
//DO NOT EDIT! 
//source: api.json  main.go
#import "WebAPI_model.h"

@implementation Ret_f2_ProductData
+(Ret_f2_ProductData*)createWith:(NSDictionary*)dic{
	Ret_f2_ProductData *ret = [[Ret_f2_ProductData alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}
	NSString *s=dic[@"PId"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PId=@"";
	}else{
		ret.r_PId=s;
	}
			
	NSString *s=dic[@"PImage"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PImage=@"";
	}else{
		ret.r_PImage=s;
	}
			
	NSString *s=dic[@"PCategoryCode"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PCategoryCode=@"";
	}else{
		ret.r_PCategoryCode=s;
	}
			
	NSNumber *n=dic[@"PCommentCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PCommentCount=0;
	}else{
		ret.r_PCommentCount=[n intgerValue];
	}
			
	NSNumber *n=dic[@"PCommentIntegral"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PCommentIntegral=0;
	}else{
		ret.r_PCommentIntegral=[n intgerValue];
	}
			
	NSString *s=dic[@"PDescriptionUrl"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PDescriptionUrl=@"";
	}else{
		ret.r_PDescriptionUrl=s;
	}
			
	NSNumber *n=dic[@"PFavoriteCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PFavoriteCount=0;
	}else{
		ret.r_PFavoriteCount=[n intgerValue];
	}
			
	NSNumber *n=dic[@"PGoodCommentCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PGoodCommentCount=0;
	}else{
		ret.r_PGoodCommentCount=[n intgerValue];
	}
			
	return ret;
}
@end

@implementation Ret_f2_ProductData_Array
+(Ret_f2_ProductData_Array*)createWith:(NSArray*)arr{
	Ret_f2_ProductData_Array *ret = (Ret_f2_ProductData_Array*)[[NSMutableArray alloc]init];
	if(arr==nil || [arr isKindOfClass:[NSArray class]]==NO){
		return ret;
	}
	for(int i=0;i<arr.count;i++){
	    Ret_f2_ProductData *model = [Ret_f2_ProductData createWith:arr[i]];
		[ret addObject:model];
	}
	return ret;
}
-(Ret_f2_ProductData *)objectAtIndexedSubscript:(NSUInteger)idx{
	return [super objectAtIndexedSubscript:idx];
}
@end

@implementation Ret_f2_BrandData
+(Ret_f2_BrandData*)createWith:(NSDictionary*)dic{
	Ret_f2_BrandData *ret = [[Ret_f2_BrandData alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}
	NSNumber *n=dic[@"BCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_BCount=0;
	}else{
		ret.r_BCount=[n intgerValue];
	}
			
	NSNumber *n=dic[@"BId"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_BId=0;
	}else{
		ret.r_BId=[n intgerValue];
	}
			
	NSString *s=dic[@"BName"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_BName=@"";
	}else{
		ret.r_BName=s;
	}
			
	NSString *s=dic[@"BPId"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_BPId=@"";
	}else{
		ret.r_BPId=s;
	}
			
	return ret;
}
@end

@implementation Ret_f2_BrandData_Array
+(Ret_f2_BrandData_Array*)createWith:(NSArray*)arr{
	Ret_f2_BrandData_Array *ret = (Ret_f2_BrandData_Array*)[[NSMutableArray alloc]init];
	if(arr==nil || [arr isKindOfClass:[NSArray class]]==NO){
		return ret;
	}
	for(int i=0;i<arr.count;i++){
	    Ret_f2_BrandData *model = [Ret_f2_BrandData createWith:arr[i]];
		[ret addObject:model];
	}
	return ret;
}
-(Ret_f2_BrandData *)objectAtIndexedSubscript:(NSUInteger)idx{
	return [super objectAtIndexedSubscript:idx];
}
@end

@implementation Ret_f1
+(Ret_f1*)createWith:(NSDictionary*)dic{
	Ret_f1 *ret = [[Ret_f1 alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}
	NSNumber *n=dic[@"IsUpdate"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_IsUpdate=0;
	}else{
		ret.r_IsUpdate=[n intgerValue];
	}
			
	NSString *s=dic[@"Image"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_Image=@"";
	}else{
		ret.r_Image=s;
	}
			
	return ret;
}
@end

@implementation Ret_f1_Array
+(Ret_f1_Array*)createWith:(NSArray*)arr{
	Ret_f1_Array *ret = (Ret_f1_Array*)[[NSMutableArray alloc]init];
	if(arr==nil || [arr isKindOfClass:[NSArray class]]==NO){
		return ret;
	}
	for(int i=0;i<arr.count;i++){
	    Ret_f1 *model = [Ret_f1 createWith:arr[i]];
		[ret addObject:model];
	}
	return ret;
}
-(Ret_f1 *)objectAtIndexedSubscript:(NSUInteger)idx{
	return [super objectAtIndexedSubscript:idx];
}
@end

@implementation Ret_f2
+(Ret_f2*)createWith:(NSDictionary*)dic{
	Ret_f2 *ret = [[Ret_f2 alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}
	ret.r_BrandData= [BrandData createWith:dic[@"BrandData"]];
			
	ret.r_ProductData= [ProductData createWith:dic[@"ProductData"]];
			
	return ret;
}
@end

