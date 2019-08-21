//
//  ModelList.swift
//  LocalizationDzLili
//
//  Created by Лилия on 5/14/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation
import UIKit

class People {
    var name: String
    var surname: String
    var location: String
    var age: String
    var sex: String
    init(name: String, surname: String, location: String, age: String, sex: String) {
        self.name = name
        self.surname = surname
        self.location = location
        self.age = age
        self.sex = sex
    }
}
