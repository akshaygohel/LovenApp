//
//  LVConfiguration.swift
//  LovenApp
//
//  Created by Akshay Gohel on 2020-01-03.
//  Copyright © 2020 Akshay Gohel. All rights reserved.
//

import Foundation

struct LVConfiguration {
    
    static let isDebug = false
    
    static var nonApiBaseUrl: String {
        if LVConfiguration.isDebug {
            return "http://www.lovenapp.com/dev"
        } else {
            return "https://www.lovenapp.com"
        }
    }
    
}
