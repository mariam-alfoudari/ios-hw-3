//
//  ViewController.swift
//  order
//
//  Created by mariam alfoudari on 9/25/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var enterBudget: UITextField!
    @IBOutlet weak var coneic: UILabel!
    @IBOutlet weak var cupic: UILabel!
    @IBOutlet weak var stick1: UILabel!
    @IBOutlet weak var stick2: UILabel!
    @IBOutlet weak var yourBudget: UILabel!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setButton(_ sender: Any) {
        yourBudget.text = "\(enterBudget.text!)"
    }
    
    @IBAction func coneStepper(_ sender: UIStepper) {
        coneic.text = String(Int(sender.value))
        let b = (yourBudget.text! as NSString).doubleValue
        let a = 1.5
        let sum = b-a
        yourBudget.text = String( format: "\(sum) kd", sum)
        
    
    }
    @IBAction func cupStepper(_ sender: UIStepper) {
        cupic.text! = String(sender.value)
        cupic.text = String(Int(sender.value))
        let b = (yourBudget.text! as NSString).doubleValue
        let a = 2.5
        let sum = b-a
        yourBudget.text = String( format: "\(sum) kd", sum)
        
    }
    @IBAction func stick1Stepper(_ sender: UIStepper) {
        stick1.text! = String(sender.value)
        stick1.text = String(Int(sender.value))
        let b = (yourBudget.text! as NSString).doubleValue
        let a = 1.30
        let sum = b-a
        yourBudget.text = String( format: "\(sum) kd", sum)
        
    }
    @IBAction func stick2Stepper(_ sender: UIStepper) {
        stick2.text! = String(sender.value)
        stick2.text = String(Int(sender.value))
        let b = (yourBudget.text! as NSString).doubleValue
        let a = 1.5
        let sum = b-a
        yourBudget.text = "\(sum)"
        yourBudget.text = String( format: "\(sum) kd", sum)
    }
    func soundPlayer(){
        let path = Bundle.main.path(forResource: "song.mp3", ofType:nil)!
    let url = URL(fileURLWithPath: path)

    do {
        player = try AVAudioPlayer(contentsOf: url)
       player?.play()
    } catch {
        // couldn't load file :(
    }
       
       }
}
