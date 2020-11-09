//
//  PredictionVC.swift
//  Race2020
//
//  Created by  on 11/5/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class PredictionVC: UIViewController {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carLabel: UILabel!
    
    let colorArray = ["Gray", "Blue", "Green", "Orange"]
    let imageNameArray = ["A", "B", "C", "D"]
    let backgroundArray = [UIColor.systemGray5, UIColor.systemTeal, UIColor.systemGreen, UIColor.systemOrange]
    var tapCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        carLabel.text = colorArray[0]
        carImage.image = UIImage(named: imageNameArray[0])
        view.backgroundColor = backgroundArray[0]
    }
    
    
    @IBAction func tapColorCar(_ sender: UITapGestureRecognizer) {
        tapCounter += 1
        tapCounter = tapCounter % 4
        carLabel.text = colorArray[tapCounter]
        carImage.image = UIImage(named: imageNameArray[tapCounter])
        view.backgroundColor = backgroundArray[tapCounter]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartIdentifier" {
            let confirm = segue.destination as? ViewController
            
            confirm?.prediction = colorArray[tapCounter]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
