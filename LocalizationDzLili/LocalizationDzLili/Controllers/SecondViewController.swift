//
//  SecondViewController.swift
//  LocalizationDzLili
//
//  Created by Лилия on 5/14/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var name2TextField: UILabel!
    @IBOutlet weak var surname2TextField: UILabel!
    @IBOutlet weak var location2TextField: UILabel!
    @IBOutlet weak var age2TextField: UILabel!
    @IBOutlet weak var sex2TextField: UILabel!
    
    var peopleInfo: People?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        update(info: peopleInfo!)
    }

    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    func update(info: People) {
        name2TextField.text = info.name
        surname2TextField.text = info.surname
        location2TextField.text = info.location
        age2TextField.text = info.age
        sex2TextField.text = info.sex
    }
}
