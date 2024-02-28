//
//  DinoStateModel.swift
//  InfinityFallMaddalone Watch App
//
//  Created by Giovanni Michele on 28/02/24.
//

import Foundation

enum DinoStateModel : Int, CaseIterable, Identifiable {
    case idle
    case walk
    case gameOver
    case jump
    
    var id : Int { return rawValue}
    
    var imageName : String {
        switch self {
            
        case .idle:
            return "maddalone"
        case .walk:
            return "maddalone"
        case .gameOver:
            return "maddaloneMorto"
        case .jump:
            return "maddalone"
            
        }
    }
}
