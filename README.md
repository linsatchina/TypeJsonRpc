# api.json  ---> web api code
```objective-c
[WebAPI products_list:self cate:@"" page:@"" pagesize:@"" sort:@"" 

onSuceess:^(Ret_products_list *ret) {
        NSLog(@"BrandData count=%ld",ret.r_BrandData.count);
        if (ret.r_BrandData.count>0) {
            NSLog(@"BName 1=%@",ret.r_BrandData[0].r_BName);
        }
    } 
    
onFailed:^(enum WebAPIErrorCode errorCode, NSString *msg) {
        NSLog(@"errorCode=%ld msg=%@",errorCode,msg);
}];
```