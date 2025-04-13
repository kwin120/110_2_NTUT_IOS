//
//  ViewController.swift
//  calculater
//
//  Created by student on 2022/3/21.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var numbers: [UIButton]!
    @IBOutlet var input_operator: [UIButton]!
    
    enum operators {
        case plus
        case minus
        case multiply
        case divide
    }
    
    var numberArray:[Float] = []
    var operatorArray:[operators] = []
    var inputbuffer:String = ""
    
    @IBOutlet weak var answer: UILabel!
    var ans:Int = 0{
        didSet{
            answer.text = String(ans)
        }
    }
    @IBOutlet weak var label0: UILabel!
    var  inputs:String = "" {
        didSet{
            label0.text = inputs
        }
    }
    @IBAction func recordnum(_ sender: UIButton) {
        inputs = inputs + String(numbers.firstIndex(of: sender)!)
        inputbuffer = inputbuffer + String(numbers.firstIndex(of: sender)!)
        
    }
    @IBAction func operation(_ sender: UIButton) {
        
        if(inputbuffer != ""){
            numberArray.append(Float(inputbuffer)!)
            inputbuffer = ""
        }else{
            inputs.removeLast()
            operatorArray.removeLast()
        }
        
        switch input_operator.firstIndex(of: sender) {
        case 3:
            inputs += "+"
            operatorArray.append(operators.plus)
            break
        case 2:
            inputs += "-"
            operatorArray.append(operators.minus)
            break
        case 1:
            inputs += "*"
            operatorArray.append(operators.multiply)
            break
        case 0:
            inputs += "/"
            operatorArray.append(operators.divide)
            break
        default:
            break
        }
        
    }
    
    
   
    @IBAction func clear(_ sender: UIButton) {
        inputs = ""
        inputbuffer = ""
        numberArray = []
        operatorArray = []
    }
    
    
    @IBAction func calculatAns(_ sender: UIButton) {
    }
    
    
    
}

