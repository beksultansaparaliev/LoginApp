//
//  User.swift
//  LoginApp
//
//  Created by Masaie on 12/3/22.
//

import Foundation

struct User {
    let user: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            user: "User",
            password: "Password",
            person: Person(
                name: "Beksultan",
                surname: "Saparaliev",
                work: "iOS Developer",
                aboutMe: "i am 27.",
                photo: "myFaceImage"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let work: String
    let aboutMe: String
    let photo: String
}
