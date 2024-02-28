//
//  ObstacleModel.swift
//  InfinityFallMaddalone Watch App
//
//  Created by Giovanni Michele on 28/02/24.
//

import Foundation

enum ObstacleModel : Int, CaseIterable, Identifiable {
    case obs1
    case obs2
    case obs3
    case obs4
    
    var id : Int { return rawValue}
    
    var imageName : String {
        switch self {
            
        case .obs1:
            return "singleSpikeObstacle"
        case .obs2:
            return "twoSpikesObstacle"
        case .obs3:
            return "threeSpikesObstacle"
        case .obs4:
            return "fourSpikesObstacle"
        }
    }
}
