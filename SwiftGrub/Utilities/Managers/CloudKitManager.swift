//
//  CloudKitManager.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/31/24.
//

import CloudKit

final class CloudKitManager {
    
    static let shared = CloudKitManager()
    
    var userRecord: CKRecord?
    
    func getUserReocrd() {
        CKContainer(identifier: "iCloud.com.chi-apple.DubDubGrub").fetchUserRecordID { recordID, error in
            guard let recordID = recordID, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            CKContainer(identifier: "iCloud.com.chi-apple.DubDubGrub").publicCloudDatabase.fetch(withRecordID: recordID) { userRecord, error in
                guard let userRecord = userRecord, error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                self.userRecord = userRecord
            }
        }
    }
    
    func getLocations(completed: @escaping (Result<[DDGLocation], Error>) -> Void) {
        let sortDescriptor = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
        let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]
        
        CKContainer(identifier: "iCloud.com.chi-apple.DubDubGrub").publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completed(.failure(error!))
                return
            }
            
            guard let records = records else { return }
            
            let locations = records.map { $0.convertToDDGLocation() }
            completed(.success(locations))
        }
    }
    
    func batchSave(records: [CKRecord], completed: @escaping (Result<[CKRecord], Error>) -> Void) {
        
        let operation = CKModifyRecordsOperation(recordsToSave: records)
        
        operation.modifyRecordsCompletionBlock = { savedRecords, _, error in
            guard let savedRecords = savedRecords, error == nil else {
                completed(.failure(error!))
                return
            }
            
            completed(.success(savedRecords))
        }
        
        CKContainer(identifier: "iCloud.com.chi-apple.DubDubGrub").publicCloudDatabase.add(operation)
    }
    
    func fetchRecord(with id: CKRecord.ID, completed: @escaping (Result<CKRecord, Error>) -> Void) {
        
        CKContainer(identifier: "iCloud.com.chi-apple.DubDubGrub").publicCloudDatabase.fetch(withRecordID: id) { record, error in
            guard let record = record, error == nil else {
                completed(.failure(error!))
                return
            }
            
            completed(.success(record))
        }
    }
}
