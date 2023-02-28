//
//  UserManager.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//

import Combine

final class UserManager: ObservableObject {
    @Published var isRegistred = false
    var name = ""
}
