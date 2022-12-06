//
//  RequestMethod.swift
//  Carefer Task
//
//  Created by Abdo on 02/10/2022.
//  Copyright © 2022 Abdo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI

@propertyWrapper
struct GET<T: Codable> {
    
    var wrappedValue: any Network<T> {
        mutating get {
            return request
        }
    }
    
    private var request: any Network<T>
    
    init(url: RequestUrl, encoding: RequestEncodingType = .json) {
        request = AsyncRequest<T>(request: Request(url: url, method: .get, encoding: encoding))
    }
}
