//
//  ContentView.swift
//  LestsTell_Login
//
//  Created by NewUSER on 28.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    var userDefault = UserDefaults.standard
   
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var showLoginPage = false
    
    var body: some View {
            VStack(spacing: 0){
                //header
                ZStack{
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    Text("www.domain.com")
                        .padding(.horizontal, 50)
                        .cornerRadius(3.0)
                        .foregroundColor(Color.green)
                        .background(RoundedRectangle(cornerRadius: 10))// .frame(maxWidth:.infinity, maxHeight: 10 )
                        .padding(.bottom)

                }
                .frame(height: 60)
             //content
                    NavigationView {
                        VStack(spacing: 0){
                        if status {
                            
                                HomeView()
                            } else {
                                NavigationLink(destination: HomeView(), isActive: $showLoginPage) {EmptyView()}
                                    .navigationBarHidden(true)
                                LoginView()
                            }
                        }
                    }
                    .onAppear{
                        NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                            status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                        }
                    }
            
               //footer
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 20)
                    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
