//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        let myFruit1 = Int(arc4random_uniform(UInt32(fruitPicker.numberOfRows(inComponent: 0))))
        let myFruit2 = Int(arc4random_uniform(UInt32(fruitPicker.numberOfRows(inComponent: 1))))
        let myFruit3 = Int(arc4random_uniform(UInt32(fruitPicker.numberOfRows(inComponent: 2))))
        fruitPicker.selectRow(myFruit1, inComponent: 0, animated: true)
        fruitPicker.selectRow(myFruit2, inComponent: 1, animated: true)
        fruitPicker.selectRow(myFruit3, inComponent: 2, animated: true)
        let fruitAt1 = fruitPicker.selectedRow(inComponent: 0)
        let fruitAt2 = fruitPicker.selectedRow(inComponent: 1)
        let fruitAt3 = fruitPicker.selectedRow(inComponent: 2)
        if fruitsArray[fruitAt1 % fruitsArray.count] == fruitsArray[fruitAt2 % fruitsArray.count]
            && fruitsArray[fruitAt1 % fruitsArray.count] == fruitsArray[fruitAt3 % fruitsArray.count]{
            resultLabel.text = "WINNER!"
        }else{
            resultLabel.text = "TRY AGAIN"
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row % fruitsArray.count]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count * 1000
    }

}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



