
//DO NOT EDIT! 
//source: api.json  main.go
#import <Foundation/Foundation.h>

@interface Ret_products_list_BrandData:NSObject
@property(nonatomic) NSInteger r_BCount;//字段注释5
@property(nonatomic) NSInteger r_BId;//字段注释6
@property(nonatomic) NSString* r_BName;//字段注释7
@property(nonatomic) NSString* r_BPId;//字段注释8
+(Ret_products_list_BrandData*)createWith:(id)Id;
@end

@interface Ret_products_list_BrandData_Array:NSMutableArray
+(Ret_products_list_BrandData_Array*)createWith:(id)Id;
-(Ret_products_list_BrandData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_products_list_ProductData:NSObject
@property(nonatomic) NSInteger r_PCommentIntegral;//字段注释12
@property(nonatomic) NSString* r_PDescriptionUrl;//字段注释13
@property(nonatomic) NSInteger r_PFavoriteCount;//字段注释14
@property(nonatomic) NSInteger r_PGoodCommentCount;//字段注释15
@property(nonatomic) NSString* r_PId;//字段注释16
@property(nonatomic) NSString* r_PImage;//字段注释17
@property(nonatomic) NSString* r_PCategoryCode;//字段注释10
@property(nonatomic) NSInteger r_PCommentCount;//字段注释11
+(Ret_products_list_ProductData*)createWith:(id)Id;
@end

@interface Ret_products_list_ProductData_Array:NSMutableArray
+(Ret_products_list_ProductData_Array*)createWith:(id)Id;
-(Ret_products_list_ProductData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_products_list:NSObject
@property(nonatomic) Ret_products_list_BrandData_Array* r_BrandData;//字段注释4
@property(nonatomic) Ret_products_list_ProductData_Array* r_ProductData;//字段注释9
+(Ret_products_list*)createWith:(id)Id;
@end

@interface Ret_recommend_openmachine:NSObject
@property(nonatomic) NSInteger r_IsUpdate;//字段注释2
@property(nonatomic) NSString* r_Image;//字段注释3
+(Ret_recommend_openmachine*)createWith:(id)Id;
@end

