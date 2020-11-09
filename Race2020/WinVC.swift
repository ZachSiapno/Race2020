//
//  WinVC.swift
//  Race2020
//
//  Created by  on 11/8/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class WinVC: UIViewController {
    var previousVC: ViewController?

    @IBOutlet weak var grayCarWinLabel: UILabel!
    @IBOutlet weak var blueCarWinLabel: UILabel!
    @IBOutlet weak var greenCarWinLabel: UILabel!
    @IBOutlet weak var orangeCarWinLabel: UILabel!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    var myGrayText = ""
    var myBlueText = ""
    var myGreenText = ""
    var myOrangeText = ""
    
    
    @IBOutlet weak var rightPredictionLabel: UILabel!
    @IBOutlet weak var wrongPredictionLabel: UILabel!
    
    
    var myRightText = ""
    var myWrongText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grayCarWinLabel.text = myGrayText
        blueCarWinLabel.text = myBlueText
        greenCarWinLabel.text = myGreenText
        orangeCarWinLabel.text = myOrangeText
        warningLabel.text = "Warning: Going back to the prediction screen will reset this scoreboard"
        warningLabel.numberOfLines = 0
        rightPredictionLabel.text = myRightText
        wrongPredictionLabel.text = myWrongText
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        /*previousVC?.resetScores()*/
        previousVC?.grayWin = 0
        previousVC?.blueWin = 0
        previousVC?.greenWin = 0
        previousVC?.orangeWin = 0
        
        previousVC?.rightCount = 0
        previousVC?.wrongCount = 0
        
        /*
         The above code (both commented and uncommented) do not work. This was intended to be a stretch where I would reset the scores from this viewcontroller, but it's hard to change properties from another VC.
         */
        
        grayCarWinLabel.text = "0"
        blueCarWinLabel.text = "0"
        greenCarWinLabel.text = "0"
        orangeCarWinLabel.text = "0"

        rightPredictionLabel.text = "0"
        wrongPredictionLabel.text = "0"
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
