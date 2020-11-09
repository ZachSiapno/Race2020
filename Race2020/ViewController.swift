//
//  ViewController.swift
//  Race2020
//
//  Created by  on 10/26/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let vc = WinVC(nibName: "WinVC", bundle: nil)

    @IBOutlet weak var firstPlaceLabel: UILabel!
    @IBOutlet weak var secondPlaceLabel: UILabel!
    @IBOutlet weak var thirdPlaceLabel: UILabel!
    @IBOutlet weak var fourthPlaceLabel: UILabel!
    
    var car1ImageView: CarImageView!
    var car2ImageView: CarImageView!
    var car3ImageView: CarImageView!
    var car4ImageView: CarImageView!
    
    var grayWin = 0
    var blueWin = 0
    var greenWin = 0
    var orangeWin = 0
    
    var rightCount = 0
    var wrongCount = 0
    
    var prediction = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        vc.previousVC = self
        
        // create the car
        let car1 = Car(theName: "A", theLane: 1, theSpeed: 3.2)
        
        // create the car imageView
        car1ImageView = CarImageView(c: car1)
        
        // add imageview to view
        view.addSubview(car1ImageView)
        
        
        let car2 = Car(theName: "B", theLane: 2, theSpeed: 3.2)
        car2ImageView = CarImageView(c: car2)
        view.addSubview(car2ImageView)
        
        let car3 = Car(theName: "C", theLane: 3, theSpeed: 3.2)
        car3ImageView = CarImageView(c: car3)
        view.addSubview(car3ImageView)
        
        let car4 = Car(theName: "D", theLane: 4, theSpeed: 3.2)
        car4ImageView = CarImageView(c: car4)
        view.addSubview(car4ImageView)
        
        self.view.backgroundColor = UIColor.white
        
        firstPlaceLabel.text = ""
        secondPlaceLabel.text = ""
        thirdPlaceLabel.text = ""
        fourthPlaceLabel.text = ""
        

    }
    
    func predictionAlert(winner: String, prediction: String) {
        if prediction == winner {
            let alert = UIAlertController(title: "Your Prediction is Right", message: nil, preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Nice!", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
            rightCount += 1
        } else {
            let alert = UIAlertController(title: "Your Prediction is Wrong", message: nil, preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Lame!", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
            wrongCount += 1
        }
    }
    
    func winner(winner: String) {
        if winner == "Gray" {
            grayWin += 1
        }
        if winner == "Blue" {
            blueWin += 1
        }
        if winner == "Green" {
            greenWin += 1
        }
        if winner == "Orange" {
            orangeWin += 1
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
                self.winner(winner: winner)
                self.predictionAlert(winner: winner, prediction: self.prediction)
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
                    self.winner(winner: winner)
                    self.predictionAlert(winner: winner, prediction: self.prediction)
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
                self.winner(winner: winner)
                self.predictionAlert(winner: winner, prediction: self.prediction)
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
                self.winner(winner: winner)
                self.predictionAlert(winner: winner, prediction: self.prediction)
                
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WinSegue"
        {
            let confirm = segue.destination as? WinVC
            
            confirm?.myGrayText = "\(grayWin)"
            confirm?.myBlueText = "\(blueWin)"
            confirm?.myGreenText = "\(greenWin)"
            confirm?.myOrangeText = "\(orangeWin)"
            
            confirm?.myRightText = "\(rightCount)"
            confirm?.myWrongText = "\(wrongCount)"
        }
    }
    
    func resetScores() {
        grayWin = 0
        blueWin = 0
        greenWin = 0
        orangeWin = 0
        
        rightCount = 0
        wrongCount = 0
    }
    

}

