//
//  SignInView.swift
//  SwiftUIMapApplication
//
//  Created by MSS on 24/04/24.
//

import SwiftUI

struct SignInView: View {
    @State private var userName = ""
    @State private var userPass = ""
    @State private var userWrongUserName = 1
    @State private var userWrongPass = 1
    @State private var isUserFieldActive = false
    @State private var isPassWordFieldActive = false
    var body: some View {
        ScrollView {
            VStack{
                Spacer().frame(height: 40)
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,30)
                    
                Spacer().frame(height: 100)
                Text("Welcome back!")
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                Spacer().frame(height: 40)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit semper nulla nunc bibendum.")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                   
                
                Spacer().frame(height: 70)
               
                
                VStack {
                    TextField("User name", text: $userName)
                        .padding()
                        .frame(height:50)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5) .stroke(isUserFieldActive ? Color.green : Color.gray, lineWidth: 1)
                        )
                        .onTapGesture {
                            isUserFieldActive = true
                            isPassWordFieldActive = false
                        }
                    
                    Spacer().frame(height: 20)
                    TextField("Password", text: $userPass)
                        .padding()
                        .frame(height:50)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5) .stroke(isPassWordFieldActive ? Color.green : Color.gray, lineWidth: 1)
                        )
                        .onTapGesture {
                            isUserFieldActive = false
                            isPassWordFieldActive = true
                    }
                }
                .padding([.leading, .trailing], 20)
                
                Spacer().frame(height: 15)
                
                //without fill button
                Button(action: {
                    
                }) {
                    Text("Forgot Password")
                        .foregroundColor(Color(red: 0.0/255.0, green: 110.0/255.0, blue: 47.0/255.0))
                        .padding(.trailing,20)
                    
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .buttonStyle(PlainButtonStyle())
                
                Spacer().frame(height: 60)
                
                //Fill button
                Button("Sign In"){
                    
                }
                .foregroundColor(.white)
                .frame(width: 236,height:63)
                .background(Color(red: 0.0/255.0, green: 110.0/255.0, blue: 47.0/255.0))
                .cornerRadius(10)
                
                Spacer().frame(height: 70)
                
                HStack{
                    Text("Don’t have an account?")
                        .font(.system(size: 16))
                           .fontWeight(.semibold)
                           .foregroundColor(.primary)
                           .multilineTextAlignment(.center)
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .font(.system(size:14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.0/255.0, green: 110.0/255.0, blue: 47.0/255.0))
                        
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                  
                }
                .frame(maxWidth: .infinity,alignment: .center)
                Spacer().frame(height: 5)
                HStack{
                    Button(action: {
                        
                    }) {
                        Text("Terms & condition  |")
                            .font(.system(size: 13))
                            .fontWeight(.regular)
                            .foregroundColor(Color(hex: 0x707070))
                        
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        
                    }) {
                        Text("Privacy Policy")
                            .font(.system(size: 13))
                            .fontWeight(.regular)
                            .foregroundColor(Color(hex:0x707070))
                        
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: .infinity,alignment: .center)
                
            }
        }
        
    }
}

#Preview {
    SignInView()
}
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
