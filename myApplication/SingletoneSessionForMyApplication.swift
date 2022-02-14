//
//  SingletoneSessionForMyApplication.swift
//  myApplication
//
//  Created by Александр Болохов on 02.01.2022.
//

import UIKit

/// Singleton
class SingletoneSessionForMyApplication {
    
    static let userIdAndTokenSession = SingletoneSessionForMyApplication()
    
    private init() {}
    
    var token = ""
    var userId: Int?
    
}

