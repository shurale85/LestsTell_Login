//
//  LoginView.swift
//  LestsTell_Login
//
//  Created by NewUSER on 28.06.2021.
//

import SwiftUI

struct LoginView: View {
    @State var isLogged = false
    @State var email = ""
    @State var password = ""
    
    @StateObject var lognViewModel = LoginViewModel()
    
    var body: some View {
        
        ZStack{
            Color.black.opacity(0.9)
            VStack(spacing: 15) {
                
                Text("The story begins")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).colorInvert()
                    .padding()
                Text("Discover an amazing way to write and read stories").colorInvert().font(.footnote)
                Spacer()
                
                TextField("Email", text: $lognViewModel.username)
                    .padding(12)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).colorInvert()
                    .background(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(Color.init(UIColor(red: 0.317, green: 0.317, blue: 0.317, alpha: 1).cgColor))
                    .padding(.horizontal, 20)
                
                SecureField("Password", text: $lognViewModel.password)
                    .padding(12)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).colorInvert()
                    .background(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(Color.init(UIColor(red: 0.317, green: 0.317, blue: 0.317, alpha: 1).cgColor))
                    .padding(.horizontal, 20)
                
                Button(action: {
                    lognViewModel.login()
                    
                }){
                    Text("SIGN IN")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(12)
                        .padding(.horizontal, 108)
                        .foregroundColor(Color.init(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)))
                        .background(Color.init(UIColor(red: 0.961, green: 0.804, blue: 0.475, alpha: 1).cgColor))
                        .cornerRadius(6)
                        
                }.padding(.bottom, 15)
                
                Text("Don't have an account?")
                    .colorInvert()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/).padding(.bottom, 15)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
