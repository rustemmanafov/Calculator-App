//
//  ViewController.swift
//  calculator
//
//  Created by Rustem Manafov on 07.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWorking: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    @IBOutlet weak var equalOutlet: UIButton!
    
    var working: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        
        equalOutlet.layer.cornerRadius = 10
    }
    
    func clearAll(){
        working = ""
        calculatorResults.text = ""
        calculatorWorking.text = ""
    }
    
    
    @IBAction func acButton(_ sender: Any) {
        clearAll()
        
        
    }
    
    @IBAction func backTap(_ sender: Any) {
        
        if(!working.isEmpty){
            working.removeLast()
            calculatorWorking.text = working
        }
        
    }
    
    func addToWorking(value: String){
        
        working = working + value
        calculatorWorking.text = working
    }
    
    @IBAction func equalTap(_ sender: Any) {
        
        if validInput(){
            _ = working.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: working)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }else{
            
            let alert = UIAlertController(title: "Invalid input", message: "Calculator unable to do math abased on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
            clearAll()
            
        }
        
        
    }
    func validInput() -> Bool{
        
        var count = 0
        var funcCharIndex = [Int]()
        
        for char in working{
            if specialCharacter(char: char){
                funcCharIndex.append(count)
                
            }
            count += 1
            
        }
        
        var previous: Int = -1
        
        
        for index in funcCharIndex {
            if(index == 0 ){
                return false
            }
            if(index == working.count - 1 ){
                return false
            }
            if(previous != -1){
                if (index - previous == 1){
                    return false
                }
            }
            previous = index
            
        }
        
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        
        if (char == "*"){
            return true
        }
        
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        return false
        
        
    }
    
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
        
        
    }
    
    
    @IBAction func percentTAp(_ sender: Any) {
        addToWorking(value: "%")
        
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorking(value: "/")
    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToWorking(value: "*")
    }
    
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorking(value: "-")
    }
    
    @IBAction func plusTAp(_ sender: Any) {
        addToWorking(value: "+")
    }
    
    
    
    
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorking(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addToWorking(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addToWorking(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorking(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorking(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorking(value: "5")
    }
    
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorking(value: "6")
    }
    
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorking(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addToWorking(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorking(value: "9")
    }
    
    
    @IBAction func dotTap(_ sender: Any) {
        addToWorking(value: ".")
    }
    
}

