//
//  AuthDataSource.swift
//  
//
//  Created by Abdo on 03/10/2022.
//  Copyright © 2022 Abdo. All rights reserved.
//

import Foundation

class MatchesRequest: RequestMaker {
    @GET<MatchesResponse>(url: .path("matches"))
    var network: any Network<MatchesResponse>
}

class HomeDataSource {
    init(
        matchesRequest: some RequestMaker<MatchesResponse> = MatchesRequest()
    ) {
        self.matchesRequest = matchesRequest
    }
    
    let matchesRequest: any RequestMaker<MatchesResponse>
}
