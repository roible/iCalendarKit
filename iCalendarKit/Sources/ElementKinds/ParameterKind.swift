//
//  ParameterKind.swift
//  Demo iOS
//
//  Created by roy on 2019/7/5.
//  Copyright © 2019 xianman. All rights reserved.
//

import Foundation

/// icalparameter_kind
public enum ParameterKind: Int, Codable {
    /// ICAL_ANY_PARAMETER = 0
    case any
    
    /// ICAL_ACTIONPARAM_PARAMETER = 1
    case actionParam
    
    /// ICAL_ALTREP_PARAMETER = 2
    case altrep
    
    /// ICAL_CHARSET_PARAMETER = 3
    case charset
    
    /// ICAL_CN_PARAMETER = 4
    case cn
    
    /// ICAL_CUTYPE_PARAMETER = 5
    case cuType
    
    /// ICAL_DELEGATEDFROM_PARAMETER = 6
    case delegatedFrom
    
    /// ICAL_DELEGATEDTO_PARAMETER = 7
    case delegatedTo
    
    /// ICAL_DIR_PARAMETER = 8
    case dir
    
    /// ICAL_ENABLE_PARAMETER = 9
    case enable
    
    /// ICAL_ENCODING_PARAMETER = 10
    case encoding
    
    /// ICAL_FBTYPE_PARAMETER = 11
    case fbType
    
    /// ICAL_FMTTYPE_PARAMETER = 12
    case fmtType
    
    /// ICAL_ID_PARAMETER = 13
    case id
    
    /// ICAL_LANGUAGE_PARAMETER = 14
    case language
    
    /// ICAL_LATENCY_PARAMETER = 15
    case latency
    
    /// ICAL_LOCAL_PARAMETER = 16
    case lcoal
    
    /// ICAL_LOCALIZE_PARAMETER = 17
    case localize
    
    /// ICAL_MEMBER_PARAMETER = 18
    case member
    
    /// ICAL_OPTIONS_PARAMETER = 19
    case options
    
    /// ICAL_PARTSTAT_PARAMETER = 20
    case partstat
    
    /// ICAL_RANGE_PARAMETER = 21
    case range
    
    /// ICAL_RELATED_PARAMETER = 22
    case realated
    
    /// ICAL_RELTYPE_PARAMETER = 23
    case relType
    
    /// ICAL_ROLE_PARAMETER = 24
    case role
    
    /// ICAL_RSVP_PARAMETER = 25
    case rsvp
    
    /// ICAL_SENTBY_PARAMETER = 26
    case sentby
    
    /// ICAL_TZID_PARAMETER = 27
    case tzid
    
    /// ICAL_VALUE_PARAMETER = 28
    case value
    
    /// ICAL_X_PARAMETER = 29
    case x
    
    /// ICAL_XLICCOMPARETYPE_PARAMETER = 30
    case xLicCompareType
    
    /// ICAL_XLICERRORTYPE_PARAMETER = 31
    case xlicErrorType
    
    /// ICAL_NO_PARAMETER = 32
    case no
    
    /// ICAL_IANA_PARAMETER = 33
    case iana
    
    /// ICAL_SCHEDULEAGENT_PARAMETER = 34
    case scheduleAgent
    
    /// ICAL_SCHEDULEFORCESEND_PARAMETER = 35
    case scheduleForceSend
    
    /// ICAL_SCHEDULESTATUS_PARAMETER = 36
    case shceduleStatus
    
    /// ICAL_PUBLICCOMMENT_PARAMETER = 37
    case publicComment
    
    /// ICAL_RESPONSE_PARAMETER = 38
    case response
    
    /// ICAL_STAYINFORMED_PARAMETER = 39
    case stayInformed
    
    /// ICAL_MANAGEDID_PARAMETER = 40
    case managedID
    
    /// ICAL_SIZE_PARAMETER = 41
    case size
    
    /// ICAL_FILENAME_PARAMETER = 42
    case filename
    
    /// ICAL_REASON_PARAMETER = 43
    case reason
    
    //    /// ICAL_REQUIRED_PARAMETER = 43
    //    case required
    
    /// ICAL_MODIFIED_PARAMETER = 44
    case modified
    
    /// ICAL_SUBSTATE_PARAMETER = 45
    case subState
}

extension ParameterKind {
    var name: String {
        return ""
    }
}
