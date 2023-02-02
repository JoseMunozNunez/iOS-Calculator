//
//  ViewController.swift
//  iOS-Calculator
//
//  Created by Jose Muñoz on 01-02-23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    // Result
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //Numbers
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    //Operators
    
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operationSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    //MARK: - Variables
    
    private var total : Double = 0
    private var temp: Double = 0
    private var operating = false
    private var decimal = false
    private var operation : OperationType = .none
    
    //MARK: - Constantes
    
    private let KDecimalSeparator = Locale.current.decimalSeparator!
    private let KMaxLength = 9
    private let KTotal = "total"
    
    private enum OperationType {
        case none, addiction, substraction, multiplication, division, percent
    }
    
    //Formateo valor auxiliar Total
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.maximumFractionDigits = 100
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    //Formateo valor auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.maximumFractionDigits = 100
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    
    //Formateo de valores por pantalla
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    //Formateador de valores a formato cientifico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operationSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
        numberDecimal.setTitle(KDecimalSeparator, for: .normal)
        
        
        total = UserDefaults.standard.double(forKey: KTotal)
        
        result()
        
        
        
    }
    
    // MARCK: - Button Action
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        
        clear()
        sender.shine()
    }
    @IBAction func operatorPlusMinuaAction(_ sender: UIButton) {
        
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent{
            result()
        }
        
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .division
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .multiplication
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func operatorSustractionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .substraction
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .addiction
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func operationResultAction(_ sender: UIButton) {
        
        result()
        sender.shine()
    }
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count > KMaxLength{
            return
        }
        
        resultLabel.text = resultLabel.text! + KDecimalSeparator
        decimal = true
        
        selectVisualOperation()
        
        sender.shine()
    }
    @IBAction func numberAction(_ sender: UIButton) {
        
        
        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count > KMaxLength {
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // hemos seleccionado una operacion
        if operating{
            total = total == 0 ? temp: total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        // hemos seleccionado decimales
        if decimal{
            currentTemp = "\(currentTemp)\(KDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    
    // limpar valores
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        }else {
            total = 0
            result()
        }
    }
    
    // obtinen el resultado final
    func result() {
        
        switch operation {
        case .none:
            // no hace nada
            break
            
        case .addiction:
            total = total + temp
            break
            
        case .substraction:
            total = total - temp
            break
            
        case .multiplication:
            total = total * temp
            break
            
        case .division:
            total = total / temp
            break
            
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        // formateo en pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > KMaxLength {
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        }else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        operation = .none
        
        selectVisualOperation()
        
        UserDefaults.standard.set(total, forKey: KTotal)
        
        
    }
    
    // muestra la operacion seleccionada
    private func selectVisualOperation() {
        
        if !operating {
            //no esta operando
            operatorAddition.selectOperation(false)
            operationSubstraction.selectOperation(false)
            operatorMultiplication.selectOperation(false)
            operatorDivision.selectOperation(false)
        } else {
            switch operation {
            case .none, .percent:
                operatorAddition.selectOperation(false)
                operationSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .addiction:
                operatorAddition.selectOperation(true)
                operationSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .substraction:
                operatorAddition.selectOperation(false)
                operationSubstraction.selectOperation(true)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .multiplication:
                operatorAddition.selectOperation(false)
                operationSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(true)
                operatorDivision.selectOperation(false)
                break
            case .division:
                operatorAddition.selectOperation(false)
                operationSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(true)
                break
            }
        }
        
        
    }
}
