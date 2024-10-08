//
//  MockData.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/31/24.
//

import CloudKit

struct MockData {
    
    static var location: CKRecord {
        let record = CKRecord(recordType: RecordType.location)
        record[DDGLocation.kName]           = "Sean's Bar and Grill"
        record[DDGLocation.kAddress]        = "123 Main Street"
        record[DDGLocation.kDescription]    = "This is a test decription. Isn't it awesome. Not sure how long to make it to test the 3 lines."
        record[DDGLocation.kWebsiteURL]     = "https://seanallen.co"
        record[DDGLocation.kLocation]       = CLLocation(latitude: 37.331516, longitude: -121.891054)
        record[DDGLocation.kPhoneNumber]    = "111-111-1111"
        
        return record
    }
    
    static var chipotle: CKRecord {
        let record                          = CKRecord(recordType: RecordType.location, recordID: CKRecord.ID(recordName: "FF9C7613-5D30-470B-86B8-A1D32B2E1237"))
        record[DDGLocation.kName]           = "Chipotle"
        record[DDGLocation.kAddress]        = "1 S Market St Ste 40"
        record[DDGLocation.kDescription]    = "Our local San Jose One South Market Chipotle Mexican Grill is cultivating a better world by serving responsibly sourced, classically-cooked, real food."
        record[DDGLocation.kWebsiteURL]     = "https://locations.chipotle.com/ca/san-jose/1-s-market-st"
        record[DDGLocation.kLocation]       = CLLocation(latitude: 37.334967, longitude: -121.892566)
        record[DDGLocation.kPhoneNumber]    = "408-938-0919"
        
        return record
    }
    
    static var profile: CKRecord {
        let record                      = CKRecord(recordType: RecordType.profile)
        record[DDGProfile.kFirstName]   = "SuperLongFirstName"
        record[DDGProfile.kLastName]    = "SuperLongLastNameJunior"
        record[DDGProfile.kCompanyName] = "Super Long Company Name Incorporated"
        record[DDGProfile.kBio]         = "This is my bio, I hope it's not too long I can't check character count."
        
        return record
    }
}
