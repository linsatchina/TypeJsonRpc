
//DO NOT EDIT! 
//source: api.json  main.go
#import <Foundation/Foundation.h>

@interface Ret_f2_BrandData:NSObject
@property(nonatomic) NSString* r_BPId;
@property(nonatomic) NSInteger r_BCount;
@property(nonatomic) NSInteger r_BId;
@property(nonatomic) NSString* r_BName;
+(Ret_f2_BrandData*)createWithDictionary:(NSDictionary*)dic;
@end

@interface Ret_f2_BrandData_Array:NSMutableArray
+(Ret_f2_BrandData_Array*)createWithArray:(NSArray*)arr;
-(Ret_f2_BrandData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f2_ProductData:NSObject
@property(nonatomic) NSInteger r_PCommentIntegral;
@property(nonatomic) NSString* r_PDescriptionUrl;
@property(nonatomic) NSInteger r_PFavoriteCount;
@property(nonatomic) NSInteger r_PGoodCommentCount;
@property(nonatomic) NSString* r_PId;
@property(nonatomic) NSString* r_PImage;
@property(nonatomic) NSString* r_PCategoryCode;
@property(nonatomic) NSInteger r_PCommentCount;
+(Ret_f2_ProductData*)createWithDictionary:(NSDictionary*)dic;
@end

@interface Ret_f2_ProductData_Array:NSMutableArray
+(Ret_f2_ProductData_Array*)createWithArray:(NSArray*)arr;
-(Ret_f2_ProductData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f2:NSObject
@property(nonatomic) Ret_f2_BrandData_Array* r_BrandData;
@property(nonatomic) Ret_f2_ProductData_Array* r_ProductData;
+(Ret_f2*)createWithDictionary:(NSDictionary*)dic;
@end

@interface Ret_f2_Array:NSMutableArray
+(Ret_f2_Array*)createWithArray:(NSArray*)arr;
-(Ret_f2*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f1:NSObject
@property(nonatomic) NSInteger r_IsUpdate;
@property(nonatomic) NSString* r_Image;
+(Ret_f1*)createWithDictionary:(NSDictionary*)dic;
@end

