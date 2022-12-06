//
//  NetworkState.swift
//  Abdo
//
//  Created by Abdo on 7/14/22.
//  Copyright © 2022 Abdo. All rights reserved.
//

import Foundation

enum NetworkState<R: Codable> {
    case success(R)
    case fail(AppError)
    
    var data: R? {
        switch self {
        case .success(let data):
            return data
        default:
            return nil
        }
    }
    
    var error: AppError? {
        switch self {
        case .fail(let error):
            return error
        default:
            return nil
        }
    }
    
    init(_ response: R?) {
        if let response {
            self = .success(response)
        } else {
            self = .fail(MyAppError.networkError)
        }
    }
}
