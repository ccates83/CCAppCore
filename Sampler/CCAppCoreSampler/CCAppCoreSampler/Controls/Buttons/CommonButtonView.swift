//
//  CommonButtonView.swift
//  CCAppCoreSampler
//
//  Created by Connor Cates on 3/15/22.
//

import SwiftUI
import CCAppCore

struct CommonButtonView: View {
    var body: some View {
        ScrollView {
            VStack {
                CommonButton()
            }
        }
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtonView()
    }
}
