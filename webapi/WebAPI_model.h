
//DO NOT EDIT! 
//source: api.json  main.go
#import <Foundation/Foundation.h>

@interface Ret_products_list_BrandData:NSObject
@property(nonatomic) NSInteger r_BCount;
@property(nonatomic) NSInteger r_BId;
@property(nonatomic) NSString* r_BName;
@property(nonatomic) NSString* r_BPId;
+(Ret_products_list_BrandData*)createWith:(id)Id;
@end

@interface Ret_products_list_BrandData_Array:NSMutableArray
+(Ret_products_list_BrandData_Array*)createWith:(id)Id;
-(Ret_products_list_BrandData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_products_list_ProductData:NSObject
@property(nonatomic) NSInteger r_PCommentIntegral;
@property(nonatomic) NSString* r_PDescriptionUrl;
@property(nonatomic) NSInteger r_PFavoriteCount;
@property(nonatomic) NSInteger r_PGoodCommentCount;
@property(nonatomic) NSString* r_PId;
@property(nonatomic) NSString* r_PImage;
@property(nonatomic) NSString* r_PCategoryCode;
@property(nonatomic) NSInteger r_PCommentCount;
+(Ret_products_list_ProductData*)createWith:(id)Id;
@end

@interface Ret_products_list_ProductData_Array:NSMutableArray
+(Ret_products_list_ProductData_Array*)createWith:(id)Id;
-(Ret_products_list_ProductData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_recommend_openmachine:NSObject
@property(nonatomic) NSString* r_Image;
@property(nonatomic) NSInteger r_IsUpdate;
+(Ret_recommend_openmachine*)createWith:(id)Id;
@end

@interface Ret_products_list:NSObject
@property(nonatomic) Ret_products_list_BrandData_Array* r_BrandData;
@property(nonatomic) Ret_products_list_ProductData_Array* r_ProductData;
+(Ret_products_list*)createWith:(id)Id;
@end

