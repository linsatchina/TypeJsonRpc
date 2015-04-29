package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

const (
	ParamType_Int         string = "int"
	ParamType_String             = "string"
	ParamType_Float              = "float"
	ParamType_Object             = "object"
	ParamType_ObjectArray        = "object_array"
)

type API struct {
	Path        string
	Method      string
	Comment     string
	Param       []string
	Respon_data map[string]interface{}
}

var apiList map[string]API
var modelArr = make([]map[string]map[string]string, 10)

//var modelArr = make([级数]map[类名]map[属性名]类型, 10)

var modelIsArray = make(map[string]bool)

//var modelIsArray = make(map[类名]是否是数组)

var sourceComment = `
//DO NOT EDIT! 
//source: api.json  main.go
`

//array create实现函数
func getArrayCreateWithSourceStr(_type string) string {
	return `
	NSArray *arr=Id;
	` + _type + `_Array *ret = (` + _type + `_Array*)[[NSMutableArray alloc]init];
	if(arr==nil || [arr isKindOfClass:[NSArray class]]==NO){
		return ret;
	}
	for(int i=0;i<arr.count;i++){
	    ` + _type + ` *model = [` + _type + ` createWith:arr[i]];
		[ret addObject:model];
	}
	return ret;
`
}
func getType(t string) string {
	if modelIsArray[t] {
		return t + `_Array`
	}
	return t
}

//object create实现函数
func getObjectCreateWithSourceStr(_type string, name_type_map map[string]string) string {

	var s = ``
	for name, type_ := range name_type_map {
		if type_ == ParamType_Float {
			s += `{
	NSNumber *n=dic[@"` + name + `"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_` + name + `=0;
	}else{
		ret.r_` + name + `=[n floatValue];
	}
			}`
		} else if type_ == ParamType_Int {
			s += `{
	NSNumber *n=dic[@"` + name + `"];
	if(n==nil || [n isKindOfClass:[NSNumber class]]==NO){
		ret.r_` + name + `=0;
	}else{
		ret.r_` + name + `=[n integerValue];
	}
			}`
		} else if type_ == ParamType_String {
			s += `{
	NSString *s=dic[@"` + name + `"];
	if(s==nil || [s isKindOfClass:[NSString class]]==NO){
		ret.r_` + name + `=@"";
	}else{
		ret.r_` + name + `=s;
	}
			}`
		} else {
			s += `{
	ret.r_` + name + `= [` + getType(type_) + ` createWith:dic[@"` + name + `"]];
			}`
		}
	}

	return `
	NSDictionary* dic = Id;
	` + _type + ` *ret = [[` + _type + ` alloc]init];
	if(dic==nil || [dic isKindOfClass:[NSDictionary class]]==NO){
		dic = [[NSDictionary alloc]init];
	}` + s + `
	return ret;
`
}

func getWebApiFuncH(comment string, funcName string, paramArr []string, retType string) string {
	var p = "\n"
	for _, param := range paramArr {
		p += param + ":(NSString*)" + param + "\n"
	}
	var s = `
#pragma -mark ` + comment + `
+(void)` + funcName + `:(id)Id` + p + `onSuceess:(void(^)(` + retType + `* ret))onSuceess
onFailed:(void(^)(enum WebAPIErrorCode errorCode,NSString* msg))onFailed
`
	return s
}

func getWebApiFuncM(method, path string, paramArr []string, retType string) string {
	var p = "@{"
	for _, param := range paramArr {
		p += `@"` + param + `":` + param + ","
	}
	p += "}"
	var s = `
[DJHttp sendRequestWithId:Id
	method:@"` + method + `"
	path:@"` + path + `"
	param:` + p + `
	onSuceess:^(id data){
		if(onSuceess){
			onSuceess([` + retType + ` createWith:data]);
		}
	}
	onFailed:onFailed
];
`
	return s
}

func buildModel(modelName string, level int, data map[string]interface{}) bool {
	_type := data["type"].(string)

	if _type == ParamType_Object || _type == ParamType_ObjectArray {
		_key := data["key"].(map[string]interface{})
		for name, vvv := range _key {
			_data := vvv.(map[string]interface{})
			hasChild := buildModel(modelName+"_"+name, level+1, _data)
			paramType := _data["type"].(string)
			if hasChild {
				paramType = modelName + "_" + name
			}

			if modelArr[level] == nil {
				modelArr[level] = make(map[string]map[string]string)
			}

			if modelArr[level][modelName] == nil {
				modelArr[level][modelName] = make(map[string]string)
			}

			modelIsArray[modelName] = _type == ParamType_ObjectArray
			modelArr[level][modelName][name] = paramType
		}
		return true
	}
	return false
}

func main() {

	//第1步
	//---------------------- api.json --> apiList ----------------------
	d, _ := ioutil.ReadFile(`./api.json`)
	err := json.Unmarshal(d, &apiList)
	if err != nil {
		fmt.Println(`————————————————————————解析 json文件 失败————————————————————————`)
		return
	}

	//第2步
	//---------------------- apiList --> modelArr modelIsArray----------------------
	for funcName, api := range apiList {
		buildModel("Ret_"+funcName, 0, api.Respon_data)
	}

	//第3步
	//---------------------- modelArr modelIsArray --> objectice-c model code ----------------------
	var hStr = sourceComment + `#import <Foundation/Foundation.h>` + "\n\n"
	var mStr = sourceComment + `#import "WebAPI_model.h"` + "\n\n"
	for i := len(modelArr) - 1; i >= 0; i-- {
		m := modelArr[i]
		for modelName, v := range m {

			hStr += "@interface " + modelName + ":NSObject\n"
			for _name_, paramType := range v {

				if paramType == ParamType_String {
					paramType = "NSString*"
				} else if paramType == ParamType_Int {
					paramType = "NSInteger"
				} else if paramType == ParamType_Float {
					paramType = "float"
				} else if modelIsArray[paramType] {
					paramType = paramType + "_Array*"
				} else {
					paramType = paramType + "*"
				}

				hStr += "@property(nonatomic) " + paramType + " r_" + _name_ + ";\n"
			}
			hStr += "+(" + modelName + "*)createWith:(id)Id;\n"
			hStr += "@end\n\n"

			mStr += "@implementation " + modelName + "\n"
			mStr += "+(" + modelName + "*)createWith:(id)Id{" + getObjectCreateWithSourceStr(modelName, v) + "}\n"
			mStr += "@end\n\n"

			if modelIsArray[modelName] {
				hStr += "@interface " + modelName + "_Array:NSMutableArray\n"
				hStr += "+(" + modelName + "_Array*)createWith:(id)Id;\n"
				hStr += "-(" + modelName + "*)objectAtIndexedSubscript:(NSUInteger)idx;\n"
				hStr += "@end\n\n"

				mStr += "@implementation " + modelName + "_Array\n"
				mStr += "+(" + modelName + "_Array*)createWith:(id)Id{" + getArrayCreateWithSourceStr(modelName) + "}\n"
				mStr += "-(" + modelName + " *)objectAtIndexedSubscript:(NSUInteger)idx{\n"
				mStr += "	return [super objectAtIndexedSubscript:idx];\n"
				mStr += "}\n"
				mStr += "@end\n\n"
			}

		}
	}

	ioutil.WriteFile("./webapi/WebAPI_model.h", []byte(hStr), os.ModeAppend)
	ioutil.WriteFile("./webapi/WebAPI_model.m", []byte(mStr), os.ModeAppend)

	//第4步
	//---------------------- modelArr modelIsArray --> objectice-c webapi code ----------------------

	var webApiH = sourceComment + `
#import "WebAPI_model.h"
#import "WebAPIErrorCode.h"

@interface WebAPI : NSObject
//
+(void)registerErrorCode:(enum WebAPIErrorCode)status block:(void(^)())block;
//
//取消Id发起的所有网络请求
//回收所有block
+(void)cancelAllRequestWithId:(id)Id;
//
//
//以下函数
//Id dealloc 会自动调用 cancelAllRequestWithId
//同1个函数调用多次 Id相同的话  会取消上1次的调用 (取消网络请求 回收blcok)`

	var webApiM = sourceComment + `
#import "WebAPI.h"
#import "DJHttp.h"

@implementation WebAPI

+(void)registerErrorCode:(enum WebAPIErrorCode)status block:(void(^)())block{
	[DJHttp registerErrorCode:status block:block];
}

+(void)cancelAllRequestWithId:(id)Id{
	[DJHttp cancelAllRequestWithId:Id];
}`

	for funcName, api := range apiList {
		retType := getType(`Ret_` + funcName)
		webApiH += getWebApiFuncH(api.Comment, funcName, api.Param, retType) + ";\n"
		webApiM += getWebApiFuncH(api.Comment, funcName, api.Param, retType) + "{" + getWebApiFuncM(api.Method, api.Path, api.Param, retType) + "}\n"
	}

	webApiH += "\n@end"
	webApiM += "\n@end"
	ioutil.WriteFile("./webapi/WebAPI.h", []byte(webApiH), os.ModeAppend)
	ioutil.WriteFile("./webapi/WebAPI.m", []byte(webApiM), os.ModeAppend)

	fmt.Println(`————————————————————————success————————————————————————`)
}
