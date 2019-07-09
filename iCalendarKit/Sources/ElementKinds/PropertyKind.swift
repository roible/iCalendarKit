//
//  PropertyKind.swift
//  iCalendarKit
//
//  Created by roy on 2019/7/4.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

/// icalproperty_kind
public enum PropertyKind: Int, Codable {
    /// ICAL_ANY_PROPERTY
    case any = 0
    
    /// ICAL_ACKNOWLEDGED_PROPERTY
    case acknowledged = 1
    
    /// ICAL_ACTION_PROPERTY
    case action = 2
    
    /// ICAL_ALLOWCONFLICT_PROPERTY
    case allowConflict = 3
    
    /// ICAL_ATTACH_PROPERTY
    case attach = 4
    
    /// ICAL_ATTENDEE_PROPERTY
    case attendee = 5
    
    /// ICAL_CALID_PROPERTY
    case calId = 6
    
    /// ICAL_CALMASTER_PROPERTY
    case calMaster = 7
    
    /// ICAL_CALSCALE_PROPERTY
    case calScale = 8
    
    /// ICAL_CAPVERSION_PROPERTY
    case capVersion = 9
    
    /// ICAL_CARLEVEL_PROPERTY
    case carLevel = 10
    
    /// ICAL_CARID_PROPERTY
    case carId = 11
    
    /// ICAL_CATEGORIES_PROPERTY
    case categories = 12
    
    /// ICAL_CLASS_PROPERTY
    case `class` = 13
    
    /// ICAL_CMD_PROPERTY
    case cmd = 14
    
    /// ICAL_COMMENT_PROPERTY
    case comment = 15
    
    /// ICAL_COMPLETED_PROPERTY
    case completed = 16
    
    /// ICAL_COMPONENTS_PROPERTY
    case compontents = 17
    
    /// ICAL_CONTACT_PROPERTY
    case contact = 18
    
    /// ICAL_CREATED_PROPERTY
    case created = 19
    
    /// ICAL_CSID_PROPERTY
    case csid = 20
    
    /// ICAL_DATEMAX_PROPERTY
    case dateMax = 21
    
    /// ICAL_DATEMIN_PROPERTY
    case dateMin = 22
    
    /// ICAL_DECREED_PROPERTY
    case decreed = 23
    
    /// ICAL_DEFAULTCHARSET_PROPERTY
    case defaultCharSet = 24
    
    /// ICAL_DEFAULTLOCALE_PROPERTY
    case defaultLocale = 25
    
    /// ICAL_DEFAULTTZID_PROPERTY
    case defaultTzid = 26
    
    /// ICAL_DEFAULTVCARS_PROPERTY
    case defaultVcars = 27
    
    /// ICAL_DENY_PROPERTY
    case deny = 28
    
    /// ICAL_DESCRIPTION_PROPERTY
    case description = 29
    
    /// ICAL_DTEND_PROPERTY
    case dtEnd = 30
    
    /// ICAL_DTSTAMP_PROPERTY
    case dtStamp = 31
    
    /// ICAL_DTSTART_PROPERTY
    case dtStart = 32
    
    /// ICAL_DUE_PROPERTY
    case due = 33
    
    /// ICAL_DURATION_PROPERTY
    case duration = 34
    
    /// ICAL_EXDATE_PROPERTY
    case exDate = 35
    
    /// ICAL_EXPAND_PROPERTY
    case exPand = 36
    
    /// ICAL_EXRULE_PROPERTY
    case exRule = 37
    
    /// ICAL_FREEBUSY_PROPERTY
    case freeBusy = 38
    
    /// ICAL_GEO_PROPERTY
    case geo = 39
    
    /// ICAL_GRANT_PROPERTY
    case grant = 40
    
    /// ICAL_ITIPVERSION_PROPERTY
    case itipVersion = 41
    
    /// ICAL_LASTMODIFIED_PROPERTY
    case lastModified = 42
    
    /// ICAL_LOCATION_PROPERTY
    case location = 43
    
    /// ICAL_MAXCOMPONENTSIZE_PROPERTY
    case maxComponentSize = 44
    
    /// ICAL_MAXDATE_PROPERTY
    case maxDate = 45
    
    /// ICAL_MAXRESULTS_PROPERTY
    case maxResults = 46
    
    /// ICAL_MAXRESULTSSIZE_PROPERTY
    case maxResultsSize = 47
    
    /// ICAL_METHOD_PROPERTY
    case method = 48
    
    /// ICAL_MINDATE_PROPERTY
    case minDate = 49
    
    /// ICAL_MULTIPART_PROPERTY
    case multipart = 50
    
    /// ICAL_NAME_PROPERTY
    case name = 51
    
    /// ICAL_ORGANIZER_PROPERTY
    case organizer = 52
    
    /// ICAL_OWNER_PROPERTY
    case owner = 53
    
    /// ICAL_PERCENTCOMPLETE_PROPERTY
    case percentComplete = 54
    
    /// ICAL_PERMISSION_PROPERTY
    case permission = 55
    
    /// ICAL_PRIORITY_PROPERTY
    case priority = 56
    
    /// ICAL_PRODID_PROPERTY
    case prodID = 57
    
    /// ICAL_QUERY_PROPERTY
    case query = 58
    
    /// ICAL_QUERYLEVEL_PROPERTY
    case queryLevel = 59
    
    /// ICAL_QUERYID_PROPERTY
    case queryID = 60
    
    /// ICAL_QUERYNAME_PROPERTY
    case quaryName = 61
    
    /// ICAL_RDATE_PROPERTY
    case rDate = 62
    
    /// ICAL_RECURACCEPTED_PROPERTY
    case recurAccepted = 63
    
    /// ICAL_RECUREXPAND_PROPERTY
    case recurExpand = 64
    
    /// ICAL_RECURLIMIT_PROPERTY
    case recurLimit = 65
    
    /// ICAL_RECURRENCEID_PROPERTY
    case recurRenceID = 66
    
    /// ICAL_RELATEDTO_PROPERTY
    case relatedTo = 67
    
    /// ICAL_RELCALID_PROPERTY
    case relcalID = 68
    
    /// ICAL_REPEAT_PROPERTY
    case `repeat` = 69
    
    /// ICAL_REQUESTSTATUS_PROPERTY
    case requestStatus = 70
    
    /// ICAL_RESOURCES_PROPERTY
    case resources = 71
    
    /// ICAL_RESTRICTION_PROPERTY
    case restriction = 72
    
    /// ICAL_RRULE_PROPERTY
    case rRule = 73
    
    /// ICAL_SCOPE_PROPERTY
    case scope = 74
    
    /// ICAL_SEQUENCE_PROPERTY
    case sequence = 75
    
    /// ICAL_STATUS_PROPERTY
    case status = 76
    
    /// ICAL_STORESEXPANDED_PROPERTY
    case storesExpanded = 77
    
    /// ICAL_SUMMARY_PROPERTY
    case summary = 78
    
    /// ICAL_TARGET_PROPERTY
    case target = 79
    
    /// ICAL_TRANSP_PROPERTY
    case transp = 80
    
    /// ICAL_TRIGGER_PROPERTY
    case trigger = 81
    
    /// ICAL_TZID_PROPERTY
    case tzID = 82
    
    /// ICAL_TZNAME_PROPERTY
    case tzName = 83
    
    /// ICAL_TZOFFSETFROM_PROPERTY
    case tzOffsetFrom = 84
    
    /// ICAL_TZOFFSETTO_PROPERTY
    case tzOffsetTo = 85
    
    /// ICAL_TZURL_PROPERTY
    case tzURL = 86
    
    /// ICAL_UID_PROPERTY
    case uID = 87
    
    /// ICAL_URL_PROPERTY
    case url = 88
    
    /// ICAL_VERSION_PROPERTY
    case version = 89
    
    /// ICAL_X_PROPERTY
    case x = 90
    
    /// ICAL_XLICCLASS_PROPERTY
    case xlicClass = 91
    
    /// ICAL_XLICCLUSTERCOUNT_PROPERTY
    case xlicClusterCount = 92
    
    /// ICAL_XLICERROR_PROPERTY
    case xlicError = 93
    
    /// ICAL_XLICMIMECHARSET_PROPERTY
    case xlicMimeCharset = 94
    
    /// ICAL_XLICMIMECID_PROPERTY
    case xlicMimeCID = 95
    
    /// ICAL_XLICMIMECONTENTTYPE_PROPERTY
    case xlicMimeContentType = 96
    
    /// ICAL_XLICMIMEENCODING_PROPERTY
    case xlicMimeEncoding = 97
    
    /// ICAL_XLICMIMEFILENAME_PROPERTY
    case xlicMimeFileName = 98
    
    /// ICAL_XLICMIMEOPTINFO_PROPERTY
    case xlicMimeOptInfo = 99
    
    /// ICAL_NO_PROPERTY
    case no = 100
    
    /// ICAL_BUSYTYPE_PROPERTY
    case busyType = 101
    
    /// ICAL_ACCEPTRESPONSE_PROPERTY
    case acceptResponse = 102
    
    /// ICAL_POLLITEMID_PROPERTY
    case pollItemId = 103
    
    /// ICAL_POLLMODE_PROPERTY
    case pollMode = 104
    
    /// ICAL_POLLPROPERTIES_PROPERTY
    case pollProperties = 105
    
    /// ICAL_POLLWINNER_PROPERTY
    case pollWinner = 106
    
    /// ICAL_VOTER_PROPERTY
    case voter = 107
    
    /// ICAL_TZIDALIASOF_PROPERTY
    case tzidAliasof = 108
    
    /// ICAL_TZUNTIL_PROPERTY
    case tzUntil = 109
    
    /// ICAL_POLLCOMPLETION_PROPERTY
    case pollCompletion = 110
    
    /// ICAL_REPLYURL_PROPERTY
    case replyURL = 111
    
    /// ICAL_RESPONSE_PROPERTY
    case response = 112
    
    /// ICAL_ESTIMATEDDURATION_PROPERTY
    case estimatedDuration = 113
    
    /// ICAL_TASKMODE_PROPERTY
    case taskMode = 114    
}
