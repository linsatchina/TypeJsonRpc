
//DO NOT EDIT! 
//source: api.json  main.go
#import <Foundation/Foundation.h>

@interface Ret_f2_BrandData:NSObject
@property(nonatomic) int r_BCount;
@property(nonatomic) int r_BId;
@property(nonatomic) NSString* r_BName;
@property(nonatomic) NSString* r_BPId;
@end

@interface Ret_f2_BrandData_Array:NSMutableArray
-(Ret_f2_BrandData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f2_ProductData:NSObject
@property(nonatomic) int r_PFavoriteCount;
@property(nonatomic) int r_PGoodCommentCount;
@property(nonatomic) NSString* r_PId;
@property(nonatomic) NSString* r_PImage;
@property(nonatomic) NSString* r_PCategoryCode;
@property(nonatomic) int r_PCommentCount;
@property(nonatomic) int r_PCommentIntegral;
@property(nonatomic) NSString* r_PDescriptionUrl;
@end

@interface Ret_f2_ProductData_Array:NSMutableArray
-(Ret_f2_ProductData*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f2:NSObject
@property(nonatomic) Ret_f2_BrandData* r_BrandData;
@property(nonatomic) Ret_f2_ProductData* r_ProductData;
@end

@interface Ret_f2_Array:NSMutableArray
-(Ret_f2*)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface Ret_f1:NSObject
@property(nonatomic) int r_IsUpdate;
@property(nonatomic) NSString* r_Image;
@end

