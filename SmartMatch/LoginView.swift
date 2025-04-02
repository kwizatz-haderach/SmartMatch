//
//  LoginView.swift
//  SmartMatch
//
//  Created by BCE on 2.04.2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @State private var showRegister = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login to SmartMatch")
                .font(.title)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
#warning("Below print will be removed after click tests are implemented")
                print("Login tapped")
                login()
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Button(action: {
                showRegister = true
            }) {
                Text("Don't have an account? Register.")
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .underline()
                    .padding(.top, 10)
            }
            .sheet(isPresented: $showRegister) {
                RegisterView()
            }
            
#warning("Below text field will be removed after login function is fully implemented")
            Text(loginMessage)
                .foregroundColor(.gray)
                .padding()
        }
        .padding()
    }
    
    func login() {
        guard let url = URL(string: "https://your-backend-api.com/login") else {
            loginMessage = "Invalid URL"
            return
        }

        let credentials = ["email": email, "password": password]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: credentials) else {
            loginMessage = "Failed to encode data"
            return
        }

#warning("This block will be removed after login API is ready")
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print("JSON to send: \(jsonString)")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    loginMessage = "Error: \(error.localizedDescription)"
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    loginMessage = "Status: \(httpResponse.statusCode)"
                }
            }
        }.resume()
    }
}

#Preview {
    LoginView()
}
