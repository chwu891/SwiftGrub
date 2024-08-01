//
//  CKRecord+Ext.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/31/24.
//

import CloudKit

extension CKRecord {
    func convertToDDGLocation() -> DDGLocation { DDGLocation(record: self) }
    func convertToDDGProfile() -> DDGProfile { DDGProfile(record: self) }
}
