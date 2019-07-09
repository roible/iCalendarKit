//
//  ComponentBridge.m
//  Demo iOS
//
//  Created by roy on 2019/7/4.
//  Copyright © 2019 xiaoman. All rights reserved.
//

#import "ComponentBridge.h"
#import "ical.h"

@implementation ComponentBridge

/**
 解析ics文件，将输出的主体自费串解析为json格式内容，component嵌套其中

 @param content ics文件主体内容
 @return component嵌套的json字典
 */
- (NSDictionary *)parseWithContent:(NSString *)content {
    const char *cStringContent = [content cStringUsingEncoding: NSUTF8StringEncoding];
    icalcomponent *rootCompontent = icalparser_parse_string(cStringContent);
    
    NSDictionary *pareseResult = nil;
    
    if (rootCompontent) {
        pareseResult = [self parseComponentsWithComponent: rootCompontent];
        
        icalcomponent_free(rootCompontent);
    }
    
    return pareseResult;
}

/**
 将输入的 Component 递归解析，生成字典形式的嵌套内容

 @param component (icalcomponent *)类型的组件
 @return 改输入 component 的解析内容（json 字典）
 */
- (NSDictionary *)parseComponentsWithComponent: (icalcomponent *)component {
    NSMutableDictionary *componentInfo = [NSMutableDictionary new];
    
    icalcomponent_kind kind = icalcomponent_isa(component);
    [componentInfo setObject: [NSNumber numberWithInt: kind]
                      forKey: @"icalcomponent_kind"];
    
    NSArray *properties = [self parsePropertiesWithComponent: component];
    
    if (properties) {
        [componentInfo setObject:properties
                          forKey:@"properties"];
    }
    
    // 递归解析子component内容
    icalcomponent *childCompontent = icalcomponent_get_first_component(component,
                                                                       ICAL_ANY_COMPONENT);

    NSMutableArray *subCompontentInfoList = [NSMutableArray new];
    
    while (childCompontent) {
        [subCompontentInfoList addObject:[self parseComponentsWithComponent: childCompontent]];
        childCompontent = icalcomponent_get_next_component(component,
                                                           ICAL_ANY_COMPONENT);
    }
    
    if ([subCompontentInfoList count] > 0) {
        [componentInfo setObject:subCompontentInfoList
                          forKey:@"subcomponents"];
    }
    
    return componentInfo;
}

/**
 将Component中的所有property解析，生成一个由Property所有信息组成的数组

 @param component 某一个component
 @return 该component中所有属性信息（属性信息的字典）数组
 */
- (NSArray *)parsePropertiesWithComponent: (icalcomponent *)component {
    NSMutableArray * list = [NSMutableArray new];
    
    icalproperty* property = icalcomponent_get_first_property(component,
                                                              ICAL_ANY_PROPERTY);
    
    while (property) {
        [list addObject: [self parseSinglePropertyWithProperty: property]];
        property = icalcomponent_get_next_property(component,
                                                   ICAL_ANY_PROPERTY);
    }
    
    return list.count > 0 ? list : nil;
}

/**
 根据一条属性，解析该属性的values

 @param property component中的一个属性
 @return 属性中所有的value的信息（1. icalproperty_kind）组成的字典
 */
- (NSDictionary *)parseSinglePropertyWithProperty: (icalproperty *)property {
    NSMutableDictionary *propertyInfo = [NSMutableDictionary new];
    
    icalproperty_kind kind = icalproperty_isa(property);
    [propertyInfo setObject: [NSNumber numberWithInt:kind]
                     forKey: @"icalproperty_kind"];
    
    NSDictionary *valueInfo = [self parseValueWithProperty: property];
    [propertyInfo setObject: valueInfo
                           forKey: @"valueInfo"];
    
    NSArray *parameters = [self parseParametersWithProperty: property];
    if (parameters) {
        [propertyInfo setObject:parameters forKey: @"parameters"];
    }
    
    return propertyInfo;
}

/**
 解析属性，获取属性中value值的类型，以及value的值（以字符串的形式给出）

 @param property 解析的属性
 @return 解析后的字典json
 */
-(NSDictionary *) parseValueWithProperty: (icalproperty *)property {
    NSMutableDictionary * valueInfo = [NSMutableDictionary new];
    
    icalvalue *value =  icalproperty_get_value(property);
    
    icalvalue_kind kind = icalvalue_isa(value);
    [valueInfo setObject: [NSNumber numberWithInt:kind]
                  forKey: @"icalvalue_kind"];
    
    NSString *textValue = [NSString stringWithCString: icalvalue_as_ical_string(value)
                                             encoding: NSUTF8StringEncoding];
    [valueInfo setObject: textValue
                  forKey: @"value"];
    
    return valueInfo;
}


/**
 解析属性，获取属性中 parameter 的值，及parameter的类型信息

 @param property 解析的属性
 @return parameter的信息
 */
- (NSArray *)parseParametersWithProperty: (icalproperty *)property {
    NSMutableArray * parameterList = [NSMutableArray new];

    icalparameter *parameter = icalproperty_get_first_parameter(property,
                                                                ICAL_ANY_PARAMETER);
    
    while (parameter) {
        NSMutableDictionary * parameterInfo = [NSMutableDictionary new];
        icalparameter_kind kind = icalparameter_isa(parameter);
        [parameterInfo setObject: [NSNumber numberWithInt: kind] forKey: @"icalparameter_kind"];
        
        NSString * keyValuePairString = [NSString stringWithCString: icalparameter_as_ical_string(parameter)
                                                           encoding: NSUTF8StringEncoding];
        NSArray *pair = [keyValuePairString componentsSeparatedByString:@"="];

        if (pair.count > 1) {
            [parameterInfo setObject: pair[1] forKey: @"value"];
            [parameterList addObject: parameterInfo];
        }

        parameter = icalproperty_get_next_parameter(property, ICAL_ANY_PARAMETER);
    }

    return parameterList.count > 0 ? parameterList : nil;
}
@end

