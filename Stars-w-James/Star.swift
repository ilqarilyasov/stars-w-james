//
//  Star.swift
//  Stars-w-James
//
//  Created by Ilgar Ilyasov on 1/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Star: Codable {
    
    let name: String
    let distance: Double
    
    init(with name: String, and distance: Double) {
        self.name = name
        self.distance = distance
    }
}
