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
                aboutMe: """
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.
                """,
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
