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
    @State private var registerMessage = ""
    
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
                register()
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
#warning("Below text field will be removed after register function is fully implemented")
            Text(registerMessage)
                .foregroundColor(.gray)
                .padding()
        }
        .padding()
    }
    
    func register() {
        guard let url = URL(string: "https://nonexistent.barkancan.dev/register") else {
            registerMessage = "Invalid URL"
            return
        }

        let user = [
            "name": name,
            "email": email,
            "password": Data(password.utf8).base64EncodedString()
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: user) else {
            registerMessage = "Failed to encode data"
            return
        }

#warning("This block will be removed after register API is ready")
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print("Register JSON to send: \(jsonString)")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

#warning("Logs are going to be reconsidered from this request block later")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    registerMessage = "Error: \(error.localizedDescription)"
                    print("🛑 ERROR: \(error)")
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    registerMessage = "Status Code: \(httpResponse.statusCode)"
                    print("🌐 Response code: \(httpResponse.statusCode)")
                }
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("📦 DATA: \(responseString)")
            }
        }.resume()
    }
    
}

#Preview {
    RegisterView()
}
