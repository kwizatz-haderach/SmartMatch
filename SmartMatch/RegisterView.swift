//
//  RegisterView.swift
//  SmartMatch
//
//  Created by BCE on 2.04.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.title)
                .bold()

            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
#warning("Below print will be removed after click tests are implemented")
                print("Register tapped")
                // Buraya kayıt API çağrısı gelecek
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

#Preview {
    RegisterView()
}
