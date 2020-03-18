//
//  Dog.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/17/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

class Dog {
    var breed: String!
    var dogName: String!
    var image: UIImage!
    var dp: Int!
    var unlocked: Bool!
    var hiddenInCrafting: Bool!
//    var accessories: [String] = []  // add later
    
    init(breed: String, name: String, imageName: String, dp: Int = 0, unlocked: Bool = false, hidden: Bool = false) {
        self.breed = breed
        self.dogName = name
        self.image = UIImage(named: imageName)
        self.dp = dp
        self.unlocked = unlocked
        self.hiddenInCrafting = hidden
    }
    
    func generateResource() -> (dp: Int, roll: Int) {
        return (dp: self.dp, roll: (Int.random(in: 1...100)))
    }
}

let genericDogNames : [String] = [
    "Max",
    "Fluffy",
    "Rufus",
    "Lilac",
    "Tank",
    "Hank"
]

let dogsDict: [String: Dog] = [
    "mutt": Dog(breed: "Mutt", name: genericDogNames.randomElement()!, imageName: "mutt", dp: 1, unlocked: true),
    "pug": Dog(breed: "Pug", name: genericDogNames.randomElement()!, imageName: "pug", dp: 1),
    "bc": Dog(breed: "Border Collie", name: genericDogNames.randomElement()!, imageName: "borderCollie", dp: 2),
    "aussie": Dog(breed: "Australian Shepherd", name: "Tahoe", imageName: "tahoe", dp: 3),
    "cat": Dog(breed: "Dog?", name: "Lilac", imageName: "lilac", dp: 4)
]
