//
//  SplashView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

struct SplashView: View {
    @Binding var isShowing: Bool

    var body: some View {
        VStack {
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200.0, height: 200.0)
                .cornerRadius(30)
                .padding(20)
            Text("LearnAR")
                .font(.system(size: 50))
                .fontWeight(.medium)
                .foregroundColor(Color("AccentColor"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .opacity(isShowing ? 1 : 0)
    }
}
