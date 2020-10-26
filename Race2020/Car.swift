//
//  Car.swift
//  Race2020
//
//  Created by  on 10/26/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import Foundation

class Car
{
    // properties
    var name: String
    var lane: Int
    var speed: Double
    
    // initializers
    init()
    {
        name = "E"
        lane = 1
        speed = 3.2
        getRandomSpeed()
    }
    
    init(theName: String, theLane: Int, theSpeed: Double)
    {
        name = theName
        lane = theLane
        speed = theSpeed
        getRandomSpeed()
    }
    // methods
    func getRandomSpeed()
    {
        speed = Double.random(in: 2...5)
    }
    
}
