//
//  HapticManager.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 8/5/24.
//

import UIKit

struct HapticManager {
    
    static func playSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
