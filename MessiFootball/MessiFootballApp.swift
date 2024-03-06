//
//  MessiFootballApp.swift
//  MessiFootball
//
//  Created by Saksham on 08/02/24.
//

import SwiftUI

@main
struct MessiFootballApp: App {
    let keychain = KeychainEx()
    
    @StateObject  var viewmodel = Viewmodel.shared
    
    init(){
        
        keychain.savetokeychainXauth()
        keychain.savetokeychain()
        
    }
    var body: some Scene {
        WindowGroup {
            EntryView()
                .environmentObject(viewmodel)
                
           
        }
    }
}
