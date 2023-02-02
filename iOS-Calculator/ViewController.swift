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
        
    }

    // MARCK: - Button Action
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorPlusMinuaAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorSustractionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operationResultAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func numberAction(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }
    
    
    
    
}

