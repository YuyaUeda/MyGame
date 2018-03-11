//
//  ViewController.swift
//  MyGame
//
//  Created by apple on 2018/03/05.
//  Copyright © 2018年 Dotinstall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var textLabel: UILabel!
  
  var money: Int = 0 //金額
  var answer: Int = 0 //正解金額
  
  var zero = 0
  var moneyArray = [10000,5000,1000,500,100,50,10,5,1]
  var exchange:Bool = true
  
  
  @IBAction func showHide(_ sender: AnyObject) {
    if sender.isOn {
      exchange = true
    } else {
      exchange = false
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    textLabel.text = String(money)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func pushedMoneyButton(_ sender: AnyObject) {
    if exchange {
      money += moneyArray[sender.tag]
    } else {
      money -= moneyArray[sender.tag]
    }
    textLabel.text = String(money)
    
    self.checkAnswerNum()
  }
  
  @IBAction func reTurn(_ sender: AnyObject) {
    money = 0
    textLabel.text = String(money)
  }
  
  func checkAnswerNum() {
    if(self.answer == self.money) {
      let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
      alert.title = "That's great!!"
      alert.message = "Come again?"

      alert.addAction(
        UIAlertAction(title: "YES!", style: .default, handler: {(action) -> Void in
          
          self.dismiss(animated: true, completion: nil)
      })
      )
      self.present(
        alert,
        animated: true,
        completion: {
          print("アラート表示")
      }
      )
    }
  }
  
}
