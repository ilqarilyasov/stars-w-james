//
//  StarController.swift
//  Stars-w-James
//
//  Created by Ilgar Ilyasov on 1/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class StarController {
    
    private(set) var stars: [Star] = []
    
    func createStar(with name: String, and distance: Double) {
        let star = Star(with: name, and: distance)
        stars.append(star)
    }
    
}
