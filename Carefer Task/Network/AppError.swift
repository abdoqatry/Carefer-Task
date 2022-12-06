//
//  AppError.swift
//  Abdo
//
//  Created by Abdo on 16/12/2021.
//  Copyright © 2021 Abdo. All rights reserved.
//

import Foundation

protocol AppError: LocalizedError {
    var errorDescription: String { get }
}

enum MyAppError: AppError {
    
    case networkError
    case businessError(String)
    
    public var errorDescription: String {
        switch self {
        case .networkError:
            return "networkError"
        case .businessError( let error):
            return error
        }
    }
}
