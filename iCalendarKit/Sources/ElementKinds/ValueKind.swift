//
//  ValueKind.swift
//  iCalendarKit
//
//  Created by roy on 2019/7/4.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

/// icalvalue_kind
public enum ValueKind: Int, Codable {
    /// ICAL_ANY_VALUE
    case any = 5000
    
    /// ICAL_QUERY_VALUE
    case query = 5001
    
    /// ICAL_DATE_VALUE
    case date = 5002
    
    /// ICAL_ATTACH_VALUE
    case attach = 5003
    
    /// ICAL_GEO_VALUE
    case geo = 5004
    
    /// ICAL_STATUS_VALUE
    case status = 5005
    
    /// ICAL_TRANSP_VALUE
    case transp = 5006
    
    /// ICAL_STRING_VALUE
    case string = 5007
    
    /// ICAL_TEXT_VALUE
    case text = 5008
    
    /// ICAL_REQUESTSTATUS_VALUE
    case requestStatus = 5009
    
    /// ICAL_CMD_VALUE
    case cmd = 5010
    
    /// ICAL_BINARY_VALUE
    case binary = 5011
    
    /// ICAL_QUERYLEVEL_VALUE
    case queryLevel = 5012
    
    /// ICAL_FLOAT_VALUE
    case float = 5013
    
    /// ICAL_PERIOD_VALUE
    case period = 5014
    
    /// ICAL_DATETIMEPERIOD_VALUE
    case dateTimePeriod = 5015
    
    /// ICAL_CARLEVEL_VALUE
    case carLevel = 5016
    
    /// ICAL_INTEGER_VALUE
    case integer = 5017
    
    /// ICAL_URI_VALUE
    case URI = 5018
    
    /// ICAL_CLASS_VALUE
    case `class` = 5019
    
    /// ICAL_DURATION_VALUE
    case duration = 5020
    
    /// ICAL_BOOLEAN_VALUE
    case boolean = 5021
    
    /// ICAL_X_VALUE
    case x = 5022
    
    /// ICAL_CALADDRESS_VALUE
    case calAddress = 5023
    
    /// ICAL_TRIGGER_VALUE
    case trigger = 5024
    
    /// ICAL_XLICCLASS_VALUE
    case xlicClass = 5025
    
    /// ICAL_RECUR_VALUE
    case recur = 5026
    
    /// ICAL_ACTION_VALUE
    case action = 5027
    
    /// ICAL_DATETIME_VALUE
    case dateTime = 5028
    
    /// ICAL_UTCOFFSET_VALUE
    case utcOffset = 5029
    
    /// ICAL_METHOD_VALUE
    case method = 5030
    
    /// ICAL_NO_VALUE
    case no = 5031
    
    /// ICAL_BUSYTYPE_VALUE
    case busyType = 5032
    
    /// ICAL_POLLMODE_VALUE
    case pollMode = 5033
    
    /// ICAL_POLLCOMPLETION_VALUE
    case pollCompletion = 5034
    
    /// ICAL_TASKMODE_VALUE
    case taskMode = 5035
}
