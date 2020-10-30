//
//  ViewController.swift
//  Race2020
//
//  Created by  on 10/26/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstPlaceLabel: UILabel!
    @IBOutlet weak var secondPlaceLabel: UILabel!
    @IBOutlet weak var thirdPlaceLabel: UILabel!
    @IBOutlet weak var fourthPlaceLabel: UILabel!
    
    var car1ImageView: CarImageView!
    var car2ImageView: CarImageView!
    var car3ImageView: CarImageView!
    var car4ImageView: CarImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // create the car
        var car1 = Car(theName: "A", theLane: 1, theSpeed: 3.2)
        
        // create the car imageView
        car1ImageView = CarImageView(c: car1)
        
        // add imageview to view
        view.addSubview(car1ImageView)
        
        
        var car2 = Car(theName: "B", theLane: 2, theSpeed: 3.2)
        car2ImageView = CarImageView(c: car2)
        view.addSubview(car2ImageView)
        
        var car3 = Car(theName: "C", theLane: 3, theSpeed: 3.2)
        car3ImageView = CarImageView(c: car3)
        view.addSubview(car3ImageView)
        
        var car4 = Car(theName: "D", theLane: 4, theSpeed: 3.2)
        car4ImageView = CarImageView(c: car4)
        view.addSubview(car4ImageView)
        
        self.view.backgroundColor = UIColor.white
        
        firstPlaceLabel.text = ""
        secondPlaceLabel.text = ""
        thirdPlaceLabel.text = ""
        fourthPlaceLabel.text = ""
        

    }
    
    func winnerAlert(winner: String) {
        if winner == "Gray" {
            let alert = UIAlertController(title: "The Gray Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
                    print("User Tapped on OK")
                    
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        if winner == "Blue" {
            let alert = UIAlertController(title: "The Blue Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
                    print("User Tapped on OK")
                    
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        if winner == "Green" {
            let alert = UIAlertController(title: "The Green Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
                    print("User Tapped on OK")
                    
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        if winner == "Orange" {
            let alert = UIAlertController(title: "The Orange Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
                    print("User Tapped on OK")
                    
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func startRace(_ sender: UIButton)
    {
        firstPlaceLabel.text = ""
        secondPlaceLabel.text = ""
        thirdPlaceLabel.text = ""
        fourthPlaceLabel.text = ""
        
        var firstArray = [car1ImageView.car.speed, car2ImageView.car.speed, car3ImageView.car.speed, car4ImageView.car.speed]
        let first = firstArray.min()
        var winner = ""
        
        if first == car1ImageView.car.speed {
            winner = "Gray"
        } else if first == car2ImageView.car.speed {
            winner = "Blue"
        } else if first == car3ImageView.car.speed {
            winner = "Green"
        } else {
            winner = "Orange"
        }
        
        let secondArray = firstArray.filter {
            $0 != first
        }
        let second = secondArray.min()
        
        let thirdArray = secondArray.filter {
            $0 != second
        }
        let third = thirdArray.min()
        
        let fourthArray = thirdArray.filter {
            $0 != third
        }
        let fourth = fourthArray.min()
        
        UIView.animate(withDuration: car1ImageView.car.speed, delay: 0, animations: {
                self.car1ImageView.center = CGPoint(x: self.car1ImageView.center.x, y: -100)
        }, completion: {
            action in
            if first == self.car1ImageView.car.speed {
                self.firstPlaceLabel.text = "First Place: Gray"
                self.view.backgroundColor = UIColor.systemGray5
            }
            else if second == self.car1ImageView.car.speed {
                self.secondPlaceLabel.text = "Second Place: Gray"
            }
            else if third == self.car1ImageView.car.speed {
                self.thirdPlaceLabel.text = "Third Place: Gray"
            } else {
                self.fourthPlaceLabel.text = "Fourth Place: Gray"
                self.winnerAlert(winner: winner)
//                if winner == "Blue" {
//                    let alert = UIAlertController(title: "The Blue Car was first!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
//                if winner == "Green" {
//                    let alert = UIAlertController(title: "The Green Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
//                if winner == "Orange" {
//                    let alert = UIAlertController(title: "The Orange Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
            }
            self.car1ImageView.resetPositionAndSpeed()
        
        })
        
        UIView.animate(withDuration: car2ImageView.car.speed, delay: 0, animations: {
                self.car2ImageView.center = CGPoint(x: self.car2ImageView.center.x, y: -100)
               }, completion: {
                   action in
                if first == self.car2ImageView.car.speed {
                    self.firstPlaceLabel.text = "First Place: Blue"
                    self.view.backgroundColor = UIColor.systemTeal
                } else if second == self.car2ImageView.car.speed {
                    self.secondPlaceLabel.text = "Second Place: Blue"
                }
                else if third == self.car2ImageView.car.speed {
                    self.thirdPlaceLabel.text = "Third Place: Blue"
                } else {
                    self.fourthPlaceLabel.text = "Fourth Place: Blue"
                    self.winnerAlert(winner: winner)
                    
//                    if winner == "Gray" {
//                        let alert = UIAlertController(title: "The Gray Car was first!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                        let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                                print("User Tapped on OK")
//
//                        }
//                        alert.addAction(ok)
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                    if winner == "Green" {
//                        let alert = UIAlertController(title: "The Green Car wins the race!!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                        let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                                print("User Tapped on OK")
//
//                        }
//                        alert.addAction(ok)
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                    if winner == "Orange" {
//                        let alert = UIAlertController(title: "The Orange Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                        let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                                print("User Tapped on OK")
//
//                        }
//                        alert.addAction(ok)
//                        self.present(alert, animated: true, completion: nil)
//                    }
                }
                self.car2ImageView.resetPositionAndSpeed()
               })
        
        UIView.animate(withDuration: car3ImageView.car.speed, delay: 0, animations: {
                self.car3ImageView.center = CGPoint(x: self.car3ImageView.center.x, y: -100)
            }, completion: {
            action in
            if first == self.car3ImageView.car.speed {
                self.firstPlaceLabel.text = "First Place: Green"
                self.view.backgroundColor = UIColor.systemGreen
            } else if second == self.car3ImageView.car.speed {
                self.secondPlaceLabel.text = "Second Place: Green"
            }
            else if third == self.car3ImageView.car.speed {
                self.thirdPlaceLabel.text = "Third Place: Green"
            } else {
                self.fourthPlaceLabel.text = "Fourth Place: Green"
                self.winnerAlert(winner: winner)
                
//                if winner == "Gray" {
//                    let alert = UIAlertController(title: "The Gray Car was first!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
//                if winner == "Blue" {
//                    let alert = UIAlertController(title: "The Blue Car was first!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
//                if winner == "Orange" {
//                    let alert = UIAlertController(title: "The Orange Car wins the race!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
            }
                self.car3ImageView.resetPositionAndSpeed()
        })
        
        UIView.animate(withDuration: car4ImageView.car.speed, delay: 0, animations: {
                self.car4ImageView.center = CGPoint(x: self.car4ImageView.center.x, y: -100)
        }, completion: {
            action in
            if first == self.car4ImageView.car.speed {
                self.firstPlaceLabel.text = "First Place: Orange"
                self.view.backgroundColor = UIColor.systemOrange
            } else if second == self.car4ImageView.car.speed {
                self.secondPlaceLabel.text = "Second Place: Orange"
            }
            else if third == self.car4ImageView.car.speed {
                self.thirdPlaceLabel.text = "Third Place: Orange"
            } else {
                self.fourthPlaceLabel.text = "Fourth Place: Orange"
                self.winnerAlert(winner: winner)
                
//                if winner == "Gray" {
//                    let alert = UIAlertController(title: "The Gray Car was first!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//                            
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                    
//                }
//                if winner == "Blue" {
//                    let alert = UIAlertController(title: "The Blue Car was first!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//                            
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
//                if winner == "Green" {
//                    let alert = UIAlertController(title: "The Green Car wins the race!!", message: nil, preferredStyle: UIAlertController.Style.alert)
//                    let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                            print("User Tapped on OK")
//                            
//                    }
//                    alert.addAction(ok)
//                    self.present(alert, animated: true, completion: nil)
//                }
            }
                self.car4ImageView.resetPositionAndSpeed()
        })
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {

        self.view.backgroundColor = UIColor.white
        
        firstPlaceLabel.text = ""
        secondPlaceLabel.text = ""
        thirdPlaceLabel.text = ""
        fourthPlaceLabel.text = ""
    }
    
    
    

}

