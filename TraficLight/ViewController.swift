//
//  ViewController.swift
//  TraficLight
//
//  Created by Руслан Мингалиев on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var autoButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    var timer: Timer?
    var counter = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        autoButton.layer.cornerRadius = 10
        startLight()
        
       
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
    }
    
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redLight.alpha = lightOn
            currentLight = .yelloow
            greenLight.alpha = lightOff
        case .yelloow:
            redLight.alpha = lightOff
            yellowLight.alpha = lightOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightOn
            yellowLight.alpha = lightOff
            currentLight = .red
        }
        
    }
    
    @IBAction func autoButtonPressed() {

        if autoButton.currentTitle == "Stop" {
            timer?.invalidate()
            autoButton.setTitle("Auto", for: .normal)
            startLight()
            counter = 7
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeLight), userInfo: nil, repeats: true)
            autoButton.setTitle("Stop", for: .normal)

        }

        
        
    }

}

// MARK: - CurrentLight
extension ViewController {
    enum CurrentLight {
        case red, yelloow, green
    }
    
    func startLight() {
        
        redLight.alpha = lightOff
        yellowLight.alpha = lightOff
        greenLight.alpha = lightOff
    }
}

// MARK: - AutoChangeCollor

extension ViewController {
    
    @objc func changeLight() {
        counter -= 1
        switch counter {
        case 6:
            redLight.alpha = lightOn
            yellowLight.alpha = lightOff
            greenLight.alpha = lightOff
        case 5:
            yellowLight.alpha = lightOn
        case 4:
            redLight.alpha = lightOff
            yellowLight.alpha = lightOff
            greenLight.alpha = lightOn
        case 3:
            greenLight.alpha = lightOff
        case 2:
            greenLight.alpha = lightOn
        case 1:
            greenLight.alpha = lightOff
            counter = 7
        default:
            break
        }
        
    }
}
