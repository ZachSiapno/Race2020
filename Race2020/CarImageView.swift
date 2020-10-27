//
//  CarImageView.swift
//  Race2020
//
//  Created by  on 10/27/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import Foundation
import UIKit

class CarImageView: UIImageView
{
    var car: Car
    
    init(c: Car)
    {
        car = c
        super.init(image: UIImage(named: "A"))
        
        let height = UIScreen.main.bounds.height
        self.frame = CGRect(x: 75 * car.lane, y: Int(height) - 100, width: 50, height: 100)
    }
    
    func resetPositionAndSpeed()
    {
        self.center = CGPoint(x: center.x, y: UIScreen.main.bounds.height - 100)
        self.car.getRandomSpeed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
