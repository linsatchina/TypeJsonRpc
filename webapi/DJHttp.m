#import "DJHttp.h"
#import "AFNetworking.h"
#import <objc/runtime.h>




@interface DJHttpAutoRemove : NSObject
@property(nonatomic,copy)void(^onDealloc)();
@end

@implementation DJHttpAutoRemove
-(void)dealloc{
    if (self.onDealloc!=nil) {
        self.onDealloc();
    }
}
@end


void(^blockArray[10])();
NSMutableDictionary *httpDic;


@implementation DJHttp




+(void)saveCookies{
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: @"cookie"];
    [defaults synchronize];
    
}

+(void)loadCookies{
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: @"cookie"]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in cookies){
        [cookieStorage setCookie: cookie];
    }
}


+(void)callBlock:(enum WebAPIStatus)status{
    if (status>=NetWorkError && status<=____end____) {
        void(^block)() = blockArray[status];
        if (block) {
            block();
        }
    }
}


+(void)registerStatus:(enum WebAPIStatus)status block:(void(^)())block{
    blockArray[status] = block;
}



+(void)callPath:(NSString *)met
    prefixAdress:(NSString *)prefixAddress
         method:(NSString *)method
           param:(NSDictionary *)param
filesPathNameDic:(NSDictionary *)filesNameDic
         success:(void (^)(id data))success
          failed:(void(^)(enum WebAPIStatus status,NSString* msg))onFailed

{
    [DJHttp loadCookies];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    void (^commonNetWrokErr)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error){
        [DJHttp saveCookies];
        if (onFailed) {
            onFailed(NetWorkError,error.description);
            [DJHttp callBlock:NetWorkError];
        }
    };
    void (^commonSuccess)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        [DJHttp saveCookies];
        
        //NSLog(@"Success: %@,%@", responseObject,[responseObject class]);
        NSNumber * status = [responseObject objectForKey:@"Status"];
        
        if ([status intValue]==1) {
            if (success) {
                success([responseObject objectForKey:@"Data"]);
            }
        }else{
            if (onFailed) {
                enum WebAPIStatus s;
                NSNumber* n=[responseObject objectForKey:@"Status"];
                s=[n intValue];
                
                NSString *msg=[responseObject objectForKey:@"Message"];
                onFailed(s,msg);
                
                [DJHttp callBlock:s];
            }
        }
        
    };
    if ([method isEqualToString:@"GET"]) {
         
        [manager GET:[NSString stringWithFormat:@"%@%@",prefixAddress,met] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            commonSuccess(operation,responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            commonNetWrokErr(operation,error);
        }];
        return;
    }
    
    NSMutableDictionary *textParam = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *fileParam = [[NSMutableDictionary alloc]init];
    
    [param enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]])
        {
            textParam[key]=obj;
        }
        else if ([obj isKindOfClass:[NSData class]])
        {
            fileParam[key]=obj;
        }
        
    }];
    
    //NSLog(@"fileParam=%d",fileParam.count);
    
    if(fileParam.count==0){
        
       [manager POST:[NSString stringWithFormat:@"%@%@",prefixAddress,met] parameters:textParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            commonSuccess(operation,responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            commonNetWrokErr(operation,error);
        }];
        
        
    }else{
    
    [manager POST:[NSString stringWithFormat:@"%@%@",prefixAddress,met] parameters:textParam constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        
            [fileParam enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //NSLog(@"key=%@,%d",key,((NSData*)obj).length);
               // [formData appendPartWithFormData:obj name:key];
                [formData appendPartWithFileData:obj
                                            name:key
                                        fileName:@"" mimeType:@"image/jpeg"];
            }];
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        commonSuccess(operation,responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        commonNetWrokErr(operation,error);
    }];
        
    }
}
+(void)callPath:(NSString*)funcName
         method:(NSString*)method
          param:(NSDictionary*)param
      onSuceess:(void(^)(NSArray* retArr))onSuceess
       onFailed:(void(^)(enum WebAPIStatus status,NSString* msg))onFailed
{
     method=[method uppercaseString];
    [DJHttp callPath:funcName prefixAdress:@"http://appapi.chinacloudsites.cn/"  method:method param:param filesPathNameDic:nil success:onSuceess failed:onFailed];
}



+(void)callhttpReguest:(id)Id
   path:(NSString *)met
   prefixAdress:(NSString *)prefixAddress
         method:(NSString *)method
          param:(NSDictionary *)param
filesPathNameDic:(NSDictionary *)filesNameDic
        success:(void (^)(id data))success
         failed:(void(^)(enum WebAPIStatus status,NSString* msg))onFailed

{
    [DJHttp loadCookies];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    void (^commonNetWrokErr)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error){
        [DJHttp saveCookies];
        if (onFailed) {
            onFailed(NetWorkError,error.description);
            [DJHttp callBlock:NetWorkError];
        }
    };
    void (^commonSuccess)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject){
        
        [DJHttp saveCookies];
        
        //NSLog(@"Success: %@,%@", responseObject,[responseObject class]);
        NSNumber * status = [responseObject objectForKey:@"Status"];
        
        if ([status intValue]==1) {
            if (success) {
                success([responseObject objectForKey:@"Data"]);
            }
        }else{
            if (onFailed) {
                enum WebAPIStatus s;
                NSNumber* n=[responseObject objectForKey:@"Status"];
                s=[n intValue];
                
                NSString *msg=[responseObject objectForKey:@"Message"];
                onFailed(s,msg);
                
                [DJHttp callBlock:s];
            }
        }
        
    };
    if ([method isEqualToString:@"GET"]) {
        
        NSString *key=[NSString stringWithFormat:@"%p:%@/%@",Id,met,method];
        AFHTTPRequestOperation *httpRequest=[manager GET:[NSString stringWithFormat:@"%@%@",prefixAddress,met] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"AFHTTPRequestOperation success \n");
            
            if ([httpDic objectForKey:key])
            {
                [httpDic removeObjectForKey:key];
                commonSuccess(operation,responseObject);
            }
            
                
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"AFHTTPRequestOperation failure \n");
            
            if ([httpDic objectForKey:key]) {
                [httpDic removeObjectForKey:key];
                commonNetWrokErr(operation,error);
            }
            
                
            
        }];
        NSLog(@"add httpRequest\n");
        [httpDic setObject:httpRequest forKey:key];
        return;
    }
    
    NSMutableDictionary *textParam = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *fileParam = [[NSMutableDictionary alloc]init];
    
    [param enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]])
        {
            textParam[key]=obj;
        }
        else if ([obj isKindOfClass:[NSData class]])
        {
            fileParam[key]=obj;
        }
        
    }];
    
    //NSLog(@"fileParam=%d",fileParam.count);
    NSString *key=[NSString stringWithFormat:@"%p:%@/%@",Id,met,method];
    if(fileParam.count==0){
        
        AFHTTPRequestOperation *httpRequest= [manager POST:[NSString stringWithFormat:@"%@%@",prefixAddress,met] parameters:textParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"AFHTTPRequestOperation success \n");
            
            if ([httpDic objectForKey:key])
            {
                [httpDic removeObjectForKey:key];
                commonSuccess(operation,responseObject);
            }

        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
            if ([httpDic objectForKey:key]) {
                [httpDic removeObjectForKey:key];
                commonNetWrokErr(operation,error);
            }
        }];
        
      
      
        [httpDic setObject:httpRequest forKey:key];
    
    }else{
        
        AFHTTPRequestOperation *httpRequest= [manager POST:[NSString stringWithFormat:@"%@%@",prefixAddress,met] parameters:textParam constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            
            
            [fileParam enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //NSLog(@"key=%@,%d",key,((NSData*)obj).length);
                // [formData appendPartWithFormData:obj name:key];
                [formData appendPartWithFileData:obj
                                            name:key
                                        fileName:@"" mimeType:@"image/jpeg"];
            }];
            
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"AFHTTPRequestOperation success \n");
            
            if ([httpDic objectForKey:key])
            {
                [httpDic removeObjectForKey:key];
                commonSuccess(operation,responseObject);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            if ([httpDic objectForKey:key]) {
                [httpDic removeObjectForKey:key];
                commonNetWrokErr(operation,error);
            }
        }];
        
        
        [httpDic setObject:httpRequest forKey:key];
      
    }
}
+(void)callhttpReguest:(id)Id
     path:(NSString*)funcName
         method:(NSString*)method
          param:(NSDictionary*)param
      onSuceess:(void(^)(NSArray* retArr))onSuceess
       onFailed:(void(^)(enum WebAPIStatus status,NSString* msg))onFailed
{
    
    
    
    
    // ------------auto remove-------------
    static const char *objc_key = "DJHttpAutoRemove";
    DJHttpAutoRemove *ar = objc_getAssociatedObject(Id,objc_key);
    NSString *strId =[NSString stringWithFormat:@"%p",Id];
    if (ar==nil) {
        ar = [[DJHttpAutoRemove alloc]init];
        ar.onDealloc=^{
            [DJHttp cancelRequestWithString:strId];
        };
        objc_setAssociatedObject(Id,objc_key, ar, OBJC_ASSOCIATION_RETAIN);
    }
    //------------------------------------------------------------
    
    
    
    
    
    if (!httpDic) {
        httpDic=[[NSMutableDictionary alloc]init];
        
    }
    
    NSString *key=[NSString stringWithFormat:@"%p:%@/%@",Id,funcName,method];
 
    if ([httpDic objectForKey:key]) {
        AFHTTPRequestOperation *httpRequest=[httpDic objectForKey:key];
        [httpRequest cancel];
        httpRequest=nil;
        [httpDic removeObjectForKey:key];
        NSLog(@"remove httpRequest\n");
    }
   
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [DJHttp callhttpReguest:Id path: funcName prefixAdress:@"http://appapi.chinacloudsites.cn/"  method:[method uppercaseString] param:param   filesPathNameDic:nil  success:onSuceess failed:onFailed];
    });
   
}








+(void)cancelRequestWithString:(NSString*)Id;
{
    if (!httpDic) {
        return;
    }
    
    for (int i=0; i<[[httpDic allKeys]count]; i++) {
        NSString *key=[[httpDic allKeys] objectAtIndex:i];
        NSString *key1=[[key componentsSeparatedByString:@":"] objectAtIndex:0];
        if ([key1 isEqualToString:Id]) {
            
            AFHTTPRequestOperation *httpRequest=[httpDic  objectForKey:key];
            [httpRequest cancel];
            httpRequest=nil;
            [httpDic removeObjectForKey:key];
            
            NSLog(@"cancelRequest\n");
        }
        
    }
    
}



//  取消 id 所有
+(void)cancelRequest:(id)Id;
{
    [DJHttp cancelRequestWithString:[NSString stringWithFormat:@"%p",Id]];
}
@end
