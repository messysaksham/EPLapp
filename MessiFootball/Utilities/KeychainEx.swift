//
//  Keychain.swift
//  MessiFootball
//
//  Created by Saksham on 05/03/24.
//

import Foundation
import KeychainAccess


class KeychainEx{
    
    let keychain = Keychain(service: "dev.new.MessiFootball")
    
    func savetokeychain(){
        
        
        do {
            try keychain.set("f7a721a5ac0648d6a6aa17f7a20c1feefd928f46", key:"consumersecret")
            print("Consumer secret saved to Keychain")
        } catch let error {
            print("Error saving consumer secret to Keychain: \(error)")
        }
    }
    
    func retrievefromKeychain() -> String? {
        
        
        do {
            let secret = try keychain.get("consumersecret")
            return secret
        } catch let error {
            print("Error retrieving consumer secret from Keychain: \(error)")
            return nil
        }
    }
    
    func savetokeychainXauth(){
       
        
        do {
            try keychain.set("1eee530843624940afb10aefdfa44a9c", key: "xauth")
            print("api saved to Keychain")
        } catch let error {
            print("Error saving consumer secret to Keychain: \(error)")
        }
    }
    
    
    func retrievefromkeychainXauth() -> String? {
        
        
        do {
            let secret = try keychain.get("xauth")
            return secret
        } catch let error {
            print("Error retrieving consumer secret from Keychain: \(error)")
            return nil
        }
    }
    
    
}
