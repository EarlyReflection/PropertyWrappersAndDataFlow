//
//  StarterView.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var user: UserManager

    var body: some View {
        Group {
            if user.isRegistred {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
