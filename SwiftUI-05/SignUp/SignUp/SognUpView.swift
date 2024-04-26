//
//  SognUpView.swift
//  SignUp
//
//  Created by 차지용 on 4/26/24.
//

import SwiftUI

struct Address {
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
}

struct SognUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var address2 = Address()
    @State private var lessThenTwo = false
    @State private var username = ""
    @State private var password = ""


    var body: some View {
        NavigationStack {
            Form {
                Section("Names") {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                Section("Current Address") {
                    TextField("Street Address", text: $address.street)
                    TextField("City", text: $address.city)
                    TextField("{ostalCode", text: $address.postalCode)
                    Toggle(isOn: $lessThenTwo) {
                        Text("Have you lived here for 2+ years")
                    }
                }
                if !lessThenTwo {
                    Section("Previous Address") {
                        TextField("Street Address", text: $address2.street)
                        TextField("City", text: $address2.city)
                        TextField("{ostalCode", text: $address2.postalCode)
                    }
                }
                Section {
                    TextField("Create Username", text: $username)
                    SecureField("Create Password", text: $password)
                }
                Button("Submit") {
                    print("Form sumit action here")
                }
            }
            .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    SognUpView()
}
