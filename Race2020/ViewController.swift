//
//  ViewController.swift
//  Race2020
//
//  Created by  on 10/26/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var car1ImageView: CarImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // create the car
        var car1 = Car(theName: "A", theLane: 1, theSpeed: 3.2)
        
        // create the car imageView
        car1ImageView = CarImageView(c: car1)
        
        // add imageview to view
        view.addSubview(car1ImageView)
        
        
        var joeysCar = Car()
        
        var dannysCar = Car(theName: "B", theLane: 2, theSpeed: 4)
        
        var vincesCar = Car()
//        vincesCar.speed = 100
//        vincesCar.lane = 3
//        vincesCar.getRandomSpeed()
    }

    @IBAction func startRace(_ sender: UIButton)
    {
        UIView.animate(withDuration: car1ImageView.car.speed, delay: 0, animations: {
            self.car1ImageView.center = CGPoint(x: self.car1ImageView.center.x, y: -100)
        }, completion: {
            action in
            self.car1ImageView.resetPositionAndSpeed()
        })
    }
    

}

