//
//  ConverterViewController.swift
//  ConverterViewController
//
//  Created by Sharoze Amir on 10/26/18.
//  Copyright © 2018 Sharoze Amir. All rights reserved.
//

import UIKit

struct converter {
    var label: String
    var inputUnit: String
    var outputUnit: String
}

class ConverterViewController: UIViewController {

    var conversionList: [converter] = []
    var selectedConvIndex = 0;
    
    var userInput = "";
    
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
   

    @IBAction func conversionAction(_ sender: Any) {
    
        let actionSheet = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: .actionSheet)

        for converter in self.conversionList {
            let action = UIAlertAction(title: converter.label, style: .default){
                (action) in
                self.selectedConvIndex = actionSheet.actions.firstIndex(of: action)!
                self.labelINput()
            }
                actionSheet.addAction(action)
            }
        
        self.present(actionSheet, animated: true, completion: nil)
    }

    
   
    
    func numStyle(_ line: String) -> String{
        
        if(line == ""){
            return "0"
        }
        
            return line

    }
    
    func changeStringToInt(_ line: String) -> Double{
        if let finalVal = line.last {
            if finalVal == "." {
                userInput.remove(at: userInput.endIndex)
                let num = Double(userInput)
                return num!
            }
            else{
                return Double(line)!
            }
        }
        
        return 0.0
    }
    
    
    @IBAction func clearHit(_ sender: Any) {
        userInput = ""
        labelINput()
    }
    
    @IBAction func posnegHit(_ sender: Any) {
        
    if(userInput != ""){
        if(userInput.contains("-")){
            userInput.remove(at: userInput.startIndex)
        }
        else{
            userInput.insert(Character("-"), at: userInput.startIndex)
        }
    }
        
        labelINput()
        
    }
    
    @IBAction func nineHit(_ sender: Any) {
        inputAdd(pressed: "9")
    }
    
    @IBAction func eightHit(_ sender: Any) {
        inputAdd(pressed: "8")
    }
    
    @IBAction func sevenHit(_ sender: Any) {
        inputAdd(pressed: "7")
    }
    
    @IBAction func sixHit(_ sender: Any) {
        inputAdd(pressed: "6")
    }
    
    @IBAction func fiveHit(_ sender: Any) {
        inputAdd(pressed: "5")
    }
    
    @IBAction func fourHit(_ sender: Any) {
        inputAdd(pressed: "4")
    }
    
    @IBAction func threeHit(_ sender: Any) {
        inputAdd(pressed: "3")
    }
    
    @IBAction func twoHit(_ sender: Any) {
        inputAdd(pressed: "2")
    }
    
    @IBAction func oneHit(_ sender: Any) {
        inputAdd(pressed: "1")
    }
    
    @IBAction func zeroHit(_ sender: Any) {
        
        if(userInput != ""){
            inputAdd(pressed: "0")
        }
    }
    
    @IBAction func dotHit(_ sender: Any) {
        
        if(!userInput.contains(".")){
            if(userInput != ""){
                userInput.append(".")
            }
        }
        else{
            userInput.append("0.")
        }
        
        labelINput()
        
    }
    
    func inputAdd(pressed num: String){
        userInput.append(num)
        labelINput()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        conversionList.append(converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"))
        
        conversionList.append(converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
        
        conversionList.append(converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
        
        conversionList.append(converter(label: "kilometers to miles,", inputUnit: "km", outputUnit: "mi"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func converterSwitch(to convSwtch: Double ) -> Double {
        switch selectedConvIndex{
            
        case 0:
            return (convSwtch - 32) * 5/9
        
        case 2:
            return convSwtch * 1.609
            
        case 3:
            return convSwtch / 1.069
        
        default:
            return convSwtch
        }
        
        
    }


    func labelINput(){
        
        let convSwtch = converterSwitch(to: changeStringToInt(userInput))
        
        
        
        inputDisplay.text = numStyle(userInput) + conversionList[self.selectedConvIndex].inputUnit
        
        outputDisplay.text = numStyle(String(convSwtch)) +
            conversionList[self.selectedConvIndex].outputUnit
        
    }


}

