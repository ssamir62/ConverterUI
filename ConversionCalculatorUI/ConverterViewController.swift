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

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBAction func converterAction(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: .actionSheet)
        
        for converter in self.conversionList {
            let action = UIAlertAction(title: converter.label, style: .default){
                (action) in
                self.selectedConvIndex = actionSheet.actions.firstIndex(of: action)!
                self.labelINput()
            }
                actionSheet.addAction(action)
            }
        }
    
    
    var conversionList: [converter] = []
    var selectedConvIndex = 0;
    
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


    func labelINput(){
        outputDisplay.text = conversionList[self.selectedConvIndex].outputUnit
        inputDisplay.text = conversionList[self.selectedConvIndex].inputUnit
    }


}

