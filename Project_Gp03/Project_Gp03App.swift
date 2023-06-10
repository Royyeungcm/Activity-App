//
//  Project_Gp03App.swift
//  Project_Gp03
//
//  Created by Roy's Macbook on 8/6/2023.
//

import SwiftUI

@main
struct Project_G03App: App {
    @ObservedObject var rid = RootId()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView().environmentObject(rid).id(rid.rootId)
        }
    }
}
