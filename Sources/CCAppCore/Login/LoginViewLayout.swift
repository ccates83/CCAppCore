//
//  SwiftUIView.swift
//  
//
//  Created by Connor Cates on 3/1/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0.0, *)
struct LoginViewLayout: View {
    
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Spacer()
            
            TextField("Email", text: self.$email)
            TextField("Password", text: self.$password)

            Spacer()
            
            CommonButton(title: "Login") {
                print("clicked")
            }
            .environmentObject(CommonButtonStyleAttributes())
        }
    }
}

struct LoginViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewLayout()
            .environmentObject(Style())
    }
}
