//
//  HomeViewModel.swift
//  Carefer Task
//
//  Created by Abdo on 02/12/2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published @MainActor var state: ScreenState<[MatchScreenData]> = .ideal
    
    @Published var scans: [MatchScreenData] = []
    
    var groupedByDate: [Date: [MatchScreenData]] {
        Dictionary(grouping: scans, by: { $0.scanDate })
    }

    var headers: [Date] {
        groupedByDate.map({ $0.key }).sorted()
    }
    
    private let ds = HomeDataSource()
    private var bag = Set<AnyCancellable>()
    
    @MainActor
    func viewDidLoad() async {
        state = .loading
        
        async let networkState = ds.matchesRequest
            .makeRequest()
            .singleOutput(with: &bag)
        
        switch await networkState {
        case .success(let response):
            scans = (response.matches ?? []).map({
                MatchScreenData(model: $0)
            })
            state = .success(scans)
        case .fail(let error):
            state = .failure(error.errorDescription)
        }
    }
}

extension Publisher where Failure == Never {
    func singleOutput( with bag: inout Set<AnyCancellable>) async -> Output {
        return await withCheckedContinuation { continuation in
            sink(receiveValue: { value in
                continuation.resume(returning: value)
            }).store(in: &bag)
        }
    }
}

