//
//  ComponentKind.swift
//  Demo iOS
//
//  Created by roy on 2019/7/4.
//  Copyright © 2019 xiaoman. All rights reserved.
//

import Foundation

public enum ComponentKind: Int, Codable {
    /// ICAL_NO_COMPONENT
    case no
    
    /// ICAL_ANY_COMPONENT, Used to select all components
    case any
    
    /// ICAL_XROOT_COMPONENT
    case xRoot
    
    /// ICAL_XATTACH_COMPONENT
    case xAttach
    
    /* MIME attached data, returned by parser. */
    /// ICAL_VEVENT_COMPONENT
    case vEvent
    
    /// ICAL_VTODO_COMPONENT
    case vTodo
    
    /// ICAL_VJOURNAL_COMPONENT
    case vJournal
    
    /// ICAL_VCALENDAR_COMPONENT
    case vCalendar
    
    /// ICAL_VAGENDA_COMPONENT
    case vAgenda
    
    /// ICAL_VFREEBUSY_COMPONENT
    case vFreebusy
    
    /// ICAL_VALARM_COMPONENT
    case vAlarm
    
    /// ICAL_XAUDIOALARM_COMPONENT
    case xAudioAlarm
    
    /// ICAL_XDISPLAYALARM_COMPONENT
    case xDisplayAlarm
    
    /// ICAL_XEMAILALARM_COMPONENT
    case xEmailAlarm
    
    /// ICAL_XPROCEDUREALARM_COMPONENT
    case xProcedureAlarm
    
    /// ICAL_VTIMEZONE_COMPONENT
    case vTimeZone
    
    /// ICAL_XSTANDARD_COMPONENT
    case xStandard
    
    /// ICAL_XDAYLIGHT_COMPONENT
    case xDaylight
    
    /// ICAL_X_COMPONENT
    case x
    
    /// ICAL_VSCHEDULE_COMPONENT
    case vSchedule
    
    /// ICAL_VQUERY_COMPONENT
    case vQuery
    
    /// ICAL_VREPLY_COMPONENT
    case vReply
    
    /// ICAL_VCAR_COMPONENT
    case vCar
    
    /// ICAL_VCOMMAND_COMPONENT
    case vCommand
    
    /// ICAL_XLICINVALID_COMPONENT
    case xLicInvalid
    
    /// ICAL_XLICMIMEPART_COMPONENT, a non-stardard component that mirrors structure of MIME data
    case xLicMimePart
    
    /// ICAL_VAVAILABILITY_COMPONENT
    case vAvailability
    
    /// ICAL_XAVAILABLE_COMPONENT
    case xAvailable
    
    /// ICAL_VPOLL_COMPONENT
    case vPoll
    
    /// ICAL_VVOTER_COMPONENT
    case vVoter
    
    /// ICAL_XVOTE_COMPONENT
    case xVote
}
