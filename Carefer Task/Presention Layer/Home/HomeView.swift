//
//  HomeView.swift
//  carefer Task
//
//  Created by Abdo on 02/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var isInFavoriteMode = false
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            Text("")
            // LoadingView(isShowing: vm.state.isLoading) {
            //
            // }
        case .failure(let error):
            Text("")
            // Alert(showToast: $vm.showingAlert, message: error) {
            //
            // }
        case .success(let data):
            Picker(selection: $isInFavoriteMode, label: Text("Picker here")) {
                Text("All")
                    .tag(false)
                Text("Favorites")
                    .tag(true)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 16)
            
            List {
                ForEach(viewModel.headers, id: \.self) { header in
                    Section(header: Text(header.description)) {
                        ForEach(viewModel.groupedByDate[header]!) { scan in
                            Text(scan.title)
                        }
                    }
                }
            }
        case .ideal:
            Text("")
                .task {
                    await viewModel.viewDidLoad()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
