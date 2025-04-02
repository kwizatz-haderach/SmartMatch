//
//  ContentView.swift
//  SmartMatch
//
//  Created by BCE on 2.04.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    var body: some View {
            VStack(spacing: 20) {
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Text("Welcome to SmartMatch 🤖")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Let AI find your perfect match.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    
#warning("Below print will be removed after click tests are implemented")
                    print("Get Started button tapped")
                    showLogin = true
                }) {
                    Text("Get Started")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .sheet(isPresented: $showLogin) {
                    LoginView()
                }
            }
            .padding()
        }
}

#Preview {
    ContentView()
}
