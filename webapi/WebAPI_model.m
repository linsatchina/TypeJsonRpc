
//DO NOT EDIT! 
//source: api.json  main.go
#import "WebAPI_model.h"

@implementation Ret_products_list_BrandData
+(Ret_products_list_BrandData*)createWith:(id)Id{
	NSDictionary* dic = Id;
	Ret_products_list_BrandData *ret = [[Ret_products_list_BrandData alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}{
	NSString *s=dic[@"BName"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_BName=@"";
	}else{
		ret.r_BName=s;
	}
			}{
	NSString *s=dic[@"BPId"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_BPId=@"";
	}else{
		ret.r_BPId=s;
	}
			}{
	NSNumber *n=dic[@"BCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_BCount=0;
	}else{
		ret.r_BCount=[n integerValue];
	}
			}{
	NSNumber *n=dic[@"BId"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_BId=0;
	}else{
		ret.r_BId=[n integerValue];
	}
			}
	return ret;
}
@end

@implementation Ret_products_list_BrandData_Array
+(Ret_products_list_BrandData_Array*)createWith:(id)Id{
	NSArray *arr=Id;
	Ret_products_list_BrandData_Array *ret = (Ret_products_list_BrandData_Array*)[[NSMutableArray alloc]init];
	if(arr==nil || [arr isKindOfClass:[NSArray class]]==NO){
		return ret;
	}
	for(int i=0;i<arr.count;i++){
	    Ret_products_list_BrandData *model = [Ret_products_list_BrandData createWith:arr[i]];
		[ret addObject:model];
	}
	return ret;
}
-(Ret_products_list_BrandData *)objectAtIndexedSubscript:(NSUInteger)idx{
	return [super objectAtIndexedSubscript:idx];
}
@end

@implementation Ret_products_list_ProductData
+(Ret_products_list_ProductData*)createWith:(id)Id{
	NSDictionary* dic = Id;
	Ret_products_list_ProductData *ret = [[Ret_products_list_ProductData alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}{
	NSNumber *n=dic[@"PCommentCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PCommentCount=0;
	}else{
		ret.r_PCommentCount=[n integerValue];
	}
			}{
	NSNumber *n=dic[@"PCommentIntegral"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PCommentIntegral=0;
	}else{
		ret.r_PCommentIntegral=[n integerValue];
	}
			}{
	NSString *s=dic[@"PDescriptionUrl"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PDescriptionUrl=@"";
	}else{
		ret.r_PDescriptionUrl=s;
	}
			}{
	NSNumber *n=dic[@"PFavoriteCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PFavoriteCount=0;
	}else{
		ret.r_PFavoriteCount=[n integerValue];
	}
			}{
	NSNumber *n=dic[@"PGoodCommentCount"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_PGoodCommentCount=0;
	}else{
		ret.r_PGoodCommentCount=[n integerValue];
	}
			}{
	NSString *s=dic[@"PId"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PId=@"";
	}else{
		ret.r_PId=s;
	}
			}{
	NSString *s=dic[@"PImage"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PImage=@"";
	}else{
		ret.r_PImage=s;
	}
			}{
	NSString *s=dic[@"PCategoryCode"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_PCategoryCode=@"";
	}else{
		ret.r_PCategoryCode=s;
	}
			}
	return ret;
}
@end

@implementation Ret_products_list_ProductData_Array
+(Ret_products_list_ProductData_Array*)createWith:(id)Id{
	NSArray *arr=Id;
	Ret_products_list_ProductData_Array *ret = (Ret_products_list_ProductData_Array*)[[NSMutableArray alloc]init];
	if(arr==nil || [arr isKindOfClass:[NSArray class]]==NO){
		return ret;
	}
	for(int i=0;i<arr.count;i++){
	    Ret_products_list_ProductData *model = [Ret_products_list_ProductData createWith:arr[i]];
		[ret addObject:model];
	}
	return ret;
}
-(Ret_products_list_ProductData *)objectAtIndexedSubscript:(NSUInteger)idx{
	return [super objectAtIndexedSubscript:idx];
}
@end

@implementation Ret_products_list
+(Ret_products_list*)createWith:(id)Id{
	NSDictionary* dic = Id;
	Ret_products_list *ret = [[Ret_products_list alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}{
	ret.r_BrandData= [Ret_products_list_BrandData_Array createWith:dic[@"BrandData"]];
			}{
	ret.r_ProductData= [Ret_products_list_ProductData_Array createWith:dic[@"ProductData"]];
			}
	return ret;
}
@end

@implementation Ret_recommend_openmachine
+(Ret_recommend_openmachine*)createWith:(id)Id{
	NSDictionary* dic = Id;
	Ret_recommend_openmachine *ret = [[Ret_recommend_openmachine alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}{
	NSNumber *n=dic[@"IsUpdate"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_IsUpdate=0;
	}else{
		ret.r_IsUpdate=[n integerValue];
	}
			}{
	NSString *s=dic[@"Image"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_Image=@"";
	}else{
		ret.r_Image=s;
	}
			}
	return ret;
}
@end

