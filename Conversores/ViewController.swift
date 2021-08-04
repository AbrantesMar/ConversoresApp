//
//  ViewController.swift
//  Conversores
//
//  Created by Márcio Abrantes on 01/08/2021.
//  Copyright © 2021 Márcio Abrantes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnitOne: UIButton!
    @IBOutlet weak var btUnitTow: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    let measure = [ "Peso", "Moeda", "Distância", "Temperatura" ]
    let typeOfMeasure = [ "Kilograma", "Real", "Metro", "Celsius"]
    let unitOfMeasure = [ "Libra", "Dolar", "Kilômetro" , "Fahrenheit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        var index = 0
        switch lbUnit.text! {
            case measure[3]:
                index = 0
                lbUnit.text = measure[index]
                btUnitOne.setTitle(typeOfMeasure[index], for: .normal)
                btUnitTow.setTitle(unitOfMeasure[index], for: .normal)
            case measure[0]:
                index = 1
                lbUnit.text = measure[index]
                btUnitOne.setTitle(typeOfMeasure[index], for: .normal)
                btUnitTow.setTitle(unitOfMeasure[index], for: .normal)
            case measure[1]:
                index = 2
                lbUnit.text = measure[index]
                btUnitOne.setTitle(typeOfMeasure[index], for: .normal)
                btUnitTow.setTitle(unitOfMeasure[index], for: .normal)
            default:
                index = 3
                lbUnit.text = measure[index]
                btUnitOne.setTitle(typeOfMeasure[index], for: .normal)
                btUnitTow.setTitle(unitOfMeasure[index], for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnitOne {
                btUnitTow.alpha = 0.5
            } else {
                btUnitOne.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
            case measure[3]:
                calcTemperature()
            case measure[0]:
                calcWeight()
            case measure[1]:
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else { return }
        
        let calc = String(temperature * 1.8 + 32.0)
        let calcElse = String((temperature - 32.0) / 1.8)
        
        genericFunc(index: 3, paransOne: calc, paransTow: calcElse)
    }
    
    func calcWeight() {
        calcGeneric(0, mutiplic: 2.2046)
    }
    
    func calcCurrency() {
        calcGeneric(1, mutiplic: 5.23)
    }
    
    func calcDistance() {
        calcGeneric(2, mutiplic: 1000.0)
    }
    
    func calcGeneric(_ index: Int, mutiplic: Double){
        guard let value = Double(tfValue.text!) else { return }
        let calc = String(value / mutiplic)
        let calcElse = String(value * mutiplic)
        
        genericFunc(index: index, paransOne: calc, paransTow: calcElse)
    }
    
    func genericFunc(index: Int, paransOne: String, paransTow: String){
        if btUnitOne.alpha.isEqual(to: 1.0) {
            lbResultUnit.text = typeOfMeasure[index]
            lbResult.text = paransOne
        } else {
            lbResultUnit.text = unitOfMeasure[index]
            lbResult.text = paransTow
        }
    }

}

