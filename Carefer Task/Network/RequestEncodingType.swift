//
//  RequestEncodingType.swift
//  Abdo
//
//  Created by Abdo on 06/11/2022.
//

import Foundation
import Alamofire

enum RequestEncodingType {
    case json
    case url
    
    var value: ParameterEncoding {
        switch self {
        case .json:
           return JSONEncoding.default
        case .url:
            return URLEncoding.default
        }
    }
}
