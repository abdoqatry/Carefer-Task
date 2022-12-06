//
//  carefer_TaskApp.swift
//  carefer Task
//
//  Created by Abdo on 02/12/2022.
//

import SwiftUI
import AlamofireEasyLogger

@main
struct carefer_TaskApp: App {
    
    let alamofireLogger = FancyAppAlamofireLogger(prettyPrint: true) {
        print($0)
    }
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
