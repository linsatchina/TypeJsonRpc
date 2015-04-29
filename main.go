package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

type ParamType string

const (
	ParamType_Int         ParamType = "int"
	ParamType_String                = "string"
	ParamType_Float                 = "float"
	ParamType_Object                = "object"
	ParamType_ObjectArray           = "object_array"
)

type API struct {
	Path        string
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

func buildModel(modelName string, level int, data map[string]interface{}) bool {
	t := data["type"]

	if t == ParamType_Object || t == ParamType_ObjectArray {
		_key_ := data["key"].(map[string]interface{})
		for name, vvv := range _key_ {
			_data_ := vvv.(map[string]interface{})
			hasChild := buildModel(modelName+"_"+name, level+1, _data_)
			_type_ := _data_["type"]
			if hasChild {
				_type_ = modelName + "_" + name + "*"
			}

			if modelArr[level] == nil {
				modelArr[level] = make(map[string]map[string]string)
			}

			if modelArr[level][modelName] == nil {
				modelArr[level][modelName] = make(map[string]string)
			}

			if _type_ == "string" {
				_type_ = "NSString*"
			}

			modelIsArray[modelName] = t == ParamType_ObjectArray
			modelArr[level][modelName][name] = _type_.(string)
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
	//---------------------- modelArr modelIsArray --> objectice-c code ----------------------
	var hStr = sourceComment + `#import <Foundation/Foundation.h>` + "\n\n"
	var mStr = sourceComment + `#import "WebAPI_model.h"` + "\n\n"
	for i := 9; i >= 0; i-- {
		m := modelArr[i]
		for k, v := range m {

			hStr += "@interface " + k + ":NSObject\n"
			for _name_, _type_ := range v {
				if modelIsArray[_type_] {
					hStr += "@property(nonatomic) " + _type_ + "_Array r_" + _name_ + ";\n"
				} else {
					hStr += "@property(nonatomic) " + _type_ + " r_" + _name_ + ";\n"
				}
			}
			hStr += "@end\n\n"

			mStr += "@implementation " + k + "\n@end\n\n"

			if modelIsArray[k] {
				hStr += "@interface " + k + "_Array:NSMutableArray\n"
				hStr += "-(" + k + "*)objectAtIndexedSubscript:(NSUInteger)idx;\n"
				hStr += "@end\n\n"

				mStr += "@implementation " + k + "_Array\n"
				mStr += "-(" + k + " *)objectAtIndexedSubscript:(NSUInteger)idx{\n"
				mStr += "return [super objectAtIndexedSubscript:idx];\n"
				mStr += "}\n"
				mStr += "@end\n\n"
			}

		}
	}

	ioutil.WriteFile("./webapi/WebAPI_model.h", []byte(hStr), os.ModeAppend)
	ioutil.WriteFile("./webapi/WebAPI_model.m", []byte(mStr), os.ModeAppend)

	fmt.Println(`————————————————————————success————————————————————————`)
}
