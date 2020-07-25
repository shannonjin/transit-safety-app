//
//  ViewRouter.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/25/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    var currentPage: String = "login" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
