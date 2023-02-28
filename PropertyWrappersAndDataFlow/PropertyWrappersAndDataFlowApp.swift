//
//  PropertyWrappersAndDataFlowApp.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//

import SwiftUI

@main
struct PropertyWrappersAndDataFlowApp: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
