//
//  TimeCounter.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//

import Foundation
import Combine
import SwiftUI

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    var buttonTitle = "START"
    var color: Color = .green
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "RESET"
            color = .red
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "RESET" {
            counter = 3
            buttonTitle = "START"
            color = .green
        } else {
            buttonTitle = "Wait..."
            color = .yellow
        }
        objectWillChange.send(self)
    }
    
}
