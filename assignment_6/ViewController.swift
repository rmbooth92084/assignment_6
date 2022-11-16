//
//  ViewController.swift
//  assignment_6
//
//  Created by user227341 on 11/15/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var dateInput: UIDatePicker!
    

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var successLabel: UILabel!
    var valid : [Bool] = []
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Signup Sheet"
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateTextField.inputView = dateInput
        dateInput.datePickerMode = .date
        dateTextField.text = dateFormatter.string(from: dateInput.date)
        
        lastNameTextField.delegate = self
        firstNameTextField.delegate = self
        
        
        validSetup()
    }
    
    func validSetup(){
        var num = 6
        
        for i in 1...num{
            valid.append(false)
        }
        
    }
    func checkFields(){
        valid[0] = lastNameTextField.text!.isEmpty ? false : true
        valid[1] = firstNameTextField.text!.isEmpty ? false : true
        valid[2] = zipTextField.text!.isEmpty ? false : true
        valid[3] = cityTextField.text!.isEmpty ? false : true
        valid[4] = streetTextField.text!.isEmpty ? false : true
        valid[5] = emailTextField.text!.isEmpty ? false : true
        
    }

    @IBAction func datePickerValueChanged(_ sender: Any) {
        dateTextField.text = dateFormatter.string(from: dateInput.date)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        print("Button pressed")
        checkFields()
        //print(lastNameTextField.text)
        var isSuccess = true
        for i in valid{
            print("Item: \(i)")
            if(!i){
                isSuccess = false
            }
        }
        print(isSuccess)
        if(isSuccess){
            successLabel.isHidden = false
        }
        
        
    }
}

