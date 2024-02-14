//
//  KFimage.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import Foundation
import Kingfisher
import SwiftUI


class KFimage {
    
    
    func getImage(url : String)  -> some View  {
        
       return KFImage(URL(string: url))
            .resizable()
            .cacheMemoryOnly()
            .frame(width: 30 ,height: 33)
            .cornerRadius(.pi)
            
        
    }
}
