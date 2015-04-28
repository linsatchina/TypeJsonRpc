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

func modelArray(modelName string) string {
	var s = ""
	s += "@interface " + modelName + "_Array:NSMutableArray\n"
	s += "-(" + modelName + "*)objectAtIndexedSubscript:(NSUInteger)idx;\n"
	s += "@end\n"
	s += "@implementation " + modelName + "_Array\n"
	s += "-(" + modelName + " *)objectAtIndexedSubscript:(NSUInteger)idx{\n"
	s += "return [super objectAtIndexedSubscript:idx];\n"
	s += "}\n"
	s += "@end\n\n"
	return s
}

func main() {
	//输出错误
	defer func() {
		if err := recover(); err != nil {
			fmt.Println(`————————————————————————生成失败————————————————————————`, err)
		}
	}()
	fmt.Println(`————————————————————————start————————————————————————`)

	d, _ := ioutil.ReadFile(`./api.json`)
	err := json.Unmarshal(d, &apiList)
	if err != nil {
		fmt.Println(`————————————————————————解析 json文件 失败————————————————————————`)
		return
	}

	for funcName, api := range apiList {
		//fmt.Println(`————————————————————————`, funcName, `————————————————————————`)
		buildModel("Ret_"+funcName, 0, api.Respon_data)
	}

	var s = ""
	for i := 9; i >= 0; i-- {
		m := modelArr[i]
		for k, v := range m {

			s += "@interface " + k + ":NSObject\n"
			for _name_, _type_ := range v {
				if modelIsArray[_type_] {
					s += "@property(nonatomic) " + _type_ + "_Array r_" + _name_ + ";\n"
				} else {
					s += "@property(nonatomic) " + _type_ + " r_" + _name_ + ";\n"
				}
			}
			s += "@end\n"
			s += "@implementation " + k + "\n@end\n\n"

			if modelIsArray[k] {
				s += modelArray(k)
			}

		}
	}

	ioutil.WriteFile("./test.h", []byte(s), os.ModeAppend)

	fmt.Println(`————————————————————————success————————————————————————`)
}
