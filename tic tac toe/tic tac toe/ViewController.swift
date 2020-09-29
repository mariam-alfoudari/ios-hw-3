//
//  ViewController.swift
//  tic tac toe
//
//  Created by mariam alfoudari on 9/27/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var playerLbl: UILabel!
    @IBOutlet weak var computerLbl: UILabel!
    
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var box3: UIImageView!
    @IBOutlet weak var box4: UIImageView!
    @IBOutlet weak var box5: UIImageView!
    @IBOutlet weak var box6: UIImageView!
    @IBOutlet weak var box7: UIImageView!
    @IBOutlet weak var box8: UIImageView!
    @IBOutlet weak var box9: UIImageView!
    
    var i = 0
    var lastValue = "o"
    var player: AVAudioPlayer?
    var playerChoices: [Box] = []
    var computerChoices: [Box] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        soundPlayer()
        createTap( imageView: box1,box: .one)
        createTap( imageView: box2,box: .two)
        createTap( imageView: box3,box: .three)
        createTap( imageView: box4, box: .four)
        createTap( imageView: box5, box: .five)
        createTap( imageView: box6, box: .six)
        createTap( imageView: box7, box: .seven)
        createTap( imageView: box8, box: .eight)
        createTap( imageView: box9, box: .nine)
    }
    func createTap(imageView: UIImageView,box: Box) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.boxClicked(_:)))
        tap.name = box.rawValue
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    
    }
    
    @objc func boxClicked(_ sender: UITapGestureRecognizer) {
        let selectedbox = getBox(from: sender.name ?? "")
        makeChoice(selectedbox)
        playerChoices.append(Box(rawValue: sender.name!)!)
        checkIfWon()
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    self.computerPlay()
        }
    }
    func computerPlay() {
        var availableSpaces = [UIImageView]()
        var availabelBoxes = [Box]()
        for name in Box.allCases {
            let box = getBox(from: name.rawValue)
            if box.image == nil {
                availableSpaces.append(box)
                availabelBoxes.append(name)
            }
        }
        guard  availabelBoxes.count > 0 else {return}
        
        let randIndex = Int.random(in: 0 ..< availableSpaces.count)
        makeChoice(availableSpaces[randIndex])
        computerChoices.append(availabelBoxes[randIndex])
        checkIfWon()
        
    }
    
    func makeChoice(_ selectedbox: UIImageView){
        guard selectedbox.image == nil else{
            return}
        if lastValue == "x"{
            selectedbox.image = #imageLiteral(resourceName: "hiclipart.com (1)")
            lastValue = "o"
        } else {
            selectedbox.image = #imageLiteral(resourceName: "hiclipart.com")
            lastValue = "x"
        }
    }
    func checkIfWon() {
        var correct = [[Box]]()
        let firstRow: [Box] = [.one, .two, .three]
        let secondRow: [Box] = [.four, .five, .six]
        let thirdRow: [Box] = [.seven, .eight, .nine]
        
        let firstCol: [Box] = [.one, .four, .seven]
        let secondCol: [Box] = [.two, .five, .eight]
        let thirdCol: [Box] = [.three, .six, .nine]
        
        let backwardSlash: [Box] = [.one, .five, .nine]
        let forwardSlash: [Box] = [.three, .five, .seven]
        
        correct.append(firstRow)
        correct.append(secondRow)
        correct.append(thirdRow)
        correct.append(firstCol)
        correct.append(secondCol)
        correct.append(thirdCol)
        correct.append(backwardSlash)
        correct.append(forwardSlash)
        
        for valid in correct {
            let userMatch = playerChoices.filter { valid.contains($0) }.count
            let computerMatch = computerChoices.filter { valid.contains($0) }.count
            
            if userMatch == valid.count {
                scoreLbl.text = String((Int(scoreLbl.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            } else if computerMatch == valid.count {
                computerLbl.text = String((Int(computerLbl.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            } else if computerMatch + playerChoices.count == 9 {
                resetGame()
                break
            }
        }
    }
    func resetGame() {
        for name in Box.allCases {
            let box = getBox(from: name.rawValue)
            box.image = nil
        }
        lastValue = "x"
        playerChoices = []
        computerChoices = []
    }
    func getBox(from name: String) -> UIImageView {
        let box = Box(rawValue: name) ?? .one
        
        switch box {
        case .one:
            return box1
        case .two:
            return box2
        case .three:
            return box3
        case .four:
            return box4
        case .five:
            return box5
        case .six:
            return box6
        case .seven:
            return box7
        case .eight:
            return box8
        case .nine:
            return box9
        }
    }

    enum Box: String, CaseIterable{
        case one, two, three, four, five, six, seven, eight, nine
        
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
    
    // end of view controller
}



