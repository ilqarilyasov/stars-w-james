//
//  ViewController.swift
//  Stars-w-James
//
//  Created by Ilgar Ilyasov on 1/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceLightYearsTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    let starController = StarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = starNameTextField.text,
            let distanceString = distanceLightYearsTextField.text,
            let distance = Double(distanceString) else { return }
        
        starController.createStar(with: name, and: distance)
        listStars()
        clearTextFields()
    }
    
    func listStars() {
        var output = ""
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away.\n"
        }
        textView.text = output
    }
    
    func clearTextFields() {
        starNameTextField.text = nil
        distanceLightYearsTextField.text = nil
    }
}

