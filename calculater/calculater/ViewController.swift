//
//  ViewController.swift
//  calculater
//
//  Created by student on 2022/3/21.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

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
    var inputbuffer:String = ""{
        didSet{
            answer.text = inputbuffer
        }
    }
    var decimalDigits = 0
    var calculationIsFinished = false
    var decimalMode = false
    var percentMode = false
    var isNegative = false
    var ans:Float = 0
    var  inputs:String = "" {
        didSet{
            label0.text = inputs
        }
    }
    
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var label0: UILabel!
    
    
    func clearColorChange(){
        for i in input_operator.indices{
            input_operator[i].backgroundColor = #colorLiteral(red: 0.1356837451, green: 0.4335873425, blue: 0.4642691016, alpha: 1)
            input_operator[i].setTitleColor(#colorLiteral(red: 0.1282067597, green: 0.2997739315, blue: 0.3193427026, alpha: 1), for: UIControl.State.normal)
        }
    }
    
    func highLightButton(pos: Int){
        input_operator[pos].backgroundColor = #colorLiteral(red: 0.1282067597, green: 0.2997739315, blue: 0.3193427026, alpha: 1)
        input_operator[pos].setTitleColor(#colorLiteral(red: 0.3143448532, green: 0.5592369437, blue: 0.5521900058, alpha: 1), for: UIControl.State.normal)
    }
    
    func clearAll(){
        inputs = ""
        inputbuffer = ""
        ans = 0
        decimalDigits = 0
        isNegative = false
        numberArray = []
        operatorArray = []
        clearButton.setTitle("C", for: .normal)
        clearColorChange()
    }
    
    func saveNum(){
        if(inputbuffer != ""){
            //remove "%"
            inputbuffer = inputbuffer.replacingOccurrences(of: "%", with: "")
            if(decimalMode){
                //number without decimal point
                let numWithoutDec = inputbuffer.replacingOccurrences(of: ".", with: "")
                numberArray.append(Float(numWithoutDec)!/powf(10.0, Float(decimalDigits)))
            }else{
                numberArray.append(Float(inputbuffer)!)
            }
            if(percentMode){
                let percentNum = numberArray.last! * 0.01
                numberArray[numberArray.count - 1] = percentNum
                percentMode = false
            }
            inputs += String(numberArray.last!.clean)
            inputbuffer = ""
            decimalDigits = 0
            decimalMode = false
        }else if(inputs != ""){
            inputs.removeLast()
            operatorArray.removeLast()
        }
    }
    
    @IBAction func recordnum(_ sender: UIButton) {
        if(calculationIsFinished){
            clearAll()
            calculationIsFinished = false
        }
        
        if(decimalMode){
            decimalDigits += 1
        }
        inputbuffer = inputbuffer + String(numbers.firstIndex(of: sender)!)
        
    }
    @IBAction func operation(_ sender: UIButton) {
        
        //clear color change
        clearColorChange()
        
        saveNum()
        
        if(inputs != ""){
            switch input_operator.firstIndex(of: sender) {
            case 3:
                inputs += "+"
                operatorArray.append(operators.plus)
                highLightButton(pos: 3)
                break
            case 2:
                inputs += "-"
                operatorArray.append(operators.minus)
                highLightButton(pos: 2)
                break
            case 1:
                inputs += "*"
                operatorArray.append(operators.multiply)
                highLightButton(pos: 1)
                break
            case 0:
                inputs += "/"
                operatorArray.append(operators.divide)
                highLightButton(pos: 0)
                break
            default:
                break
            }
        }else{
            if(input_operator.firstIndex(of: sender) == 3){
                inputbuffer += "0"
                calculationIsFinished = false
            }else if(input_operator.firstIndex(of: sender) == 2){
                inputbuffer += "-"
                isNegative = true
                calculationIsFinished = false
            }
        }
        
    }
    
   
    @IBAction func decimalPoint(_ sender: UIButton) {
        if(calculationIsFinished){
            clearAll()
            calculationIsFinished = false
        }
        //first decimal point
        if(!decimalMode){
            inputbuffer += "."
            decimalMode = true
        }
    }
    
    @IBAction func posOrNeg(_ sender: UIButton) {
        if(inputbuffer == ""){
            inputbuffer += "-"
            isNegative = true
        }else{
            if(!isNegative){//Posivtive to negative
                inputbuffer.insert("-", at: inputbuffer.startIndex)
                isNegative = true
            }else{//Negative to positive
                inputbuffer.removeFirst()
                isNegative = false
            }
        }
    }
    
    @IBAction func percentage(_ sender: UIButton) {
        if(!percentMode){
            inputbuffer += "%"
            percentMode = true
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        
        //all clear
        if(clearButton.currentTitle! == "AC"){
           clearAll()
        }
        
        //last input is a number
        if(inputbuffer != ""){
            //clear the number
            inputbuffer = ""
            decimalDigits = 0
            decimalMode = false
            isNegative = false
            //highlight the last operator button
            if(operatorArray.count != 0){
                switch operatorArray.last! {
                case operators.plus:
                    highLightButton(pos: 3)
                case operators.minus:
                    highLightButton(pos: 2)
                case operators.multiply:
                    highLightButton(pos: 1)
                case operators.divide:
                    highLightButton(pos: 0)
            }
            }
            //C -> AC
            clearButton.setTitle("AC", for: .normal)
        }
        
    }
    
    
    @IBAction func calculatAns(_ sender: UIButton) {
        
        //clear color change
        clearColorChange()
        
        saveNum()
        inputs += "="
        
        //calculate until no operator
        while operatorArray.count > 0 {
            //"*"and"/"
            for i in 0..<operatorArray.count{
                if(i>=operatorArray.count){break}
                if(operatorArray[i] == operators.multiply){
                    numberArray[i] = numberArray[i]*numberArray[i+1]
                    numberArray.remove(at: i+1)
                    operatorArray.remove(at: i)
                }else if(operatorArray[i] == operators.divide){
                    //divided by 0 = 0
                    if(numberArray[i+1] == 0){
                        numberArray[i] = 0
                    }else{
                        numberArray[i] = numberArray[i]/numberArray[i+1]
                    }
                    numberArray.remove(at: i+1)
                    operatorArray.remove(at: i)
                }
            }
            //"+"and"-"
            for i in 0..<operatorArray.count{
                if(i>=operatorArray.count){break}
                if(operatorArray[i] == operators.plus){
                    numberArray[i] = numberArray[i]+numberArray[i+1]
                    numberArray.remove(at: i+1)
                    operatorArray.remove(at: i)
                }else if(operatorArray[i] == operators.minus){
                    numberArray[i] = numberArray[i]-numberArray[i+1]
                    numberArray.remove(at: i+1)
                    operatorArray.remove(at: i)
                }
            }
        }
        //show answer
        ans = numberArray[0]
        inputbuffer = String(ans.clean)
        //finish calculation
        calculationIsFinished = true
        //C -> AC
        clearButton.setTitle("AC", for: .normal)
    }
    
    
    
}

