//
//  StarController.swift
//  Stars-w-James
//
//  Created by Ilgar Ilyasov on 1/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - Properties
    
    private(set) var stars = [Star]()
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let docDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = docDir.appendingPathComponent("stars.plist")
        return url
    }
    
    // MARK: - Functions
    
    func createStar(with name: String, and distance: Double) {
        let star = Star(with: name, and: distance)
        stars.append(star)
        saveToPersistentStore()
    }
    
    // MARK: - Persistent Store functions
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            NSLog("Error encoding data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = persistentFileURL,
            FileManager.default.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let stars = try decoder.decode([Star].self, from: data)
            self.stars = stars
        } catch {
            NSLog("Error decoding data: \(error)")
        }
    }
}
