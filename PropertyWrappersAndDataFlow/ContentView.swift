//
//  ContentView.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            Button("Log Out") {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonStyle(.borderedProminent)
        .tint(timer.color)
    }
}
