//
//  LoginView.swift
//  SmartMatch
//
//  Created by BCE on 2.04.2025.
//

import SwiftUI

struct LoginView: View {
    

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login to SmartMatch")
                .font(.title)
                .bold()

            TextField("Email", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .autocapitalization(.none)

            SecureField("Password", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                print("Login tapped")
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
    
}

#Preview {
    LoginView()
}
