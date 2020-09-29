//
//  ViewController.swift
//  bmi
//
//  Created by mariam alfoudari on 9/24/20.
//

import UIKit

class ViewController: UIViewController {
@IBOutlet weak var heightlabel: UILabel!
    @IBOutlet weak var weightlabel: UILabel!
    @IBOutlet weak var heightfield: UITextField!
    @IBOutlet weak var weightfield: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var BG: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func bmi(height: Double, weight: Double)-> Double{
       return weight / (height * height)
    }
    func status(bmi: Double) -> String{
         if bmi < 20{
            BG.image = UIImage(named: "thin")
            return " 🍃ضعيف"
     }
         else if bmi >= 20 && bmi <= 25{
            BG.image = UIImage(named: "normal")
            return"🥪وزن طبيعي "
     }
         else if bmi >= 25 && bmi <= 40{
            BG.image = UIImage(named: "fat")
            return "🧨سمنه خفيفة"
     }else{
        BG.image = UIImage(named: "super fat")
        return "💣سمنه مفرطة"
     }
        
    }
    
    @IBAction func calculate(_ sender: Any) {
    
        let height = Double(heightfield.text!)!
        let weight = Double(weightfield.text!)!
        
        let calculatedBmi = bmi(height: height, weight: weight )
        let stat = status(bmi: calculatedBmi)
        bmiLabel.text = String(format:"%.1f",calculatedBmi)
        statusLabel.text = stat
    

}
}
