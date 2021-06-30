//
//  HomeView.swift
//  LestsTell_Login
//
//  Created by NewUSER on 28.06.2021.
//

import SwiftUI

struct HomeView: View {
    @State var isLoggedOut = false
    @StateObject var lvm = LoginViewModel()
    var body: some View {
        Button(action: {
            lvm.logout()
        }) {
            Text("logout")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
