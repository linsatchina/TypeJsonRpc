
//DO NOT EDIT! 
//source: api.json  main.go
#import <Foundation/Foundation.h>

@interface Ret_f2_ProductData:NSObject
@property(nonatomic) NSString* r_PDescriptionUrl;
@property(nonatomic) NSInteger r_PFavoriteCount;
@property(nonatomic) NSInteger r_PGoodCommentCount;
@property(nonatomic) NSString* r_PId;
@property(nonatomic) NSString* r_PImage;
@property(nonatomic) NSString* r_PCategoryCode;
@property(nonatomic) NSInteger r_PCommentCount;
@property(nonatomic) NSInteger r_PCommentIntegral;
+(Ret_f2_ProductData*)createWith:(id)Id;
@end

@interface Ret_f2_ProductData_Array:NSMutableArray
+(Ret_f2_ProductData_Array*)createWith:(id)Id;
-(Ret_f2_ProductData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f2_BrandData:NSObject
@property(nonatomic) NSInteger r_BCount;
@property(nonatomic) NSInteger r_BId;
@property(nonatomic) NSString* r_BName;
@property(nonatomic) NSString* r_BPId;
+(Ret_f2_BrandData*)createWith:(id)Id;
@end

@interface Ret_f2_BrandData_Array:NSMutableArray
+(Ret_f2_BrandData_Array*)createWith:(id)Id;
-(Ret_f2_BrandData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f1:NSObject
@property(nonatomic) NSString* r_Image;
@property(nonatomic) NSInteger r_IsUpdate;
+(Ret_f1*)createWith:(id)Id;
@end

@interface Ret_f1_Array:NSMutableArray
+(Ret_f1_Array*)createWith:(id)Id;
-(Ret_f1*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f2:NSObject
@property(nonatomic) Ret_f2_ProductData_Array* r_ProductData;
@property(nonatomic) Ret_f2_BrandData_Array* r_BrandData;
+(Ret_f2*)createWith:(id)Id;
@end

