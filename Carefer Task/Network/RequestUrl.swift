//
//  RequestUrl.swift
//  Abdo
//
//  Created by Abdo on 7/14/22.
//  Copyright © 2022 Abdo. All rights reserved.
//

import Foundation

enum RequestUrl {
    case full(String)
    case path(String)
    
    var value: String {
        
        let baseUrl = Constants.baseUrl
        
        switch self {
        case .full(let url):
            return url
            
        case.path(let path):
            return baseUrl + path
        }
    }
}
