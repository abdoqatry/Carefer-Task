//
//  MakeRequest.swift
//  Carefer Task
//
//  Created by Abdo on 19/10/2022.
//  Copyright © 2022 Abdo. All rights reserved.
//

import Foundation

protocol RequestMaker<T>: AnyObject {
    
    associatedtype T: Codable
    
    var network: any Network<T> { get }
    func makeRequest() -> RequestPublisher<T>
}

extension RequestMaker {
    func makeRequest() -> RequestPublisher<T> {
        network
            .asPublisher()
            .eraseToAnyPublisher()
    }
}
