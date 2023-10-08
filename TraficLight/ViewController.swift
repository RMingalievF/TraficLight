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
    
    private var currentLight = CurrentLight.red
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        startLight()
        
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

// MARK: -
