//
//  FirstViewController.swift
//  LocalizationDzLili
//
//  Created by Лилия on 5/14/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var people: People?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.borderWidth = 1
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 10
        navigationController?.isNavigationBarHidden = true
        nameTextField.delegate = self
        surnameTextField.delegate = self
        locationTextField.delegate = self
        ageTextField.delegate = self
        sexTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameTextField.text = ""
        surnameTextField.text = ""
        locationTextField.text = ""
        ageTextField.text = ""
        sexTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sexTextField.resignFirstResponder()
    }

    @IBAction func Save(_ sender: Any) {
        if ((nameTextField.text != "") && (surnameTextField.text != "") && (locationTextField.text != "") && (ageTextField.text != "") && (sexTextField.text != "")) {
            people = People(name: nameTextField.text!, surname: surnameTextField.text!, location: locationTextField.text!, age: ageTextField.text!, sex: sexTextField.text!)
             Alert()
        } else {
            AlertError()
        }
    }
    
    func Ok(alert: UIAlertAction) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.peopleInfo = people
    }
    
    func Alert() {
        
        let alertTitle = NSLocalizedString("Attention", comment: "")
        let alertMessage = NSLocalizedString("Are you sure you want to save data?", comment: "")
        let cancelButtonText = NSLocalizedString("Cancel", comment: "")
        let okButtonText = NSLocalizedString("Ok", comment: "")
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okButtonText, style: .default, handler: Ok))
        alert.addAction(UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }
    
    func AlertError() {
        
        let alertTitle = NSLocalizedString("Attention", comment: "")
        let alertMessage = NSLocalizedString("Fields must not be empty!", comment: "")
        //let cancelButtonText = NSLocalizedString("Cancel", comment: "")
        let okButtonText = NSLocalizedString("Ok", comment: "")
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okButtonText, style: .default, handler: nil))
        //alert.addAction(UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }
}
extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
